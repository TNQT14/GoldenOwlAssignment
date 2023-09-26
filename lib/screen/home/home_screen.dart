import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_intern_assignment/screen/home/widgets/item_Detail.dart';
import 'package:mobile_intern_assignment/services/cart_serivce.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../bloc/home/home_state.dart';
import '../../constants/const_color.dart';
import '../../constants/const_image.dart';
import '../../constants/const_style.dart';
import '../cart/cart_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.isCurrent == true) {
        BlocProvider.of<HomeBloc>(context).add(GetTheProduct());
      }
    });
  }

  @override
  Widget build(BuildContext context)  {

    double width = MediaQuery.of(context).size.width;
    double edge = 300;

    return BlocProvider<HomeBloc>(
        create: (context) {
          final homeBloc = HomeBloc();
          homeBloc.add(GetTheProduct());
          return homeBloc;
        },
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
                          context.read<HomeBloc>().add(GetTheProduct());
                        },
                          icon:BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                            return Stack(
                              children: [
                                Image.asset(cartImage, height: 30),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state is HomeLoaded
                                            ? state.listItem.length.toString()
                                            : "0",
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                        )
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
                              bool isCart = indexShoes != -1 ? true : false;
                              print("isCart home_Screen.dart: $isCart");
                              return itemDetail(
                                context,
                                state.listShoes[index],
                                width,
                                isCart,
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
