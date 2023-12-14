import 'dart:convert';
import 'package:tix_id/constants.dart';
import 'package:tix_id/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const trendingMov = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const topRatedMov = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const upcomingMov = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  
  Future<List<Movie>> getTrendingMov() async {
    final response = await http.get(Uri.parse(trendingMov));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.FromJson(movie)).toList();
    } else {
      throw Exception('Something wrong');
    }
  }

  Future<List<Movie>> getTopRatedMov() async {
    final response = await http.get(Uri.parse(topRatedMov));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.FromJson(movie)).toList();
    } else {
      throw Exception('Something wrong');
    }
  }

    Future<List<Movie>> getUpcomingMov() async {
    final response = await http.get(Uri.parse(upcomingMov));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.FromJson(movie)).toList();
    } else {
      throw Exception('Something wrong');
    }
  }
}