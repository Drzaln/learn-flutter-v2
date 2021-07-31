import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NextTripSlider extends StatelessWidget {
  const NextTripSlider({Key? key}) : super(key: key);

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
                  Text(
                    'Your Next Trips',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(children: [
                    Text('More',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF498AC1))),
                    Icon(
                      Icons.arrow_right_rounded,
                      color: Color(0xFF498AC1),
                      size: 28,
                    ),
                  ])
                ]),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(right: 16, left: 16),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: <Widget>[
              BestPlaceItem(
                name: 'Romantic Time',
                background: 0xFFFF9F1C,
                image:
                    'http://www.thewowstyle.com/wp-content/uploads/2015/02/romantic-places-1.jpg',
              ),
              BestPlaceItem(
                name: 'Me Time Trip',
                background: 0xFFF28482,
                image:
                    'https://www.cheapoair.com/miles-away/wp-content/uploads/2018/05/SOlo-Travel-4-750x400.jpg',
              ),
              BestPlaceItem(
                name: 'Pump Your Adrenaline',
                background: 0xFF2EC4B6,
                image:
                    'https://www.reunionisland.net/contentimages/www.reunionisland.net/adrenalin-sports/fs_Rafting.jpg',
              ),
              BestPlaceItem(
                name: 'Family Holiday',
                background: 0xFF293241,
                image:
                    'https://www.proclaiminteractive.com/wp-content/uploads/2019/04/awkward_family_photos.jpg',
              ),
            ],
          ),
        ]));
  }
}

class BestPlaceItem extends StatelessWidget {
  const BestPlaceItem({
    Key? key,
    required this.image, required this.name, required this.background,
  }) : super(key: key);
  final String image;
  final String name;
  final int background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(background)),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 78,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
