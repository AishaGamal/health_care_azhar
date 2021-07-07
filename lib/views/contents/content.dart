import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Content extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool imageFirst;
  const Content(this.text,this.imagePath,this.imageFirst);

  @override
  Widget build(BuildContext context) {

    double imageHeight = 200;
    double textSize = 24;

    var childrenArray = [
      SizedBox(height: imageHeight, child: Image.asset(imagePath),),
      Text(text,textAlign:TextAlign.center,style:TextStyle(fontSize: textSize,fontFamily: 'NatoSans')),
    ];
    if (imageFirst == false)
      {
        childrenArray = [
          Text(text,textAlign:TextAlign.center,style:TextStyle( fontSize: textSize,fontFamily: 'NatoSans')),
          SizedBox(height: imageHeight, child: Image.asset(imagePath),),
        ];
      }

    return ScreenTypeLayout(
      mobile: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 100, child: Image.asset(imagePath),),
            SizedBox(height: 20,),
            Text(text,textAlign:TextAlign.center,style:TextStyle(fontSize: 18,fontFamily: 'NatoSans')),
          ],
        ),

      ),

      tablet: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: childrenArray,
        ),
      ),
    );
  }
}
