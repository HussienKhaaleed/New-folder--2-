import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_test/features/cart/presentation/views/cart_view.dart';
import 'package:project_test/features/home/presentation/views/home_view.dart';
import 'package:project_test/features/profile/presentation/views/profile_view.dart';

class navtest extends StatefulWidget {
  const navtest({super.key});

  @override
  State<navtest> createState() => _navtestState();
}

class _navtestState extends State<navtest> {
  @override
  Widget build(BuildContext context) {
    return Navigation();
  }
}

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selecteedIndex = 0;

  final List<Widget> _widgetOption = [Home(), Cart(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selecteedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
        backgroundColor: Color(0xFF07A66FF),
        title: Center(
          child: Text(
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            _widgetOption.elementAt(_selecteedIndex).toString(),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _widgetOption.elementAt(_selecteedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xFF07A66FF),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFF07A66FF)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Color(0xFF07A66FF)
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUser),
              label: 'Profile',
              backgroundColor: Color(0xFF07A66FF)
            ),
          ],
          currentIndex: _selecteedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
