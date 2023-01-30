import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';
import 'package:services/services/geo_locator/data/data_sources/geo_locator.dart';
import 'package:services/services/geo_locator/data/repo/location_repo.dart';
import 'package:services/services/geo_locator/data/repo/main_location_repo.dart';
import 'package:services/services/geo_locator/presentation/logic/use_cases/current_location.dart';
import '/services/geo_locator/presentation/logic/providers/location_provider.dart';

class Get {
  // ==============================
  Get._();

  /// [GetIt] instance
  static GetIt? _getIt;

  static GetIt get _instance => _getIt ??= GetIt.instance;
  // ==============================

  ///
  /// add here the init providers
  ///
  static List<SingleChildWidget> get provider => [];

  ///
  /// [LocationProvider] provider
  ///
  static LocationProvider get locationProvider => LocationProvider(
        getLocation: _instance(),
      );

  static Future<void> init() async {
    // ======= app =======
    //_instance.registerSingleton(() => App());
    // ======= use cases =======
    //..location..
    _instance.registerLazySingleton(
      () => GetCurrentLocation(
        repository: _instance(),
      ),
    );
    // ======= repositories =======
    //..location..
    _instance.registerLazySingleton<MainLocationRepository>(
      () => LocationRepository(
        geoLocatorDataSource: _instance(),
      ),
    );
    // ======= data sources =======
    //..location..
    _instance.registerLazySingleton<GeoLocatorDateSource>(
      () => GeoLocatorDataSourceImp(),
    );
    // ======= core =======
    //..network checker..
    // _instance
    //     .registerLazySingleton<NetworkInfo>(() => NetworkChecker(_instance()));
    // ======= external =======
    //..http..
    // _instance.registerLazySingleton(() => http.Client());
    //..internet connection checker..
    // _instance.registerLazySingleton(
    //     () => InternetConnectionChecker.createInstance());
  }
}
