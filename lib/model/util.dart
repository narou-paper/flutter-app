import 'package:http/http.dart' as http;

class NarouClient extends http.BaseClient {
  static const domain = 'ncode.syosetu.com';
  static const domainR18 = 'novel18.syosetu.com';

  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.followRedirects = false;
    return _inner.send(request);
  }

  static Future<NarouFirstResponse> firstRequest(String path) async {
    var client = NarouClient();
    var isR18 = false;
    try {
      var response = await request(path, isR18);
      if (response.statusCode == 301) {
        final redirectUri = Uri.parse(response.headers['location']);
        if (redirectUri.host == domainR18) {
          isR18 = true;
          response = await request(path, isR18);
        }
      }
      return NarouFirstResponse(response, isR18);
    } finally {
      client.close();
    }
  }

  static Future<http.Response> request(String path, bool isR18,
      {NarouClient client}) async {
    client ??= NarouClient();
    return await client.get(
      Uri.https((isR18) ? domainR18 : domain, path),
      headers: {'Cookie': 'over18=yes'},
    );
  }
}

class NarouFirstResponse {
  final http.Response response;
  final bool isR18;

  NarouFirstResponse(this.response, this.isR18);
}
