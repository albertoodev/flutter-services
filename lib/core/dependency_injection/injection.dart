import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;
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
}
