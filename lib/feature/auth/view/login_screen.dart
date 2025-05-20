import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/feature/auth/view/home_screen.dart';
import 'package:projects/feature/auth/view/sign_up_screen.dart';
import 'package:projects/widgets/text_form_field_widget.dart';
import 'package:projects/widgets/elevated_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.offAll(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Failed', e.message ?? 'Unknown error',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _loginWithGoogle() async {
    // حط هنا كود تسجيل الدخول بجوجل حسب الطريقة اللي تستخدمها
    Get.snackbar('Google Login', 'Login with Google pressed',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07, // نسبة عرض الشاشة
              vertical:
                  size.height * 0.03, // نسبة ارتفاع الشاشة (أفضل من قيمة ثابتة)
            ),
            child: Container(
              padding:
                  EdgeInsets.all(size.width * 0.06), // يعتمد على عرض الشاشة
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.14, // حجم الدائرة حسب عرض الشاشة
                      backgroundColor: Colors.blue.shade50,
                      child: Icon(
                        Icons.lock_open,
                        size: size.width * 0.12,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Welcome Back',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Login to your account',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    TextFormFiledWidget(
                      labelText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.025),
                    TextFormFiledWidget(
                      labelText: 'Password',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.04),
                    ElevatedButtonWidget(
                      color: Colors.blue.shade700,
                      text: 'Login',
                      onPressed: _login,
                    ),
                    SizedBox(height: size.height * 0.03),

                    // كلمة OR مع خطين على الجانبين
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: Text(
                            'OR',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.03),

                    // زر تسجيل الدخول بجوجل
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: Image.asset(
                          'assets/images/logo.png',
                          height: size.height * 0.03,
                          width: size.height * 0.03,
                        ),
                        label: Text(
                          'Login with Google',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015),
                        ),
                        onPressed: _loginWithGoogle,
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey.shade700),
                        ),
                        GestureDetector(
                          onTap: () => Get.offAll(const SignUpScreen()),
                          child: Text(
                            'Sign Up',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
