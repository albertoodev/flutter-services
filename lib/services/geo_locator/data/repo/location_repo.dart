import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '/services/geo_locator/data/data_sources/geo_locator.dart';
import '/core/errors/exceptions.dart';
import '/core/errors/failures.dart';

import '/services/geo_locator/geo_locator.dart';
import 'main_location_repo.dart';

class LocationRepository implements MainLocationRepository {
  final GeoLocatorDateSource geoLocatorDataSource;

  LocationRepository({required this.geoLocatorDataSource});

  @override
  Future<Either<Position, Failure>> getCurrentLocation() async {
    try {
      final position = await geoLocatorDataSource.getCurrentLocation();
      return Left(position);
    } on DisabledLocationException {
      return Right(DisabledLocationFailure());
    } on PermissionsDeniedException {
      return Right(PermissionsDeniedFailure());
    } on PermissionsDeniedForeverException {
      return Right(PermissionsDeniedForeverFailure());
    } catch (_) {
      return Right(UndefinedFailure());
    }
  }
}
