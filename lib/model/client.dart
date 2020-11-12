import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;

class FirstResponse {
  final http.Response response;
  final bool isR18;

  FirstResponse(this.response, this.isR18);
}

class NarouClient extends http.BaseClient {
  static const domain = 'ncode.syosetu.com';
  static const domainR18 = 'novel18.syosetu.com';

  final String scope;
  final _inner = http.Client();

  NarouClient(this.scope) : super();

  static wait() => Future.delayed(Duration(milliseconds: 500));

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.followRedirects = false;
    return _inner.send(request);
  }

  Future<FirstResponse> firstRequest(String path) async {
    var isR18 = false;
    var response = await request(path, isR18);
    if (response.statusCode == 301) {
      final redirectUri = Uri.parse(response.headers['location']);
      if (redirectUri.host == domainR18) {
        isR18 = true;
        response = await request(path, isR18);
      }
    }
    if (response.statusCode == 200)
      return FirstResponse(response, isR18);
    else {
      final message = 'Request failed with status: ${response.statusCode}.';
      developer.log(message, name: scope, error: jsonEncode(response));
      throw Exception('$message in $scope');
    }
  }

  Future<http.Response> request(String path, bool isR18) => this.get(
        Uri.https((isR18) ? domainR18 : domain, path),
        headers: {'Cookie': 'over18=yes'},
      );
}
