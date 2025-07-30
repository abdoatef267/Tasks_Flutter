import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_with_login/utils/form_validator.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    on<SignUpReset>(_onSignUpReset);
    on<InitiSingUpScreenEvent>(_onSignUpIniti);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    final errors = SignUpValidator.validateSignUpFields(
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
    );

    if (errors.isNotEmpty) {
      emit(SignUpFailure(errors.values.first));
      return;
    }

    emit(SignUpLoading());

    try {
      await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(SignUpSuccess(event.email));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpFailure('Email already in use'));
      } else if (e.code == 'weak-password') {
        emit(SignUpFailure('Password is too weak'));
      } else {
        emit(SignUpFailure('Sign up failed: ${e.message}'));
      }
    } catch (e) {
      emit(SignUpFailure('Unexpected error: $e'));
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }

  void _onSignUpIniti(InitiSingUpScreenEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }
}
