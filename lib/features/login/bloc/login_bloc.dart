import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginBloc() : super(LoginInitial()) {
    on<InitLoginScreenEvent>((event, emit) => emit(LoginInitial()));

    on<LoginSubmittedEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(LoginSuccess(email: userCredential.user!.email!));
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
