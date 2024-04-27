import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_test/features/auth/presentation/widgets/custom_toast.dart';
import 'package:project_test/features/home/presentation/widgets/ActivityWidget.dart';
import 'package:project_test/features/home/presentation/widgets/battreyscreen.dart';

class inverterScreen extends StatefulWidget {
  const inverterScreen({super.key});

  @override
  State<inverterScreen> createState() => _inverterScreenState();
}

class _inverterScreenState extends State<inverterScreen> {
  @override
  Query<Map<String, dynamic>> product =
  FirebaseFirestore.instance.collection('Product').orderBy('inv');



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
        title: Text('Inverter',style: TextStyle(color: Colors.white),),backgroundColor: Color(0xFF07A66FF),),
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
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ActivityWidget(
                    icon: FontAwesomeIcons.cartShopping,
                    text: 'Add To Cart',
                    onPressed: () {
                      showToast('Item Added To Cart', Colors.white,);
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
                  ),
                );
              },
            );
          }
          return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF07A66FF),
          backgroundColor: Colors.white,
        ),
      );
        },
      ),
    );
  }
}

