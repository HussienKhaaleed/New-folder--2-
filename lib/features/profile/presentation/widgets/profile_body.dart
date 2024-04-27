import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/features/on_borading/presentation/widgets/customBtn.dart';
import 'package:project_test/features/profile/data/userdata.dart';
import 'package:project_test/features/profile/presentation/widgets/TextFieldDisplyUserInfo.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String? uid;

  String? fristName;
  String? lastName;

  String? Email;

  List<QueryDocumentSnapshot> data = [];
  @override
  void getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    data.addAll(querySnapshot.docs);
// // DocumentSnapshot<Map<String, dynamic>> users = await FirebaseFirestore.instance.collection('users').doc(uid).get();
// //  final DocumentSnapshot userdoc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    setState(() {
//    fristName = users.get("frist_name");
//    lastName = users.get("last_name");
//  Email = users.get("email");
    });
  }

  Future<UserProfile> getUserProfile(String uid) async {
    DocumentSnapshot docSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return UserProfile.fromData(docSnapshot.data() as Map<String, dynamic>);
  }

  void initState() {
    setState(() {});
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Text(
                'Frist Name',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF07A66FF),
                ),
              ),
              // ProfileScreen(),
              TextFieldDisplyUserInfo(
                userData: data.length > 0 ? data[0].get("frist_name") : "",
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Last Name',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF07A66FF),
                ),
              ),
              TextFieldDisplyUserInfo(
                userData: data.length > 0 ? data[0].get("last_name") : "",
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF07A66FF),
                ),
              ),
              TextFieldDisplyUserInfo(
                userData: data.length > 0 ? data[0].get("email") : "",
              ),
              SizedBox(
                height: 50,
              ),
              CustomBtn(
                text: "Logout",
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  customReplacementNavigate(context, "/login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserProfileData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // User profile data is available
          Map<String, dynamic> userData = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('frist_name: ${userData['frist_name']}'),
              Text('Email: ${userData['email']}'),
              // Display other profile data as needed
            ],
          );
        }
      },
    );
  }

  Future<Map<String, dynamic>> getUserProfileData() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    return userSnapshot.data() as Map<String, dynamic>;
  }
}
