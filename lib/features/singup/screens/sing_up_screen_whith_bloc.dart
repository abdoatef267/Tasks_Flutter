import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_project/features/singup/bloc/signup_bloc.dart';
import 'package:iti_project/nav_feature/nav_examples.dart';
import 'package:iti_project/utils/form_validator.dart';

class SingUpScreenWhithBloc extends StatefulWidget {
  const SingUpScreenWhithBloc({super.key});

  @override
  State<SingUpScreenWhithBloc> createState() => _SingUpScreenWhithBlocState();
}

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

class _SingUpScreenWhithBlocState extends State<SingUpScreenWhithBloc> {
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
              msg: 'Sign up successful! Welcome ${state.email}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
          }
        },
        builder: (context, state) {
          if (state is SignUpLoading) {
            Fluttertoast.showToast(
              msg: 'Signing you up...',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
            );
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SignUpSuccess) {
            // الانتقال بعد النجاح
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FirstScreen()),
              );
            });
          }

          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formKey,
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
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Fluttertoast.showToast(
                                msg: 'Processing your data...',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.orange,
                                textColor: Colors.white,
                              );

                              context.read<SignUpBloc>().add(
                                SignUpSubmittedEvent(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  confirmPassword: _confirmPasswordController.text.trim(),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Please fill all fields correctly',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.redAccent,
                                textColor: Colors.white,
                              );
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                    ],
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
