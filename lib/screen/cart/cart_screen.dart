import 'package:flutter/material.dart';
import 'package:mobile_intern_assignment/screen/cart/widgets/build_Item.dart';
import '../../constants/const_color.dart';
import '../../constants/const_image.dart';
import '../../constants/const_style.dart';
import '../../model/shoe_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static String routesName = "CartScreen";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double edge = 300;
    return SafeArea(
      child: Stack(
        children: [
          Container(color: white),
          Positioned(
              top: -130,
              left: -180,
              child: Container(
                width: edge,
                height: edge,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(edge/2),
                ),
              )
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 103,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(nikeImage,
                          height: 30,),
                        SizedBox(height: 20,),
                        Text("Our product", style: txtappbar.copyWith(color: black),),
                      ],
                    ),
                    Spacer(),
                    const Text(
                      "\$0",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: black
                      ),),
                  ],
                )
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
                index =5;
                return buildItem(context, shoes1, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
