import 'package:flutter/material.dart';
import 'package:project_test/features/cart/presentation/widgets/cart_body.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}


class _CartState extends State<Cart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CartBody();
  }
}