import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'inspiration_slider_model.dart';

class InspirationSlider extends StatelessWidget {
  const InspirationSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            margin: EdgeInsets.only(bottom: 18),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Inspiration Place',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                  Row(children: [
                    Text('More',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14, color: Color(0xFF498AC1)))),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      CupertinoIcons.chevron_right,
                      color: Color(0xFF498AC1),
                      size: 16,
                    ),
                  ])
                ]),
          ),
          Container(height: 180, child: ListItem())
        ]));
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  late Future<List<Inspiration>> inspirationData;

  @override
  void initState() {
    super.initState();
    inspirationData = fetchInspiration();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Inspiration>>(
        future: inspirationData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return BestPlaceItem(
                  image: snapshot.data![index].image,
                  name: snapshot.data![index].title,
                );
              },
            );
          }else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}

class BestPlaceItem extends StatelessWidget {
  const BestPlaceItem({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail',
            arguments: ScreenArguments(name, image));
      },
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(left: 8, right: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String image;

  ScreenArguments(this.title, this.image);
}
