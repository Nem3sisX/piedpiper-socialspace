import 'package:flutter/material.dart';
import 'package:socialspace/screens/home.dart';
import 'package:socialspace/screens/visit.dart';
import 'package:socialspace/util/places.dart';
import 'package:socialspace/widgets/icon_badge.dart';
import 'package:flutter/cupertino.dart';




class Pricing extends StatefulWidget {
  @override
  _PricingState createState() => _PricingState();
}


class _PricingState extends State<Pricing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
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
        ],
      ),
      body: SafeArea(
          child: CupertinoButton(
              child: Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://images.squarespace-cdn.com/content/v1/5c54925892441bfbb9798b16/1552413820939-CLQKPVTDFJ29WE5XKPAY/ke17ZwdGBToddI8pDm48kOI7r29kXq7nn29GD4EUe6IUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYy7Mythp_T-mtop-vrsUOmeInPi9iDjx9w8K4ZfjXt2duYap2lEKrVB28oJukWYMoi8-kjNJZJDg9MjqG19mpyLMW9u6oXQZQicHHG1WEE6fg/SOLID-BG-Blue.jpg?format=2500w"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 80, 0, 0),
                  child: Text(
                    "Buy A Premium Pass",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      CupertinoAlertDialog(
                        title: const Text('You Already have Paid Subscription.'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: const Text('Go Back'),
                            onPressed: () {
                              Navigator.pop(context, 'ok');
                            },
                          ),
                        ],
                      ),

                );
              }
          ),
      ),
    );
  }
}
