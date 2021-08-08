import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Container(
            height: 150,
            child: ListView(
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                BestPlaceItem(
                  image:
                      'https://www.telegraph.co.uk/content/dam/Travel/Destinations/Asia/Indonesia/Jakarta/Jakarta---36-hours---cityscape-xlarge.jpg',
                  name: 'Jakarta',
                  desc: 'See Skyscraper',
                ),
                BestPlaceItem(
                  image:
                      'http://amazingtours.com.bd/wp-content/uploads/2017/05/indonesia-puncak.jpg',
                  name: 'Puncak',
                  desc: 'Chill on the Hill',
                ),
                BestPlaceItem(
                  image:
                      'https://authentic-indonesia.com/wp-content/uploads/2019/05/fam-island-raja-ampat.jpg',
                  name: 'Raja Ampat',
                  desc: 'Vitamin Sea',
                ),
              ],
            ),
          )
        ]));
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
