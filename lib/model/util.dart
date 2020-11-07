import 'package:http/http.dart' as http;

class Narou {
  static const domain = 'ncode.syosetu.com';
  static const domainR18 = 'novel18.syosetu.com';

  static Future<http.Response> request(String path, {bool isR18}) async {
    return await http.get(
      Uri.https((isR18) ? domain : domainR18, path),
      headers: {'Cookie': 'over18=yes'},
    );
  }

  static Future<NarouFirstResponse> firstRequest(String path) async {
    final response = await request(path);
    return NarouFirstResponse(response, response.isRedirect);
  }
}

class NarouFirstResponse {
  final http.Response response;
  final bool isR18;

  NarouFirstResponse(this.response, this.isR18);
}
