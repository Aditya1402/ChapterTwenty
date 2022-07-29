import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<dynamic>> fetchBooks(String genreType) async {

    // URL
    String url = "https://www.googleapis.com/books/v1/volumes?q=$genreType?_page=4&maxResults=10";
    var response = await http.get(Uri.parse(url));

    // Deserialize JSON into Map & return
    return jsonDecode(response.body)["items"];
  }
}
