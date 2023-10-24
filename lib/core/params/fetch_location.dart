import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/params/location.dart';

abstract class FetchLocation {
  Future<Either<Failure, Location>> getLocationAddress();
}

class FetchLocationImpl implements FetchLocation {
  @override
  Future<Either<Failure, Location>> getLocationAddress() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return Right(
          Location(latitude: location.latitude, longitude: location.longitude));
    } on LocationException {
      return Left(LocationFailure());
    }
  }
}
