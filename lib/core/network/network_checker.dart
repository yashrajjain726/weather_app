import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
}

class NetworkCheckerImpl implements NetworkChecker {
  final InternetConnectionChecker internetCheck;

  NetworkCheckerImpl({required this.internetCheck});
  @override
  Future<bool> get isConnected => internetCheck.hasConnection;
}
