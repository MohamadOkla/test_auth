import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/feature/auth/view/home_screen.dart';
import 'package:projects/widgets/elevated_button_widget.dart';
import 'package:projects/widgets/text_field_widget.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Center(
                child: CircleAvatar(
                  radius: 75,
                  child: Text('Sign Up'),
                ),
              ),
            ),
            TextFieldWidget(
              hintText: 'UserName',
              mycontroller: widget.usernameController,
            ),
            TextFieldWidget(
              hintText: 'Email',
              mycontroller: widget.emailController,
            ),
            TextFieldWidget(
              hintText: 'Password',
              mycontroller: widget.passwordController,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButtonWidget(
                  color: Colors.blue,
                  text: 'Sign Up',
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text.trim(),
                        password: widget.passwordController.text.trim(),
                      );
                      Get.offAll(() => HomeScreen());
                    } on FirebaseAuthException catch (e) {
                      print('FirebaseAuthException: ${e.code} - ${e.message}');
                      Get.snackbar('Error', e.message ?? 'Unknown error');
                    } catch (e) {
                      print('General error: $e');
                      Get.snackbar('Error', e.toString());
                    }
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('do you have an account? Login')),
          ],
        ),
      ),
    );
  }
}
