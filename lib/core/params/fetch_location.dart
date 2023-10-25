import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/errors/failures.dart';

abstract class FetchLocation {
  Future<Either<Failure, Position>> getLocationAddress();
  Future<String> getAddressFromLatLong(Position position);
}

class FetchLocationImpl implements FetchLocation {
  @override
  Future<Either<Failure, Position>> getLocationAddress() async {
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
      return Right(Position(
          latitude: location.latitude,
          longitude: location.longitude,
          timestamp: location.timestamp,
          accuracy: location.accuracy,
          altitude: location.altitude,
          altitudeAccuracy: location.altitudeAccuracy,
          heading: location.heading,
          headingAccuracy: location.headingAccuracy,
          speed: location.speed,
          speedAccuracy: location.speedAccuracy));
    } on LocationException {
      return Left(LocationFailure());
    }
  }

  @override
  Future<String> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    return '${place.locality},${place.country}';
  }
}
