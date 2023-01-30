import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:services/core/errors/failures.dart';

abstract class MainLocationRepository {
  Future<Either<Position, Failure>> getCurrentLocation();
}
