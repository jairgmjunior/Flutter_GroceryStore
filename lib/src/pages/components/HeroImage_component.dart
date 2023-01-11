import 'package:flutter/material.dart';

class HeroImageComponent extends StatefulWidget {
  final String urlImage;
  final GlobalKey imageGk = GlobalKey();

  HeroImageComponent({Key? key, required this.urlImage}) : super(key: key);

  @override
  State<HeroImageComponent> createState() => _HeroImageComponentState();
}

class _HeroImageComponentState extends State<HeroImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: widget.urlImage,
        child: Image.asset(
          widget.urlImage,
          key: widget.imageGk,
        ),
      ),
    );
  }
}
