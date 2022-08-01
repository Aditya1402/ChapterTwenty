import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = "https://www.googleapis.com/books/v1/volumes?q=flutter";

  static Future<List<dynamic>> fetchBooks() async {
    var result = await http.get(Uri.parse(url));
    return jsonDecode(result.body)['items'];
  }
}
