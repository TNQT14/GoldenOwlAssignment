import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../../constants/const_color.dart';
import '../../../constants/const_image.dart';
import '../../../constants/const_style.dart';
import '../../../model/shoe_model.dart';

Widget itemDetail(
    BuildContext context, Shoes shoes, double width, bool isCart
    ){
  int colorbg = int.parse("0xFF${shoes.color.substring(1,7)}");
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: (width - 40)*1.3,
        width: width-14,
        decoration: BoxDecoration(
          color: Color(colorbg),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Transform.rotate(
            angle: -25 * pi/180,
            child: SimpleShadow(
              child: Image(
                image: NetworkImage(shoes.image),
                // semanticLabel: title,
              ),
              opacity: 0.25,
              color: Colors.black,
              offset: Offset(0, 35),
              sigma: 20,
            ),
          ),
        ),
      ),
      const SizedBox(height: 30,),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(shoes.name, style: txtShoeName,),
      ),
      const SizedBox(height: 30,),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(shoes.description, style: txtShoeDescription,),
      ),
      const SizedBox(height: 20,),
      Row(
        children: [
          Text("${shoes.price}\$", style: txtShoeName,),
          Spacer(),
          SizedBox(
            height: 60,
            width: isCart ? 60 : null,
            child: ElevatedButton(
              onPressed: (){
                if(!isCart){
                  context.read<HomeBloc>().add(AddToCart(id: shoes.id));
                }
              },
              style:  ElevatedButton.styleFrom(
                  backgroundColor: yellow,
                  elevation: 0,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: isCart ? EdgeInsets.zero : null,
              ),
              child: isCart
                  ? Image.asset(checkImage, width: 20, height: 20)
              :Text(
                "Add to cart",
                style: TextStyle(
                  color: black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20,),
    ],
  );
}