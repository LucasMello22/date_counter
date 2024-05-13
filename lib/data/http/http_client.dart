import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class HttpClient implements IHttpClient {

  final client = http.Client();

  @override
  Future get({required String url}) async {
    Map<String, String> headers = {
      'X-Parse-Application-Id': 'DVJw0bEl5n13G8rbj2buEaxjkJv8Cuz8gkKlUsSl',
      'X-Parse-REST-API-Key': 'DIGYxEmbuXADw9Av2Mc8z2HcrFPbM1IuHEwPiy9U',
    };
    return await client.get(Uri.parse(url), headers: headers);

  }
  
}