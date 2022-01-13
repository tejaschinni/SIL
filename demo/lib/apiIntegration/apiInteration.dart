import 'dart:collection';
import 'dart:convert';

import 'package:demo/apiIntegration/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIIntegration {
  String url = "https://www.omdbapi.com/?t=avenger&apikey=578b291b";

  getApi(String tit) async {
    final response = await http.get(
        Uri.parse("https://www.omdbapi.com/?t=" + tit + "&apikey=578b291b"));
    final movies = jsonDecode(response.body);
    print(movies);
    // Movie m = Movie(
    //     title: movies["Title"],
    //     year: movies["Year"],
    //     rated: movies["Rated"],
    //     released: movies["Released"],
    //     runtime: movies["Runtime"],
    //     genre: movies["Genre"],
    //     director: movies["Director"],
    //     writer: movies["Writer"],
    //     actors: movies["Actors"],
    //     plot: movies["Plot"],
    //     language: movies["Language"],
    //     country: movies["Country"],
    //     awards: movies["Awards"],
    //     poster: movies["Poster"],
    //     ratings: movies["Ratings"],
    //     metascore: movies["Metascore"],
    //     imdbRating: movies["ImdbRating"],
    //     imdbVotes: movies["ImdbVotes"],
    //     imdbId: movies["ImdbId"],
    //     type: movies["Type"],
    //     dvd: movies["DVD"],
    //     boxOffice: movies["BoxOffice"],
    //     production: movies["Production"],
    //     website: movies["Website"],
    //     response: movies["Response"]);

    // var movi = [];
    // movi.add(m);
    var movlist = movies;

    return movlist;
  }

  Future<LinkedHashMap> gemovies(String tit) async {
    final response = await http.get(
        Uri.parse("https://www.omdbapi.com/?t=" + tit + "&apikey=578b291b"));
    final movies = jsonDecode(response.body);

    var m = movies;
    return m;
  }

  Future<Movie> movieslist(String tit) async {
    final response = await http.get(
        Uri.parse("https://www.omdbapi.com/?t=" + tit + "&apikey=578b291b"));
    final movies = jsonDecode(response.body);

    Movie m = Movie.fromJson(movies);
    return m;
  }
}
