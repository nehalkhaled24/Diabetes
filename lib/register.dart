import 'package:diabetes_project/custom_text_form_field.dart';
import 'package:diabetes_project/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static const String routeName = 'register screen';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 30),
                  child: Center(
                      child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )),
                ),
                Center(
                  child: Text('Create an account here',
                      style: TextStyle(color: Colors.grey, fontSize: 17)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomTextFromField(
                  label: Text('Username'),
                  icon: Icons.person,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter username';
                    }
                    return null;
                  },
                ),
                CustomTextFromField(
                  label: Text('Email address'),
                  keyboardTybe: TextInputType.emailAddress,
                  suffixIcon: Icons.check_circle,
                  color: Color(0xFF5063BF),
                  icon: Icons.mail_outline_rounded,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter email';
                    }
                    return null;
                  },
                ),
                CustomTextFromField(
                  label: Text('password'),
                  keyboardTybe: TextInputType.number,
                  isObscure: true,
                  icon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter password';
                    }
                    if (text.length < 6) {
                      return 'password should be at least 6';
                    }
                    return null;
                  },
                ),
                CustomTextFromField(
                  label: Text('Birth date'),
                  keyboardTybe: TextInputType.number,
                  // icon: Icons.celebration,
                  icon: Icons.wallet_giftcard_rounded,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter Birthdate';
                    }
                    return null;
                  },
                  // suffixIcon: Icons.celebration,
                ),
                CustomTextFromField(
                  label: Text('Gender (male or female)'),
                  icon: Icons.group_outlined,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter Gender';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) ;
                    },
                    child: Text('Sign Up', style: TextStyle(fontSize: 22)),
                    style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(30),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF5063BF)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            vertical: 17, horizontal: 66))),
                  ),
                ),
                Row(children: [
                  Expanded(
                      child: Divider(
                    color: Color(0xFFB1B1B1),
                    thickness: 1,
                    endIndent: 30,
                    indent: 30,
                  )),
                  Text("OR"),
                  Expanded(
                      child: Divider(
                    color: Color(0xFFB1B1B1),
                    thickness: 1,
                    endIndent: 30,
                    indent: 30,
                  )),
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/google.png'),
                      Image.asset('assets/images/facebook.png')
                    ]),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: TextStyle(
                              color: Color(0xFF878787), fontSize: 16)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF5063BF)),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
