import 'package:get_it/get_it.dart';

Future<void> registerApi<T extends FeatureApi>(T api) async {
  if (!GetIt.I.isRegistered<T>()) {
    GetIt.I.registerLazySingleton<T>(() => api);
  }
}

T getApi<T extends FeatureApi>() {
  return GetIt.I<T>();
}

abstract class FeatureApi {}

abstract class FeatureApiWithRoutes<T extends RouteApi> extends FeatureApi {
  T get routes;
}

abstract class RouteApi {}
