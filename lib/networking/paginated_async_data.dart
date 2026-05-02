import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_async_data.freezed.dart';

part 'paginated_async_data.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class PaginatedAsyncData<T> with _$PaginatedAsyncData<T> {
  const PaginatedAsyncData._();

  const factory PaginatedAsyncData.success({
    required List<T> data,
    @Default(0) int index,
    @Default(10) int count,
    @Default(true) bool hasMore,
    @Default(false) bool isCached,
  }) = _Success;

  const factory PaginatedAsyncData.error({
    List<T>? data,
    required String error,
    @Default(0) int index,
    @Default(10) int count,
    @Default(true) bool hasMore,
    @Default(false) bool isCached,
  }) = _Error;

  const factory PaginatedAsyncData.loading({
    List<T>? data,
    String? error,
    @Default(0) int index,
    @Default(10) int count,
    @Default(true) bool hasMore,
    @Default(false) bool isCached,
  }) = _Loading;

  const factory PaginatedAsyncData.loadingMore({
    List<T>? data,
    String? error,
    @Default(0) int index,
    @Default(10) int count,
    @Default(true) bool hasMore,
    @Default(false) bool isCached,
  }) = _LoadingMore;

  factory PaginatedAsyncData.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginatedAsyncDataFromJson(json, fromJsonT);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    // This is a workaround for a build_runner issue.
    // this toJson is never called.
    return {};
  }

  /// calls the appropriate widget builder based on the state of the data.
  Widget stateWidgetBuilder({
    required BuildContext context,
    // ignore: avoid_positional_boolean_parameters
    required Widget Function(BuildContext context, List<T> data, bool hasMore)
    onSuccess,
    required Widget Function(BuildContext context, String error, List<T>? data)
    onError,
    required Widget Function(BuildContext context, String? error, List<T>? data)
    onLoading,
    // ignore: avoid_positional_boolean_parameters
    required Widget Function(BuildContext context, List<T> data, bool hasMore)
    onLoadingMore,
  }) {
    return switch (this) {
      _Success<T>(:final data, :final hasMore) => onSuccess(
        context,
        data,
        hasMore,
      ),
      _Error<T>(:final data, :final error) => onError(context, error, data),
      _Loading<T>(:final data, :final error) => onLoading(context, error, data),
      _LoadingMore<T>(:final data, :final hasMore) => onLoadingMore(
        context,
        data ?? [],
        hasMore,
      ),
    };
  }

  bool get isSuccess => this is _Success<T>;

  bool get isLoading => this is _Loading<T>;

  bool get isLoadingMore => this is _LoadingMore<T>;

  bool get hasError => this is _Error<T>;

  String get statusLabel => switch (this) {
    _Success() => 'success',
    _Loading() => 'loading',
    _LoadingMore() => 'loadingMore',
    _Error() => 'error',
  };

  bool get loadingWithCachedData {
    return (this is _Loading || this is _LoadingMore) &&
        (isCached && data != null);
  }

  bool get loadingWithoutCachedData {
    return (this is _Loading || this is _LoadingMore) &&
        (!isCached || data == null);
  }

  static bool anyLoadingWithCachedData(List<PaginatedAsyncData> asyncDataList) {
    return asyncDataList.any((asyncData) => asyncData.loadingWithCachedData);
  }

  static bool anyLoadingWithoutCachedData(
    List<PaginatedAsyncData> asyncDataList,
  ) {
    return asyncDataList.any((asyncData) => asyncData.loadingWithoutCachedData);
  }

  bool get hasData => isSuccess && data?.isNotEmpty == true;

  bool get isEmpty => isSuccess && (data == null || data?.isEmpty == true);

  List<T> get successData {
    if (!isSuccess) {
      throw Exception(
        'Do not request Success data if you are not sure it is success',
      );
    }
    return (this as _Success<T>).data;
  }

  String? get error => hasError ? (this as _Error).error : null;

  static bool anyError(List<PaginatedAsyncData> asyncDataList) {
    return errors(asyncDataList).isNotEmpty;
  }

  static bool anyCached(List<PaginatedAsyncData> asyncDataList) {
    return asyncDataList.any((data) => data.isCached);
  }

  static List<String> errors(List<PaginatedAsyncData> asyncDataList) {
    return asyncDataList
        .where((asyncData) => asyncData.hasError)
        .map((asyncData) => (asyncData as _Error).error)
        .toList();
  }

  static bool anyLoading(List<PaginatedAsyncData> asyncDataList) {
    return asyncDataList.any((asyncData) => asyncData.isLoading);
  }

  static List<String> whoLoading(List<PaginatedAsyncData> asyncDataList) {
    return asyncDataList
        .where((asyncData) => asyncData.isLoading)
        .map((asyncData) => (asyncData as _Loading).runtimeType.toString())
        .toList();
  }

  PaginatedAsyncData<T> toError({required String error}) {
    return PaginatedAsyncData.error(
      error: error,
      data: data,
      index: index,
      count: count,
      hasMore: hasMore,
      isCached: isCached,
    );
  }

  PaginatedAsyncData<T> toLoading() {
    return PaginatedAsyncData.loading(
      data: data,
      index: index,
      count: count,
      hasMore: hasMore,
      isCached: isCached,
    );
  }

  PaginatedAsyncData<T> toLoadingMore() {
    return PaginatedAsyncData.loadingMore(
      data: data,
      index: index,
      count: count,
      hasMore: hasMore,
      isCached: isCached,
    );
  }

  PaginatedAsyncData<T> toCached() {
    return copyWith(isCached: true);
  }

  PaginatedAsyncData<T> take(int count) {
    if (isSuccess) {
      return copyWith(
        data: successData.take(count).toList(),
        hasMore: hasMore || successData.length > count,
      );
    } else {
      return copyWith(
        data: (data ?? <T>[]).take(count).toList(),
        hasMore: hasMore || (data ?? <T>[]).length > count,
      );
    }
  }
}
