import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_test/features/home/presentation/widgets/ActivityWidget.dart';

class specificProductPage extends StatefulWidget {
  const specificProductPage({super.key});

  @override
  State<specificProductPage> createState() => _specificProductPageState();
}

  var cart = [];
class _specificProductPageState extends State<specificProductPage> {
  @override
  Query<Map<String, dynamic>> product =
  FirebaseFirestore.instance.collection('Product');



  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: product.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ActivityWidget(
                  icon: FontAwesomeIcons.cartShopping,
                  text: 'Add To Cart',
                  onPressed: () {
                    setState(() {
                      
                    Map productItem = {
                      "url": '${snapshot.data!.docs[index]['url']}',
                      "productName":'${snapshot.data!.docs[index]['productName']}',
                      "price": '${snapshot.data!.docs[index]['price']}',
                    };
                    if (cart.contains(productItem)) {
                      return print('this item is already in cart');
                    } else {
                      setState(() {
                      cart.add(productItem);
                      });
                    }
                    });
                  },
                  url: '${snapshot.data!.docs[index]['url']}',
                  productName: '${snapshot.data!.docs[index]['productName']}',
                  price: '${snapshot.data!.docs[index]['price']}',
                );
              },
            );
          }
          return const Text('Loading');
        },
      ),
    );
  }
}

