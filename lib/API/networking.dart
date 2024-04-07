import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> postData(String userID, String selectedOption) async {
    try {
      Map<String, dynamic> payload = {
        "type": selectedOption == 'bc_login' ? 'bc_assisted' : 'bank_assisted',
        "userid": userID,
      };
      print(payload);

      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'source-api-key': 'Mn8O0qFpN0JRBvP0sSkNZQDFr7ftLNak',
          'Res-Fresh-Token': 'F4F8875DD58AD',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
