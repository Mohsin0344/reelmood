import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:realmood/screens/otp_screen.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/pressedwidget.dart';

class PhoneNumberScreen extends StatefulWidget {
  final String email;
  final String password;
  final String fullName;
  const PhoneNumberScreen({Key? key,
  required this.email, required this.password, required this.fullName
  }) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var completeNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          SizedBox(
            height: Get.height * 0.10,
          ),
          Image.asset('assets/logo2.png',
          height: Get.height * 0.15,
          ),

          SizedBox(
            height: Get.height * 0.20,
          ),
          Center(
            child: Container(
              height: Get.height * 0.10,
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05
              ),
              child: IntlPhoneField(
                countryCodeTextColor: secondaryColor.withOpacity(0.5),
                decoration: InputDecoration(
                  counterStyle: TextStyle(
                    color: secondaryColor.withOpacity(0.5)
                  ),
                  fillColor: fifthColor,
                  filled: true,
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: secondaryColor.withOpacity(0.5)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                initialCountryCode: 'PK',
                onChanged: (phone) {
                  print(phone.completeNumber);
                  setState(() {
                    completeNumber = phone.completeNumber;
                  });
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10
        ),
        child: customButton('Create Account', (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtpScreen(
                email: widget.email,
                password: widget.password,
              phoneNumber: completeNumber,
              fullName: widget.fullName,
            )),
          );
        }),
      )
    );
  }
}
