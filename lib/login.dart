import 'package:diabetes_project/custom_text_form_field.dart';
import 'package:diabetes_project/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String routeName = 'login screen';
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Center(
                    child: Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                )),
              ),
              SizedBox(height: 30),
              Text('Login to your account',
                  style: TextStyle(color: Colors.grey, fontSize: 17)),
              //SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: CustomTextFromField(
                  label: Text('Email address'),
                  keyboardTybe: TextInputType.emailAddress,
                  icon: Icons.mail_outline_rounded,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter email';
                    }
                    return null;
                  },
                ),
              ),
              CustomTextFromField(
                label: Text('password'),
                icon: Icons.lock_outline,
                keyboardTybe: TextInputType.number,
                isObscure: true,
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
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF324A59),
                          fontSize: 15),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) ;
                  },
                  child: Text('Log in', style: TextStyle(fontSize: 22)),
                  style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(30),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF5063BF)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 17, horizontal: 66))),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: Color(0xFF5063BF)),
                        ))
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
