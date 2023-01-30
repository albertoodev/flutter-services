import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '/core/errors/failures.dart';
import '/services/geo_locator/data/repo/main_location_repo.dart';

class GetCurrentLocation {
  final MainLocationRepository repository;

  GetCurrentLocation({required this.repository});

  Future<Either<Position, Failure>> call() => repository.getCurrentLocation();
}
