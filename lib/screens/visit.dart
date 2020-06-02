import 'package:flutter/material.dart';
import 'package:socialspace/screens/home.dart';
import 'package:socialspace/widgets/icon_badge.dart';
import 'package:mock_data/mock_data.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';


class Visit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VisitState();
  }
}

String bookingid = mockString(6, 'a#');

class _VisitState extends State<Visit> {

  TimeOfDay _time = TimeOfDay.now();

  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _timeslot;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }



  final GlobalKey<_VisitState> _formkey = GlobalKey<_VisitState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Visitor Name'),
      maxLength: 25,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }


  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }



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
            onPressed: (){},
          ),
        ],
      ),

      body: Container(
        //height:MediaQuery.of(context).size.height,
//            color: Colors.red,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              _buildName(),
              _buildPhoneNumber(),


              SizedBox(height: 10),
              RaisedButton(
                padding : EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                color: Colors.pink,
                child: Text("Pick A Date"),
                onPressed: () async {
                  var datePicked = await DatePicker.showSimpleDatePicker(
                    context,
                    initialDate: DateTime(2020),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025),
                    dateFormat: "dd-MMMM-yyyy",
                    locale: DateTimePickerLocale.en_us,
                    looping: true,
                  );

                  final snackBar =
                  SnackBar(content: Text("Date Picked $datePicked"));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
//              RaisedButton(
//                child: Text("Show picker widget"),
//                onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (_) => WidgetPage()));
//                },
//              );

              FlatButton(
                padding : EdgeInsets.symmetric(horizontal: 38.0, vertical: 12.0),
                color: Colors.pink,
                onPressed: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: _time,
                      onChange: onTimeChanged,
                      is24HrFormat: false,
                    ),
                  );
                },
                child: Text(
                  "Pick A Time",
                  style: TextStyle(color: Colors.white),
                ),
              ),



              SizedBox(height: 1),
              RaisedButton(
                padding : EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  showDialog(context: context, child:
                  new AlertDialog(
                    title: new Text("Visit Confirmed."),
                    content: new Text("Your Booking ID for visit to 24SEVEN is ${bookingid}. Thanks"),
                  )


                  );

                },
               ),

              SizedBox(height: 1),
              RaisedButton(
                padding : EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                color: Colors.grey,
                child: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {FlutterOpenWhatsapp.sendSingleMessage("919870557838", "Facing Issue! Please Help");},
              ),


            ],
          ),
        ),
      ),
    );
  }
}


