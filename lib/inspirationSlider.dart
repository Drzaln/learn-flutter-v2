import 'package:flutter/material.dart';

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
                  Text(
                    'Best Inspiration Place',
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
          Container(
            height: 175,
            child: ListView(
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                BestPlaceItem(image: 'https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2018/08/badung-cover-image1.jpg', name: 'Bandung',),
                BestPlaceItem(image: 'http://static.asiawebdirect.com/m/bangkok/portals/indonesia-holidays-com/homepage/lombok-island/pagePropertiesImage/lombok.jpg', name: 'Lombok',),
                BestPlaceItem(image: 'https://jaunttips.com/wp-content/uploads/2020/04/AdobeStock_84849478-scaled.jpeg', name: 'Bali',),
              ],
            ),
          )
        ]));
  }
}

class BestPlaceItem extends StatelessWidget {
  const BestPlaceItem({Key? key, required this.image, required this.name}) : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.only(left: 8, right: 16),
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
        SizedBox(height: 8,),
        Text(name)
      ],
    );
  }
}
