import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_intern_assignment/bloc/cart/cart_bloc.dart';
import 'package:mobile_intern_assignment/bloc/cart/cart_event.dart';
import 'package:mobile_intern_assignment/model/cart_model.dart';
import '../../../constants/const_color.dart';
import '../../../constants/const_image.dart';
import '../../../constants/const_style.dart';
import '../../../model/shoe_model.dart';
import 'button_Custom.dart';

Widget buildItem(
    BuildContext context, Shoes shoes, CartModel cartModel
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
                    "\$${(shoes.price * cartModel.quantity).toStringAsFixed(2)}",
                    style: txt20wb
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    customButton(
                      onTap: () {
                        //button decrease
                        context
                            .read<CartBloc>()
                            .add(DecreaseProduct(cart: cartModel));
                      },
                      image: Image.asset(minusImage,height: 20,),
                      color: gray.withOpacity(0.4),
                    ),
                    const SizedBox(width: 10),
                    Text(cartModel.quantity.toString()),
                    const SizedBox(width: 10),
                    customButton(
                      onTap: () {
                        // button +
                        context
                            .read<CartBloc>()
                            .add(IncreaseProduct(cart: cartModel));
                      },
                      image: Image.asset(plusImage,height: 20,),
                      color: gray.withOpacity(0.4),
                    ),
                    const Spacer(),
                    customButton(
                      onTap: () {
                        // button delete
                        context
                            .read<CartBloc>()
                            .add(RemoveProduct(cartModel.id));
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