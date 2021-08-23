import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '4dc4f92e9bc606c3d787dab4d3705a59';
  String _baseUrl = 'api.themoviedb.org';
  String _lenguaje = 'es-ES';
  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'languge': _lenguaje, 'page': '1'});
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    print(decodeData['dates']);
  }
}
