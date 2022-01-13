import 'package:demo/apiIntegration/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:movie/screen1.dart';

class screen2 extends StatefulWidget {
  Movie m;
  screen2({required this.m});

  @override
  _screen2State createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  bool _isVertical = false;
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        // START

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      height: 500,
                      width: 700,
                      child: Image.network(widget.m.poster,
                          fit: BoxFit.fill, colorBlendMode: BlendMode.modulate),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(19.0, 350.0, 5.0, 5.0),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: widget.m.title,
                                        style: TextStyle(
                                            fontFamily: ('Montserrat'),
                                            color: Colors.white,
                                            fontSize: 35.0,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.m.genre,
                              style: TextStyle(
                                fontFamily: ('Montserrat'),
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purpleAccent.withOpacity(0.3),
                    ),
                    child: Image.asset(
                      'asset/download.png',
                      color: Colors.white,
                      scale: 2.5,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purpleAccent.withOpacity(0.3),
                    ),
                    child: Image.asset(
                      'asset/favorite.png',
                      color: Colors.white,
                      scale: 2.5,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purpleAccent.withOpacity(0.3),
                    ),
                    child: Image.asset(
                      'asset/share.png',
                      color: Colors.white,
                      scale: 2.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.32,
                child: Card(
                  color: Colors.purpleAccent.withOpacity(0.3),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 50,
                          child: RatingBarIndicator(
                            itemPadding: EdgeInsets.all(2),
                            rating: double.parse(
                                    widget.m.ratings[0].value.substring(0, 2)) /
                                2,
                            itemBuilder: (context, index) => Icon(
                              _selectedIcon ?? Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 25.0,
                            unratedColor: Colors.amber.withAlpha(50),
                            direction:
                                _isVertical ? Axis.vertical : Axis.horizontal,
                          ),
                        ),
                        trailing: Text(
                          widget.m.imdbRating,
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          widget.m.ratings[0].source,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Text(
                          widget.m.ratings[0].value,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Rotten Tomatoes',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Text(
                          widget.m.metascore,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Metacritic',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Text(
                          widget.m.metascore,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.33,
                child: Card(
                  color: Colors.purpleAccent.withOpacity(0.3),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'asset/calender.png',
                          scale: 2.2,
                        ),
                        title: Text(
                          widget.m.year,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'asset/earth.png',
                          scale: 2.2,
                        ),
                        title: Text(
                          widget.m.country,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'asset/clock.png',
                          scale: 2.2,
                        ),
                        title: Text(
                          widget.m.runtime,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'asset/sound.png',
                          scale: 2.2,
                        ),
                        title: Text(
                          widget.m.language,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.80,
                child: Card(
                  color: Colors.purpleAccent.withOpacity(0.3),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          'Plot',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.m.plot,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text("Director",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8,
                          children: List<Widget>.generate(
                            widget.m.director.split(",").length,
                            (int idx) {
                              return Chip(
                                  label:
                                      Text(widget.m.director.split(",")[idx]));
                            },
                          ).toList(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text("Actor",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8,
                          children: List<Widget>.generate(
                            widget.m.actors.split(",").length,
                            (int idx) {
                              return Chip(
                                  label: Text(widget.m.actors.split(",")[idx]));
                            },
                          ).toList(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text("Wirter",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8,
                          children: List<Widget>.generate(
                            widget.m.writer.split(",").length,
                            (int idx) {
                              return Chip(
                                  label: Text(widget.m.writer.split(",")[idx]));
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
