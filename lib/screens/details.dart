import 'package:flutter/material.dart';
import 'package:socialspace/screens/home.dart';
import 'package:socialspace/screens/visit.dart';
import 'package:socialspace/util/places.dart';
import 'package:socialspace/widgets/icon_badge.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:mock_data/mock_data.dart';



class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

int Number =  mockInteger(0, 100);
int Number2 = mockInteger(1,9);

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),

        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
            ),
            onPressed: (){
              showDialog(context: context, child:
              new AlertDialog(
                title: new Text("Notifications"),
                content: new Text("Sorry No New Notifications Right Now!"),
              )
              );
            },
          ),
        ],
      ),

      body:  ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: places == null ? 0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places[index];

                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${place["img"]}",
                      height: 250,
                      width: MediaQuery.of(context).size.width-40,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),


          SizedBox(height: 20),

          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${places[0]["name"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),

                  IconButton(
                    icon: Icon(
                      Icons.bookmark,
                    ),
                    onPressed: (){},
                  ),


                ],
              ),

              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.blueGrey[300],
                  ),

                  SizedBox(width: 3),

                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${places[0]["location"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${places[0]["distance"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 40),


              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 10),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${places[0]["details"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: 30),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "People Present At Store : ${Number}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),


              SizedBox(height: 20),

              const Divider(
                color: Colors.grey,
                height: 30,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  "Safety Index",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 10),

              StepProgressIndicator(
                totalSteps: 10,
                currentStep: Number2,
                selectedColor: Colors.green,
                unselectedColor: Colors.red,
              ),

              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Unsafe        \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t                          Safe",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),



            ],
          ),
        ],
      ),


      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.favorite,
        ),
        onPressed: (){},
      ),

      bottomNavigationBar: Container(
        height: 50,
        child: RaisedButton(
          elevation: 30,
          color: Theme.of(context).accentColor,
          child: Text(
            "Book A Visit",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: ()
    {

              Navigator.of(context).push(
              MaterialPageRoute(
              builder: (_) {
                return Visit();
              },
              ),
              );
          },
        ),
      ),
    );
  }
}
