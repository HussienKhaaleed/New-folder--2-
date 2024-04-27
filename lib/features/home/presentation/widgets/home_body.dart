import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_test/features/home/presentation/widgets/categoryScreen.dart';

class homeBody extends StatefulWidget {
  homeBody({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child:
        categoryScreen(),
        // specificProductPage(),
        // SilderBarSection(),
      ),
    );
  }
}

class SilderBarSection extends StatelessWidget {
  const SilderBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeViewAppBar(),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

class CustomHomeViewAppBar extends StatefulWidget {
  CustomHomeViewAppBar({super.key});

  @override
  State<CustomHomeViewAppBar> createState() => _CustomHomeViewAppBarState();
}

class _CustomHomeViewAppBarState extends State<CustomHomeViewAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Solar Power",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF07A66FF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}