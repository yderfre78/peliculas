import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '4dc4f92e9bc606c3d787dab4d3705a59';
  String _baseUrl = 'api.themoviedb.org';
  String _lenguaje = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
    // print(getPopularMovies());
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endPoint,
        {'api_key': _apiKey, 'languge': _lenguaje, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    final jsonData = await this._getJsonData('3/movie/popular');
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);
    notifyListeners();
  }
}
