import 'dart:collection';
import 'dart:convert';

import 'package:demo/apiIntegration/apiInteration.dart';
import 'package:demo/apiIntegration/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  TextEditingController controller = TextEditingController();
  String url = "https://www.omdbapi.com/?t=avenger&apikey=578b291b";
  List<Movie> movie = [];
  List mlist = [];
  String name = "";
  String actor = "";
  String country = "";
  String poster = "";
  String language = "";
  String awards = "";
  String runtime = "";
  String genre = "";
  String imdb = "";
  Future<String> gtdetail() async {
    var title = await api.getApi(controller.text);
    LinkedHashMap mtitle = title;
    setState(() {
      name = mtitle['Title'];
      actor = mtitle['Actors'];
      poster = mtitle['Poster'];
    });
    print('--------------------' + name);
    return name;
  }

  APIIntegration api = APIIntegration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen"),
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: controller,
                      onChanged: (val) {
                        setState(() {
                          val = controller.text;
                          mo2(val);
                        });
                        movie.clear();
                        movie.remove;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // getmvies(controller.text);
                          mo2(controller.text);
                          movie.clear();
                          movie.remove;
                        });
                      },
                      child: Text('Search')),
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: movie.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(20),
                                      child: Text(movie[index].title)),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: movie[index].ratings.length,
                                      itemBuilder: (context, o) {
                                        return Column(
                                          children: [],
                                        );
                                      })
                                ],
                              ),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Screen2(
                                //               m: movie[index],
                                //             )));
                              },
                            );
                          }))
                ],
              )
            ],
          ),
        ));
  }

  void getMoivies() async {
    var getDetials = await http.get(Uri.parse(
        "https://www.omdbapi.com/?t=" + controller.text + "&apikey=578b291b"));
    var mov = jsonDecode(getDetials.body);
    print(mov);

    setState(() {
      print(movie.length.toString());
      name = mov["Actors"].toString();
    });
    print(name);
  }

  Future<void> mo2(String tit) async {
    var title = await api.movieslist(tit);
    Movie mtitle = title;
    setState(() {
      try {
        Movie m = Movie(
            title: mtitle.title,
            year: mtitle.year,
            rated: mtitle.rated,
            released: mtitle.released,
            runtime: mtitle.runtime,
            genre: mtitle.genre,
            director: mtitle.director,
            writer: mtitle.writer,
            actors: mtitle.actors,
            plot: mtitle.plot,
            language: mtitle.language,
            country: mtitle.country,
            awards: mtitle.awards,
            poster: mtitle.poster,
            ratings: mtitle.ratings,
            metascore: mtitle.metascore,
            imdbRating: mtitle.imdbRating,
            imdbVotes: mtitle.imdbVotes,
            imdbId: mtitle.imdbId,
            type: mtitle.type,
            dvd: mtitle.dvd,
            boxOffice: mtitle.boxOffice,
            production: mtitle.production,
            website: mtitle.website,
            response: mtitle.response);
        movie.add(m);
      } catch (e) {
        Movie m = Movie(
            title: "na",
            year: "na",
            rated: "na",
            released: "na",
            runtime: "na",
            genre: "na",
            director: "na",
            writer: "na",
            actors: "na",
            plot: "na",
            language: "na",
            country: "na",
            awards: "na",
            poster: "na",
            ratings: mtitle.ratings,
            metascore: "na",
            imdbRating: "na",
            imdbVotes: 'na',
            imdbId: "na",
            type: "na",
            dvd: "na",
            boxOffice: "na",
            production: "na",
            website: "na",
            response: "na");
        movie.add(m);
      }
    });
    print('--------------------' + movie.length.toString());

    //return name;
  }
}
