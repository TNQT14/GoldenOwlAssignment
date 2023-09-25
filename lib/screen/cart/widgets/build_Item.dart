import 'dart:math';
import 'package:flutter/material.dart';
import '../../../constants/const_color.dart';
import '../../../constants/const_image.dart';
import '../../../constants/const_style.dart';
import '../../../model/shoe_model.dart';
import 'button_Custom.dart';

Widget buildItem(
    BuildContext context, Shoes shoes, int cartModel
    ){
  int color = int.parse("0xFF${shoes.color.substring(1, 7)}");
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(360),
              ),
            ),
            Transform.rotate(
              angle: -pi / 8,
              child: Image.network(
                shoes.image,
                height: 120,
                width: 120,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    shoes.name,
                    style: txt18wb
                ),
                const SizedBox(height: 5),
                Text(
                    "\$100",
                    style: txt20wb
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    customButton(
                      onTap: () {

                      },
                      image: Image.asset(minusImage,height: 20,),
                      color: gray.withOpacity(0.4),
                    ),
                    const SizedBox(width: 10),
                    Text("1"),
                    const SizedBox(width: 10),
                    customButton(
                      onTap: () {

                      },
                      image: Image.asset(plusImage,height: 20,),
                      color: gray.withOpacity(0.4),
                    ),
                    const Spacer(),
                    customButton(
                      onTap: () {

                      },
                      image: Image.asset(trashImage,height: 20,),
                      color: yellow,
                    ),
                    const SizedBox(width: 25)
                  ],
                )

              ],
            )
        ),
      ],
    ),
  );
}