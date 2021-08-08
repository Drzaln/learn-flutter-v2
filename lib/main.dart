import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/friendSlider.dart';
import 'package:my_app/inspirationSlider.dart';
import 'package:my_app/myCustomAppBar.dart';
import 'package:my_app/nextTripSlider.dart';
import 'package:my_app/secondScreen.dart';
import 'package:my_app/sneakPeekSlider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarBrightness: Brightness.dark,//status bar brigtness
    statusBarIconBrightness:Brightness.dark , //status barIcon Brightness
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/detail': (context) => SecondScreen()
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(88), child: MyCustomAppBar()),
      body: MyCustomBody(),
    );
  }
}

class MyCustomBody extends StatelessWidget {
  const MyCustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Menu(),
          InspirationSlider(),
          SneakPeekSlider(),
          NextTripSlider(),
          FriendSlider()
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RowItem(
            color: 0xFF4ECDC4,
            icon: Icons.airplane_ticket,
            title: 'Flights',
          ),
          RowItem(color: 0xFFFF6B6B, icon: Icons.hotel, title: 'Hotels'),
          RowItem(color: 0xFF1A535C, icon: Icons.train, title: 'Trains'),
          RowItem(color: 0xFFDBDBDB, icon: Icons.menu, title: 'More'),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem(
      {Key? key, required this.color, required this.icon, required this.title})
      : super(key: key);

  final int color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(this.color),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: EdgeInsets.all(8),
          child: Icon(
            this.icon,
            color: Colors.white,
            size: 42,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(this.title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Color(0xFF808080), fontSize: 10),
            ))
      ],
    );
  }
}
