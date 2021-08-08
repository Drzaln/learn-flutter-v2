import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/friend_slider_model.dart';

class FriendSlider extends StatelessWidget {
  const FriendSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 38),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            margin: EdgeInsets.only(bottom: 18),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Friends’ Night In',
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
          Container(height: 150, child: ListItem())
        ]));
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  late Future<List<Friend>> nightIn;

  @override
  void initState() {
    super.initState();
    nightIn = fetchFriend();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Friend>>(
      future: nightIn,
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
                desc: snapshot.data![index].desc,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class BestPlaceItem extends StatelessWidget {
  const BestPlaceItem(
      {Key? key, required this.image, required this.name, required this.desc})
      : super(key: key);
  final String image;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Opacity(
          opacity: 0.2,
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 16),
            height: double.infinity,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF000000),
            ),
          ),
        ),
        Positioned(
          left: 24,
          top: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
              SizedBox(
                height: 2,
              ),
              Text(desc,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 11),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
