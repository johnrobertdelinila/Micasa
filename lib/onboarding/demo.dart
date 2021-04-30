
import 'package:flutter/material.dart';

import 'content_card.dart';
import 'gooey_carousel.dart';

class GooeyEdgeDemo extends StatefulWidget {
  GooeyEdgeDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GooeyEdgeDemoState createState() => _GooeyEdgeDemoState();
}

class _GooeyEdgeDemoState extends State<GooeyEdgeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          ContentCard(
            color: 'Red',
            altColor: Color(0xFF4259B2),
            title: "Experience Travel",
            subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
          ),
          ContentCard(
            color: 'Yellow',
            altColor: Color(0xFF904E93),
            title: "Visit Places",
            subtitle:
            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable.',
          ),
          ContentCard(
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            title: "Feel at Home",
            subtitle:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
          ),
        ],
      ),
    );
  }
}