import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_intern_assignment/screen/cart/widgets/build_Item.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';
import '../../bloc/cart/cart_state.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../constants/const_color.dart';
import '../../constants/const_image.dart';
import '../../constants/const_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static String routesName = "CartScreen";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double edge = 300;
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc()..add(GetCart()),
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
            WillPopScope(
              onWillPop: () async {
                // Sử dụng Navigator.pop() để quay lại trang trước đó
                Navigator.pop(context);
                return true; // Trả về true để cho phép quay lại
              },

              child: Scaffold(
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
                        BlocBuilder<CartBloc, CartState>(
                            builder: (context,state){
                              double sum =0;
                              if(state is CartLoaded)
                                for(var cart in state.listCart)
                                  for(var shoe in state.listShoes)
                                    if(cart.idItem == shoe.id)
                                      sum += cart.quantity * shoe.price;
                              return Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "\$$sum",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: black
                                    ),),
                                ),
                              );
                            }
                        ),
                      ],
                    )
                ),
                body: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      bool isEmpty = state.listCart.length == 0 ? true: false;
                      print("isEmpty: $isEmpty");
                      return isEmpty ? Center(child: const Text("Your cart is empty."))
                          :RefreshIndicator(
                            onRefresh: () async {
                              (context) {
                                final cartBloc = CartBloc();
                                cartBloc.add(GetCart());
                                return cartBloc;
                              };
                            },
                            child: ListView.builder(
                              itemCount: state.listCart.length,
                              itemBuilder: (context, index) {
                                int indexShoes = state.listShoes.indexWhere(
                                    (element) => element.id == state.listCart[index].idItem);
                                bool isEmpty = state.listShoes[indexShoes] != 0 ? false :true;
                                return buildItem(
                                  context,
                                  state.listShoes[indexShoes],
                                  state.listCart[index],
                                );
                          },
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
