import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});
  final String imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(imageData, height : 100,fit: BoxFit.cover),
    );
  }
}