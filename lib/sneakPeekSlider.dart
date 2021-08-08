import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/sneak_peek_slider_model.dart';

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
                  Text('SneakPeek: Best Spot Place',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                ]),
          ),
          Container(height: 100, child: ListItem())
        ]));
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  late Future<List<SneakPeek>> sneakData;

  @override
  void initState() {
    super.initState();
    sneakData = fetchSneakPeek();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SneakPeek>>(
      future: sneakData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return SneakPeekItem(
                image: snapshot.data![index].image,
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
