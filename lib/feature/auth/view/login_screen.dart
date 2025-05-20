


// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/feature/auth/view/sign_up_screen.dart';
import 'package:projects/widgets/elevated_button_widget.dart';
import 'package:projects/widgets/text_form_field_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SizedBox Mysizedbox = SizedBox(
    height: 10,
  );
  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Mysizedbox,
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Mysizedbox,
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Login to continue using the app',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Mysizedbox,
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Mysizedbox,
              TextFormFiledWidget(
                labelText: 'enter your email',
                controller: widget.emailController,
              ),
              Mysizedbox,
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Mysizedbox,
              TextFormFiledWidget(
                labelText: 'enter your password',
                controller: widget.passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButtonWidget(
                color: Colors.blue,
                text: 'Login',
              ),
              const SizedBox(height: 20),
              ElevatedButtonWidget(
                color: Colors.red,
                text: 'Login With Google',
              ),
              SizedBox(
                height: 20,
              ),  
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text('Don\'t have an account? Sign up')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
