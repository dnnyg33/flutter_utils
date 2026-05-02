import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_operation.freezed.dart';

part 'async_operation.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class AsyncOperation<T> with _$AsyncOperation<T> {
  const AsyncOperation._();

  const factory AsyncOperation.success({required T data}) = _Success;

  const factory AsyncOperation.error({required String error, T? data}) = _Error;

  const factory AsyncOperation.processing({T? data, String? error}) =
      _Processing;

  const factory AsyncOperation.idle({T? data}) = _Idle;

  factory AsyncOperation.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$AsyncOperationFromJson(json, fromJsonT);

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
    } else if (this is _Processing<T>) {
      final instance = this as _Processing<T>;
      return {
        'runtimeType': 'processing',
        'data': instance.data != null ? toJsonT(instance.data as T) : null,
        'error': instance.error,
      };
    }
    throw Exception('Unsupported AsyncOperation type');
  }

  bool get isIdle => this is _Idle<T>;

  bool get isProcessing => this is _Processing<T>;

  bool get isSuccess => this is _Success<T>;

  bool get hasError => this is _Error<T>;

  bool get isError => hasError;

  AsyncOperationStatus get status {
    switch (this) {
      case _Idle():
        return AsyncOperationStatus.idle;
      case _Processing():
        return AsyncOperationStatus.processing;
      case _Success():
        return AsyncOperationStatus.success;
      case _Error():
        return AsyncOperationStatus.error;
    }
  }

  String? get error => hasError ? (this as _Error).error : null;

  T get successData {
    if (!isSuccess) {
      throw Exception(
        'Do not request Success data if you are not sure it is success',
      );
    }
    return (this as _Success<T>).data;
  }

  static bool anyError(List<AsyncOperation> blocDataList) {
    return errors(blocDataList).isNotEmpty;
  }

  static List<String> errors(List<AsyncOperation> blocDataList) {
    return blocDataList
        .where((blocData) => blocData.hasError)
        .map((blocData) => (blocData as _Error).error)
        .toList();
  }

  static bool anyProcessing(List<AsyncOperation> blocDataList) {
    return blocDataList.none((blocData) => !blocData.isProcessing);
  }

  static List<String> whoProcessing(List<AsyncOperation> blocDataList) {
    return blocDataList
        .where((blocData) => blocData.isProcessing)
        .map((blocData) => (blocData as _Processing).runtimeType.toString())
        .toList();
  }

  AsyncOperation<T> toError({required String error}) {
    return AsyncOperation.error(data: data, error: error);
  }

  AsyncOperation<T> toProcessing() {
    return AsyncOperation.processing(data: data);
  }

  static String? getCurrentError(List<AsyncOperation<Object?>> operationsList) {
    return operationsList
        .firstWhereOrNull((element) => element.hasError)
        ?.error;
  }
}

enum AsyncOperationStatus { idle, processing, success, error }
