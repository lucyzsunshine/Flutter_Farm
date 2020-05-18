import 'package:flutter/material.dart';

Image img1= Image(image:AssetImage("assets/images/menu1.png"),);
Image img2 = Image(image:AssetImage("assets/images/menu2.png"),);
Image img3 = Image(image:AssetImage("assets/images/menu3.png"),);


Card makeListItem (Image img, String label) => new Card(
    child: Column(
      children: [
        img,
        Text( 
          label
        )
      ]
    ) 
);

Widget makeProduceRow() { 
  return Row(
    children:[
    makeListItem(img1, "Meat"),
    makeListItem(img2, "Fruit"),
    makeListItem(img3, "Vegetable"),
    ],
  );
 }

 Widget productRow = makeProduceRow();
