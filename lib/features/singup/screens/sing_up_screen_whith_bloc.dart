import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_with_login/features/singup/bloc/signup_bloc.dart';
import 'package:firebase_with_login/features/login/screens/login_screen_whith_bloc.dart';
import 'package:firebase_with_login/utils/form_validator.dart';

class SignUpScreenWithBloc extends StatefulWidget {
  const SignUpScreenWithBloc({super.key});

  @override
  State<SignUpScreenWithBloc> createState() => _SignUpScreenWithBlocState();
}

class _SignUpScreenWithBlocState extends State<SignUpScreenWithBloc> {
  final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc()..add(InitiSingUpScreenEvent()),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }

          if (state is SignUpSuccess) {
            Fluttertoast.showToast(
              msg: 'Sign up successful! Please login.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );

            // الانتقال إلى صفحة تسجيل الدخول بعد نجاح التسجيل
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreenWithBloc(),
                ),
              );
            });
          }
        },
        builder: (context, state) {
          if (state is SignUpLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: SignUpValidator.validateEmail,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          validator: SignUpValidator.validatePassword,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          validator: (value) => SignUpValidator.validateConfirmPassword(
                            _passwordController.text,
                            value,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignUpBloc>().add(
                                      SignUpSubmittedEvent(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text.trim(),
                                        confirmPassword: _confirmPasswordController.text.trim(),
                                      ),
                                    );
                              }
                            },
                            child: const Text('Sign Up'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // النص الجديد
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("If you have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreenWithBloc(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.blue,
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
          );
        },
      ),
    );
  }
}
