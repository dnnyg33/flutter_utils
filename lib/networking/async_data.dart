import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_data.freezed.dart';

part 'async_data.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class AsyncData<T> with _$AsyncData<T> {
  const AsyncData._();

  const factory AsyncData.success({
    required T data,
    @Default(false) bool isCached,
  }) = _Success;

  const factory AsyncData.error({
    required String error,
    T? data,
    @Default(false) bool isCached,
  }) = _Error;

  const factory AsyncData.loading({
    T? data,
    String? error,
    @Default(false) bool isCached,
  }) = _Loading;

  factory AsyncData.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$AsyncDataFromJson(json, fromJsonT);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    if (this is _Success<T>) {
      final instance = this as _Success<T>;
      return {'runtimeType': 'success', 'data': toJsonT(instance.data)};
    } else if (this is _Error<T>) {
      final instance = this as _Error<T>;
      return {
        'runtimeType': 'error',
        'data': instance.data != null ? toJsonT(instance.data as T) : null,
        'error': instance.error,
      };
    } else if (this is _Loading<T>) {
      final instance = this as _Loading<T>;
      return {
        'runtimeType': 'loading',
        'data': instance.data != null ? toJsonT(instance.data as T) : null,
        'error': instance.error,
      };
    }
    throw Exception('Unsupported AsyncData type');
  }

  /// calls the appropriate widget builder based on the state of the data.
  Widget stateWidgetBuilder({
    required BuildContext context,
    required Widget Function(BuildContext context, T data) onSuccess,
    required Widget Function(BuildContext context, String error, T? data)
    onError,
    required Widget Function(BuildContext context, String? error, T? data)
    onLoading,
  }) {
    switch (this) {
      case _Success<T>(:final data):
        return onSuccess(context, data);
      case _Error<T>(:final data, :final error):
        return onError(context, error, data);
      case _Loading<T>(:final data, :final error):
        return onLoading(context, error, data);
    }
  }

  bool get isSuccess => this is _Success<T>;

  bool get isLoading => this is _Loading<T>;

  bool get hasError => this is _Error<T>;

  String get statusLabel => switch (this) {
    _Success() => 'success',
    _Loading() => 'loading',
    _Error() => 'error',
  };

  bool get loadingWithCachedData {
    return this is _Loading && isCached && data != null;
  }

  bool get loadingWithoutCachedData {
    return this is _Loading && (!isCached || data == null);
  }

  static bool anyLoadingWithCachedData(List<AsyncData> blocDataList) {
    return blocDataList.any((blocData) => blocData.loadingWithCachedData);
  }

  static bool anyLoadingWithoutCachedData(List<AsyncData> blocDataList) {
    return blocDataList.any((blocData) => blocData.loadingWithoutCachedData);
  }

  T get successData {
    if (!isSuccess) {
      throw Exception(
        'Do not request Success data if you are not sure it is success',
      );
    }
    return (this as _Success<T>).data;
  }

  String? get error => hasError ? (this as _Error).error : null;

  static bool anyError(List<AsyncData> blocDataList) {
    return errors(blocDataList).isNotEmpty;
  }

  static bool anyCached(List<AsyncData> blocDataList) {
    return blocDataList.any((data) => data.isCached);
  }

  static List<String> errors(List<AsyncData> blocDataList) {
    return blocDataList
        .where((blocData) => blocData.hasError)
        .map((blocData) => (blocData as _Error).error)
        .toList();
  }

  static bool anyLoading(List<AsyncData> blocDataList) {
    return blocDataList.any((blocData) => blocData.isLoading);
  }

  static List<String> whoLoading(List<AsyncData> blocDataList) {
    return blocDataList
        .where((blocData) => blocData.isLoading)
        .map((blocData) => (blocData as _Loading).runtimeType.toString())
        .toList();
  }

  AsyncData<T> toError({required String error}) {
    return AsyncData.error(data: data, error: error, isCached: isCached);
  }

  AsyncData<T> toLoading() {
    return AsyncData.loading(data: data, isCached: isCached);
  }

  AsyncData<T> toCached() {
    return copyWith(isCached: true);
  }

  AsyncData<P> toPropertyAsyncData<P>(P? Function(AsyncData<T> source) source) {
    final property = source(this);
    return switch (this) {
      _Loading() => AsyncData<P>.loading(data: property, isCached: isCached),
      _Error() => AsyncData<P>.error(
        data: property,
        error: error!,
        isCached: isCached,
      ),
      _Success() => AsyncData<P>.success(
        data: property as P,
        isCached: isCached,
      ),
    };
  }

  static State buildIfReady<StateType extends State, DataOutput>({
    required List<AsyncData> dataList,
    required DataOutput Function() outputBuilder,
    required State state,
  }) {
    final errors = AsyncData.errors(dataList);

    if (errors.isNotEmpty) {
      return (state as dynamic).copyWith(
        output: AsyncData.error(
          error: errors.join(', '),
          data: outputBuilder(),
        ),
      );
    } else if (AsyncData.anyLoading(dataList)) {
      return (state as dynamic).copyWith(
        output: AsyncData.loading(data: outputBuilder()),
      );
    } else {
      return (state as dynamic).copyWith(
        output: AsyncData.success(data: outputBuilder()),
      );
    }
  }

  /// Combines two AsyncData objects into a single AsyncData containing a Record.
  /// Returns error if any has error, loading if any is loading, success if all success.
  static AsyncData<(T1, T2)> combine2<T1, T2>(
    AsyncData<T1> data1,
    AsyncData<T2> data2,
  ) {
    // Check for errors first
    final errorList = [data1, data2].where((d) => d.hasError).toList();
    if (errorList.isNotEmpty) {
      return AsyncData.error(
        error: errors(errorList).join(', '),
        data: data1.isSuccess && data2.isSuccess
            ? (data1.successData, data2.successData)
            : null,
        isCached: data1.isCached || data2.isCached,
      );
    }

    // Check for loading
    if (data1.isLoading || data2.isLoading) {
      return AsyncData.loading(
        data: data1.isSuccess && data2.isSuccess
            ? (data1.successData, data2.successData)
            : null,
        isCached: data1.isCached || data2.isCached,
      );
    }

    // All success
    return AsyncData.success(
      data: (data1.successData, data2.successData),
      isCached: data1.isCached || data2.isCached,
    );
  }

  /// Combines three AsyncData objects into a single AsyncData containing a Record.
  /// Returns error if any has error, loading if any is loading, success if all success.
  static AsyncData<(T1, T2, T3)> combine3<T1, T2, T3>(
    AsyncData<T1> data1,
    AsyncData<T2> data2,
    AsyncData<T3> data3,
  ) {
    final errorList = [data1, data2, data3].where((d) => d.hasError).toList();
    if (errorList.isNotEmpty) {
      return AsyncData.error(
        error: errors(errorList).join(', '),
        data: data1.isSuccess && data2.isSuccess && data3.isSuccess
            ? (data1.successData, data2.successData, data3.successData)
            : null,
        isCached: data1.isCached || data2.isCached || data3.isCached,
      );
    }

    if (data1.isLoading || data2.isLoading || data3.isLoading) {
      return AsyncData.loading(
        data: data1.isSuccess && data2.isSuccess && data3.isSuccess
            ? (data1.successData, data2.successData, data3.successData)
            : null,
        isCached: data1.isCached || data2.isCached || data3.isCached,
      );
    }

    return AsyncData.success(
      data: (data1.successData, data2.successData, data3.successData),
      isCached: data1.isCached || data2.isCached || data3.isCached,
    );
  }

  /// Combines four AsyncData objects into a single AsyncData containing a Record.
  /// Returns error if any has error, loading if any is loading, success if all success.
  static AsyncData<(T1, T2, T3, T4)> combine4<T1, T2, T3, T4>(
    AsyncData<T1> data1,
    AsyncData<T2> data2,
    AsyncData<T3> data3,
    AsyncData<T4> data4,
  ) {
    final errorList = [
      data1,
      data2,
      data3,
      data4,
    ].where((d) => d.hasError).toList();
    if (errorList.isNotEmpty) {
      return AsyncData.error(
        error: errors(errorList).join(', '),
        data:
            data1.isSuccess &&
                data2.isSuccess &&
                data3.isSuccess &&
                data4.isSuccess
            ? (
                data1.successData,
                data2.successData,
                data3.successData,
                data4.successData,
              )
            : null,
        isCached:
            data1.isCached ||
            data2.isCached ||
            data3.isCached ||
            data4.isCached,
      );
    }

    if (data1.isLoading ||
        data2.isLoading ||
        data3.isLoading ||
        data4.isLoading) {
      return AsyncData.loading(
        data:
            data1.isSuccess &&
                data2.isSuccess &&
                data3.isSuccess &&
                data4.isSuccess
            ? (
                data1.successData,
                data2.successData,
                data3.successData,
                data4.successData,
              )
            : null,
        isCached:
            data1.isCached ||
            data2.isCached ||
            data3.isCached ||
            data4.isCached,
      );
    }

    return AsyncData.success(
      data: (
        data1.successData,
        data2.successData,
        data3.successData,
        data4.successData,
      ),
      isCached:
          data1.isCached || data2.isCached || data3.isCached || data4.isCached,
    );
  }

  /// Combines five AsyncData objects into a single AsyncData containing a Record.
  /// Returns error if any has error, loading if any is loading, success if all success.
  static AsyncData<(T1, T2, T3, T4, T5)> combine5<T1, T2, T3, T4, T5>(
    AsyncData<T1> data1,
    AsyncData<T2> data2,
    AsyncData<T3> data3,
    AsyncData<T4> data4,
    AsyncData<T5> data5,
  ) {
    final errorList = [
      data1,
      data2,
      data3,
      data4,
      data5,
    ].where((d) => d.hasError).toList();
    if (errorList.isNotEmpty) {
      return AsyncData.error(
        error: errors(errorList).join(', '),
        data:
            data1.isSuccess &&
                data2.isSuccess &&
                data3.isSuccess &&
                data4.isSuccess &&
                data5.isSuccess
            ? (
                data1.successData,
                data2.successData,
                data3.successData,
                data4.successData,
                data5.successData,
              )
            : null,
        isCached:
            data1.isCached ||
            data2.isCached ||
            data3.isCached ||
            data4.isCached ||
            data5.isCached,
      );
    }

    if (data1.isLoading ||
        data2.isLoading ||
        data3.isLoading ||
        data4.isLoading ||
        data5.isLoading) {
      return AsyncData.loading(
        data:
            data1.isSuccess &&
                data2.isSuccess &&
                data3.isSuccess &&
                data4.isSuccess &&
                data5.isSuccess
            ? (
                data1.successData,
                data2.successData,
                data3.successData,
                data4.successData,
                data5.successData,
              )
            : null,
        isCached:
            data1.isCached ||
            data2.isCached ||
            data3.isCached ||
            data4.isCached ||
            data5.isCached,
      );
    }

    return AsyncData.success(
      data: (
        data1.successData,
        data2.successData,
        data3.successData,
        data4.successData,
        data5.successData,
      ),
      isCached:
          data1.isCached ||
          data2.isCached ||
          data3.isCached ||
          data4.isCached ||
          data5.isCached,
    );
  }

  /// Checks if all AsyncData objects in the list are successful.
  static bool allSuccess(List<AsyncData> dataList) {
    return dataList.every((data) => data.isSuccess);
  }

  /// Combines a list of AsyncData objects with the same type into a single `AsyncData<List<T>>`.
  /// Returns error if any has error, loading if any is loading, success if all success.
  static AsyncData<List<T>> combineList<T>(List<AsyncData<T>> dataList) {
    if (dataList.isEmpty) {
      return AsyncData.success(data: [], isCached: false);
    }

    final errorList = dataList.where((d) => d.hasError).toList();
    if (errorList.isNotEmpty) {
      return AsyncData.error(
        error: errors(errorList).join(', '),
        data: allSuccess(dataList)
            ? dataList.map((d) => d.successData).toList()
            : null,
        isCached: dataList.any((d) => d.isCached),
      );
    }

    if (anyLoading(dataList)) {
      return AsyncData.loading(
        data: allSuccess(dataList)
            ? dataList.map((d) => d.successData).toList()
            : null,
        isCached: dataList.any((d) => d.isCached),
      );
    }

    return AsyncData.success(
      data: dataList.map((d) => d.successData).toList(),
      isCached: dataList.any((d) => d.isCached),
    );
  }

  /// Executes a callback only when all AsyncData objects are successful.
  /// Returns the callback result wrapped in the combined AsyncData state,
  /// or null if not all are successful.
  static R? whenAllSuccess<R>(List<AsyncData> dataList, R Function() callback) {
    if (allSuccess(dataList)) {
      return callback();
    }
    return null;
  }

  /// Combines two AsyncData objects and transforms their success data using a builder function.
  /// Returns error if any has error, loading if any is loading,
  /// success with transformed data if all success.
  static AsyncData<R> combineWith2<T1, T2, R>(
    AsyncData<T1> data1,
    AsyncData<T2> data2,
    R Function(T1, T2) builder,
  ) {
    final combined = combine2(data1, data2);
    return combined.map(
      success: (record) => AsyncData.success(
        data: builder(record.$1, record.$2),
        isCached: combined.isCached,
      ),
      error: () => AsyncData.error(
        error: combined.error!,
        data: null,
        isCached: combined.isCached,
      ),
      loading: () => AsyncData.loading(data: null, isCached: combined.isCached),
    );
  }

  /// Combines three AsyncData objects and transforms their success data using a builder function.
  static AsyncData<R> combineWith3<T1, T2, T3, R>(
    AsyncData<T1> data1,
    AsyncData<T2> data2,
    AsyncData<T3> data3,
    R Function(T1, T2, T3) builder,
  ) {
    final combined = combine3(data1, data2, data3);
    return combined.map(
      success: (record) => AsyncData.success(
        data: builder(record.$1, record.$2, record.$3),
        isCached: combined.isCached,
      ),
      error: () => AsyncData.error(
        error: combined.error!,
        data: null,
        isCached: combined.isCached,
      ),
      loading: () => AsyncData.loading(data: null, isCached: combined.isCached),
    );
  }

  /// Helper method to handle the three states of AsyncData with callbacks.
  R map<R>({
    required R Function(T data) success,
    required R Function() error,
    required R Function() loading,
  }) {
    return switch (this) {
      _Success(:final data) => success(data),
      _Error() => error(),
      _Loading() => loading(),
    };
  }
}
