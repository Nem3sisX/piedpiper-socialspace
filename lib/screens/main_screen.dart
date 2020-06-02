import 'package:flutter/material.dart';
import 'package:socialspace/mainnew.dart';
import 'package:socialspace/screens/home.dart';
import 'package:socialspace/screens/pricing.dart';
import 'package:socialspace/widgets/icon_badge.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

import '../main.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    Widget barIcon(
        {IconData icon = Icons.home, bool badge = false}) {
      return IconButton(
        icon: badge ? IconBadge(icon: icon, size: 24) : Icon(icon, size: 24),
//        color: _page == page
//            ? Theme.of(context).accentColor
//            : Colors.blueGrey[300],
//        onPressed: () => _pageController.jumpToPage(page),
      );
    }

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => Home()),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            InkWell(child: barIcon(icon: Icons.home ),
                onTap : () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return MyApp();
                      },
                    ),
                  );
                }),
            InkWell(child: barIcon(icon: Icons.attach_money, ),
                onTap : () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return Pricing();
                      },
                    ),
                  );
                }),
//            barIcon(icon: Icons.favorite, page: 1),
//            barIcon(icon: Icons.mode_comment, badge: true),
            IconButton(
              icon: new Icon(Icons.call),
              onPressed: (){FlutterOpenWhatsapp.sendSingleMessage("919870557838", "Facing Issue! Please Help");}
            ),
            SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
