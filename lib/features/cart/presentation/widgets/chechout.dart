import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project_test/core/routers/nav.dart';
import 'package:project_test/features/auth/presentation/widgets/app_tect_form_field.dart';
import 'package:project_test/features/cart/presentation/widgets/button_widget.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  final formkey = GlobalKey<FormState>();
  bool isObscureText = true;
  final List<String> PaymentOption = [
  'Cash on Delivery',
];
String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF07A66FF),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Checkout Details",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF07A66FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Welcome to the Checkout Details! \nThis is where you can confirm all the important information.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Add more decoration..
              ),
              hint: const Text(
                'Select Your Payment Method',
                style: TextStyle(fontSize: 14),
              ),
              items: PaymentOption
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return '   Please Select Your Payment Method.';
                }
                return null;
              },
              onChanged: (value) {
                //Do something when selected item is changed.
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
                      SizedBox(
                        height: 18,
                      ),
                      textformfield(
                        keyboardType: TextInputType.phone,
                        hintText: "Phone",
                        onChanged: (lastName) {},
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      textformfield(
                        hintText: "Address",
                        onChanged: (address) {},
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
                ButtonWidget(
                  height: 50,
                  width: 345,
                  text: 'Confirm Checkout ',
                  backgroundColor: Color(0xFF07A66FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontColor: Colors.white,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      customNavigate(context, '/SucssesfulScreen');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}









