import 'package:flutter/material.dart';



class ImageFotter extends StatefulWidget {
  const ImageFotter({super.key});

  @override
  State<ImageFotter> createState() => _ImageBottonState();
}

class _ImageBottonState extends State<ImageFotter> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
              bottom: -20,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/HomeMaterial/img2.jpg",
                width: 100,
                height: 100,
              ),
            );
  }
}