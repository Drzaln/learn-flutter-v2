import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Container(
          color: Color(0xFFA2D2FF),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, height + 20, 20, 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search items, destinations...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
