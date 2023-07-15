import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  String imageUrl;
  String? answer;
  MyImageWidget({Key? key, required this.imageUrl, this.answer}) : super(key: key);

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
        child:                 Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.topCenter,
          children: [
            FadeInImage(
              placeholder: Image.asset("assets/loading.gif").image,
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: 0,
              right: 0,
              top: answer == null ? -200 : 0,
              bottom: 0,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: answer == null ? null : Colors.black.withOpacity(0.6),
                          // borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text("Answer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                              Divider(
                                height: 2,
                                thickness: 2,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(answer ?? "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
                          )
                        ],
                      ),
                      // child: Center(
                      //     child: Text(answer ?? "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))
                      // ),
                    ),
                )
          ],
        ),
      ),
    );
  }
}
