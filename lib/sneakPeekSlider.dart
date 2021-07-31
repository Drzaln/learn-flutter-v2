import 'package:flutter/material.dart';

class SneakPeekSlider extends StatelessWidget {
  const SneakPeekSlider({Key? key}) : super(key: key);

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
                    'SneakPeek: Best Spot Place',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ]),
          ),
          Container(
            height: 100,
            child: ListView(
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SneakPeekItem(
                  image:
                      'https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2018/08/badung-cover-image1.jpg',
                ),
                SneakPeekItem(
                  image:
                      'http://static.asiawebdirect.com/m/bangkok/portals/indonesia-holidays-com/homepage/lombok-island/pagePropertiesImage/lombok.jpg',
                ),
                SneakPeekItem(
                  image:
                      'https://jaunttips.com/wp-content/uploads/2020/04/AdobeStock_84849478-scaled.jpeg',
                ),
                SneakPeekItem(
                    image:
                        'https://img.jakpost.net/c/2017/08/02/2017_08_02_30495_1501654303._large.jpg')
              ],
            ),
          )
        ]));
  }
}

class SneakPeekItem extends StatelessWidget {
  const SneakPeekItem({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.only(left: 8, right: 16),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: Color(0xFFA2D2FF),
                  width: 2,
                  style: BorderStyle.solid)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
      ],
    );
  }
}
