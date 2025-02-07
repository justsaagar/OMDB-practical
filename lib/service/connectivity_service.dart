import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:omdb_practical/app/helper/extension_helper.dart';

class ConnectivityService {
  ConnectivityService._privateConstructor();

  static final ConnectivityService instance = ConnectivityService._privateConstructor();

  StreamSubscription? listen;

  Future<bool> checkConnection() async {
    Connectivity connectivity = Connectivity();
    List<ConnectivityResult> connectivityResults = await connectivity.checkConnectivity();

    bool isConnected = false;

    for (var connectivityResult in connectivityResults) {
      if (connectivityResult != ConnectivityResult.none) {
        bool isDeviceConnected = await InternetConnection().hasInternetAccess;
        if (isDeviceConnected) {
          isConnected = true;
          'connectivityResult: $connectivityResult'.logs();
          break;
        }
      }
    }

    return isConnected;
  }

  void connectionStream() async {
    if (listen != null) {
      listen!.cancel();
    }
    listen = InternetConnection().onStatusChange.listen((connection) {
      if (connection == InternetStatus.connected) {
        'Internet Connection Status: Connected'.logs();
      } else if (connection == InternetStatus.disconnected) {
        'Internet Connection Status: Disconnected'.logs();
      }
    });
  }
}
