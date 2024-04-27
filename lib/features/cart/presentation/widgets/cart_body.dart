import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/features/home/presentation/widgets/ActivityWidget.dart';
import 'package:project_test/features/home/presentation/widgets/battreyscreen.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: cart.length,
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: ActivityWidget(
                    text: 'Remove',
                    icon: Icons.remove_circle,
                    onPressed: () {
                      setState(() {
                        cart.removeAt(cart.indexOf(cart[index]));
                      });
                    },
                    url: cart[index]['url'],
                    productName: cart[index]['productName'],
                    price: cart[index]['price'],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 30,
                right: 20,
              ),
              child: Row(
                children: [
                  Text(
                    "Total Items : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF07A66FF),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(cart.length.toString(),style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF07A66FF),
                    ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 30,
                right: 20,
              ),
              child: Row(
                children: [
                  Text('Total Price : ',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF07A66FF),
                    ),),
                  SizedBox(
                    width: 100,
                  ),
                  Text(totalpricee().toString() ?? '0',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF07A66FF),
                    ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF07A66FF),
                      ),
                      onPressed: () {
                        if (cart.length != 0) {
                          customNavigate(context, '/checkout');
                        } else {
                          Fluttertoast.showToast(
                              msg: "No Items in Cart",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xFF07A66FF),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Text('Checkout',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int totalpricee() {
  String price = '';
  int test;
  int total = 0;
  for (int i = 0; i < cart.length; i++) {
    price = cart[i]['price'];
    test = int.parse(cart[i]['price']);
    total += test;
  }
  return total;
}
