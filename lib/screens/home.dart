import 'package:flutter/material.dart';
import 'package:socialspace/screens/details.dart';
import 'package:socialspace/util/const.dart';
import 'package:socialspace/widgets/icon_badge.dart';
import 'package:socialspace/util/places.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("socialspace"),
        leading: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            //  print(crypto[0].name);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
            ),
            onPressed: () {
              showDialog(context: context, child:
              new AlertDialog(
                title: new Text("Notifications"),
                content: new Text("Sorry No New Notifications Right Now!"),
              )
              );
            },
          ),
          IconButton(
            icon: IconBadge(
              icon: Icons.brightness_auto,
            ),
            onPressed: () {

            },
          ),





        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "E.g: Departmental Store, Gurgaon",
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            height: 250,
//            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: places == null ? 0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places.reversed.toList()[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    child: Container(
                   height: 500,
                      width: 140,
//                      color: Colors.green,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "${place["img"]}",
                              height: 178,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${place["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 3),
                          Container(
                            width: 140,
                            height: 34,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${place["location"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.blueGrey[300],
                              ),
                              maxLines: 4,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],

                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Details();
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(
            color: Colors.grey,
            height: 60,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: places == null ? 0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, left: 0.0,),
                  child: InkWell(
                    child: Container(
//                      width: 350,
                      height: 80,
//                    color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              "${place["img"]}",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width -130,
                            child: ListView(
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${place["name"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 13,
                                      color: Colors.blueGrey[300],
                                    ),
                                    SizedBox(width: 3),
                                    Container(
                                      width: 260,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${place["location"]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.blueGrey[300],
                                        ),
                                        maxLines: 3,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${place["distance"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return Details();
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
