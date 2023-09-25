import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_intern_assignment/screen/home/widgets/item_Detail.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../bloc/home/home_state.dart';
import '../../constants/const_color.dart';
import '../../constants/const_image.dart';
import '../../constants/const_style.dart';
import '../../model/shoe_model.dart';
import '../cart/cart_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)  {
    double width = MediaQuery.of(context).size.width;
    double edge = 300;
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc()..add(GetTheProduct()),
        child: SafeArea(
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
                        IconButton(onPressed: (){
                          Navigator.pushNamed(context, CartScreen.routesName);
                        },
                            icon: Image.asset(cartImage,height: 30,))
                      ],
                    )
                ),
                body: BlocBuilder<HomeBloc,HomeState>(
                    builder: (context, state){
                      print("State: ${state.toString()}");
                      if(state is HomeLoaded){
                        print("State: $state");
                        return RefreshIndicator(
                          onRefresh: () async{
                            context.read<HomeBloc>().add(GetTheProduct());
                          },
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: state.listShoes.length,
                            itemBuilder: (context, index){
                              int indexShoes = state.listItem.indexWhere(
                                      (element) => element.idItem == state.listShoes[index].id);
                              return itemDetail(
                                context,
                                state.listShoes[index],
                                width,
                                indexShoes != -1,
                              );
                            },),

                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
