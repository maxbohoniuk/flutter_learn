import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  String imageUrl;
  MyImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 8.0,
            spreadRadius: 3.0,
            color: Colors.black26)
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage(
          placeholder: Image.asset("assets/loading.gif").image,
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
