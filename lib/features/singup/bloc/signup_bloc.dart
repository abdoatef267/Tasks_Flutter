import 'package:bloc/bloc.dart';
import 'package:iti_project/utils/form_validator.dart';
import 'package:meta/meta.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
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

    await Future.delayed(const Duration(seconds: 2));

    if (event.email == 'exists@example.com') {
      emit(SignUpFailure('Email already in use'));
    } else {
      emit(SignUpSuccess(event.email));
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }

  void _onSignUpIniti(InitiSingUpScreenEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }
}
