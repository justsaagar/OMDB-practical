
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:omdb_practical/app/helper/extension_helper.dart';
import 'package:omdb_practical/service/connectivity_service.dart';


class RestConstants {
  RestConstants._privateConstructor();

  static final RestConstants instance = RestConstants._privateConstructor();

  //     ======================= API baseurl =======================     //
  final String baseUrl = 'https://www.omdbapi.com';
  // final String apiKey = 'b857a95b';

  //     ======================= API EndPoints =======================     //
  final String apiKey = '?apikey=';
}

class RestServices {
  RestServices._privateConstructor();

  static final RestServices instance = RestServices._privateConstructor();

  Map<String, String> headers = {'Content-Type': 'application/json'};

  void showRequestAndResponseLogs(http.Response? response, Map<String, Object> requestData) {
    '•••••••••• Network logs ••••••••••\nRequest code --> ${response?.statusCode} : ${response?.request?.url}\nRequest headers --> $requestData\nResponse headers --> ${response?.headers}\nResponse body --> ${response?.body}\n••••••••••••••••••••••••••••••••••'
        .logs();
  }

  Future<String?>? getRestCall({required String? endpoint, String? addOns, bool addToken = true}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.checkConnection();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.baseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.baseUrl}/$endpoint';

      Uri? requestedUri = Uri.tryParse(requestUrl);

      Response response = await http.get(requestedUri!, headers: headers);
      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          return response.body;
        case 400:
        case 403:
        case 401:
          throw UnauthorizedException();
        case 422:
        case 404:
        case 500:
        case 502:
        case 503:
          '${response.statusCode}'.logs();
          break;
        default:
          '${response.statusCode} : ${response.body}'.logs();
          break;
      }
    } on PlatformException catch (e) {
      'PlatformException in getRestCall --> ${e.message}'.logs();
    } on UnauthorizedException catch (e) {
      'UnauthorizedException in getRestCall --> $e'.logs();
    }
    return responseData;
  }
}
