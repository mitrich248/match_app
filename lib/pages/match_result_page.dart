import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_app/resources/match_data.dart';

class MatchResultPage extends StatefulWidget {
  /// selected sign icon for male
  final Image imgMale;

  /// selected sign icon for female
  final Image imgFemale;

  /// selected sign name for male
  final String nameMale;

  /// selected sign name for female
  final String nameFemale;

  /// selected sign ID for male
  final String idMale;

  /// selected sign ID for female
  final String idFemale;

  MatchResultPage(
      {Key key,
      @required this.imgMale,
      @required this.nameMale,
      @required this.idMale,
      @required this.imgFemale,
      @required this.nameFemale,
      @required this.idFemale})
      : super(key: key);
  @override
  _MatchResultPageState createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage> {
  /// color for selected sign icon in the top widget (active)
  final Color _colorActiveSignIcon = Colors.black;

  /// color for selected sign name
  final Color _colorSelSignName = Color(0xff696677);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0f0b26),
        title: Text('Match Result'),
      ),
      body: Column(
        children: <Widget>[
          /// top panel for selected sign icons, name
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xff0f0b26),
              child:

                  /// selected signs for male and female
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// selected male sign, icon
                  Row(
                    children: <Widget>[
                      /// male icon
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff35aefd),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                'assets/icons/male.png',
                                height: 15,
                              ),
                            )),
                      ),

                      /// selected male sign
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),

                          /// selected male sign icon
                          Transform.rotate(
                              angle: pi / 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffa75df0),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                      angle: -pi / 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                            icon: this.widget.imgMale,
                                            color: _colorActiveSignIcon,
                                            onPressed: () => null),
                                      ),
                                    ),
                                  ],
                                ),
                              )),

                          /// selected male sign name
                          Text(this.widget.nameMale,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _colorSelSignName)),
                          SizedBox(height: 40),
                        ],
                      ),
                    ],
                  ),

                  /// love icon
                  Image.asset('assets/icons/love.png', height: 80),

                  /// selected female sign, icon
                  Row(
                    children: <Widget>[
                      /// selected female sign
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),

                          /// selected female sign icon
                          Transform.rotate(
                              angle: pi / 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffa75df0),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: <Widget>[
                                    Transform.rotate(
                                      angle: -pi / 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                            icon: this.widget.imgFemale,
                                            color: _colorActiveSignIcon,
                                            onPressed: () => null),
                                      ),
                                    ),
                                  ],
                                ),
                              )),

                          /// selected female sign name
                          Text(this.widget.nameFemale,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _colorSelSignName)),
                          SizedBox(height: 40),
                        ],
                      ),

                      /// female icon
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xfffe4086),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                'assets/icons/female.png',
                                height: 15,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// bottom panel for the result in the request to server (match title, description and percentage)
          Expanded(
              flex: 5,
              child: Container(
                color: Color(0xff2a2446),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FutureBuilder<List<MatchModel>>(
                        future:
                            fetchPost(this.widget.idMale, this.widget.idFemale),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            /// list with data
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int i) {
                                  return Column(
                                    children: <Widget>[
                                      /// row with match title and percentage
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          /// match title
                                          Text(
                                            snapshot.data[i].title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff7c7893)),
                                          ),

                                          /// match percentage
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                snapshot.data[i].matchPercent
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Color(0xffc7337a),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '%',
                                                style: TextStyle(
                                                    color: Color(0xffc7337a),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.favorite, color: Color(0xfffc3681),),
                                              Icon(Icons.favorite, color: Color(0xfffc3681),),
                                              Icon(Icons.favorite, color: Color(0xfffc3681),),
                                              Icon(Icons.favorite, color: Color(0xfffc3681),),
                                              Icon(Icons.favorite, color: Color(0xfffc3681),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),

                                      /// match description
                                      Text(
                                        snapshot.data[i].description,
                                        style:
                                            TextStyle(color: Color(0xffc7c3d9)),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  );
                                });
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Center(child: CircularProgressIndicator());
                        })),
              ))
        ],
      ),
    );
  }
}
