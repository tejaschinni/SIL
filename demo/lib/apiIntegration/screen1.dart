import 'package:demo/apiIntegration/apiInteration.dart';
import 'package:demo/apiIntegration/movie.dart';
import 'package:demo/apiIntegration/screen2P.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  TextEditingController name = TextEditingController();
  List<Movie> movie = [];
  String result = '';
  APIIntegration api = APIIntegration();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    result = "$h Hours $m Minutes";

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: TextField(
                      controller: name,
                      onChanged: (value) {
                        setState(() {
                          mo2(name.text);
                        });
                        movie.remove;
                        movie.clear();
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.cancel),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                )),
            Expanded(
                flex: 10,
                child: ListView.builder(
                    itemCount: movie.length,
                    itemBuilder: (context, index) {
                      intToTimeLeft(
                          int.parse(movie[index].runtime.substring(0, 3)) * 60);
                      return InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => screen2(
                                          m: movie[index],
                                        )));
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 330.0,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: movie[index].poster == "//N/A"
                                            ? Container(
                                                child: Text("no image"),
                                              )
                                            : Image.network(
                                                movie[index].poster,
                                                fit: BoxFit.fill,
                                              )),
                                  ),
                                  Positioned(
                                    top: 15,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 20.0, right: 20.0, top: 10),
                                      child: Container(
                                        child: Center(
                                            child: Row(
                                          children: <Widget>[
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              child: Image.asset(
                                                'asset/Star1.png',
                                                scale: 2.5,
                                              ),
                                            ),
                                            Text(
                                              movie[index].ratings[0].value,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    EdgeInsets.fromLTRB(19.0, 5.0, 5.0, 5.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  movie[index].title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: ('Montserrat'),
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.fromLTRB(19.0, 5.0, 5.0, 5.0),
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20.0,
                                      child: Image.asset('asset/clock.png'),
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 5.0, 5.0),
                                      child: Center(
                                        child: Text(
                                          result,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontFamily: ('Montserrat'),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
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

  void clearText() {
    name.clear();
  }
}
