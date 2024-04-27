import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    this.productName,
    super.key,
    this.url,
    this.id,
    this.price,
    this.elevatedButton,
    this.onPressed,
    this.text,
    this.icon,
  });

  final String? url;
  final String? id;
  final String? productName;
  final ElevatedButton? elevatedButton;
  final String? price;
  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: Color(0xFF07A66FF),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                productName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      url!,
                      width: 130.w,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 15,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          Text(
                            'Price: $price EGP',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          ),
                          Align(
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: onPressed,
                                  child: Row(
                                    children: [
                                      Text('$text  '),
                                      Icon(icon),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
