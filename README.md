
# Firebase With Login - Flutter Project

## Project Overview
This Flutter project demonstrates user authentication using Firebase. It includes:
- User registration (Sign Up) with email & password.
- User login with email & password.
- Form validation using a reusable validator class.
- State management using BLoC pattern.
- Navigation between login and sign-up screens.
- Toast messages for feedback.

---

## Features
- Firebase Authentication integration.
- Email & password validation.
- Password confirmation check.
- Bloc pattern for managing authentication state.
- Smooth user experience with loading indicators and toast messages.
- Navigation from login to sign up and vice versa.
- Automatic redirect to login after successful registration.

---

## Technologies & Packages Used
- Flutter SDK
- firebase_core
- firebase_auth
- flutter_bloc
- fluttertoast
- google_sign_in

---

## Project Structure

```
lib/
├── features/
│   ├── login/
│   │   ├── bloc/
│   │   │   └── login_bloc.dart
│   │   ├── screens/
│   │   │   ├── login_screen.dart
│   │   │   └── login_screen_with_bloc.dart
│   ├── singup/
│   │   ├── bloc/
│   │   │   └── signup_bloc.dart
│   │   ├── screens/
│   │   │   ├── sing_up_screen.dart
│   │   │   └── sing_up_screen_with_bloc.dart
├── utils/
│   └── form_validator.dart
└── my_app.dart
```

---

## How To Run

1. Make sure Flutter is installed and set up on your machine.
2. Clone this repository.
3. Run `flutter pub get` to fetch dependencies.
4. Set up Firebase project and add `google-services.json` for Android and `GoogleService-Info.plist` for iOS.
5. Run `flutter run` to start the app.

---

## Code Highlights

### Form Validator (lib/utils/form_validator.dart)

Reusable form validation methods used in both login and signup forms to keep validation logic clean.

### Bloc Pattern

- `login_bloc.dart` and `signup_bloc.dart` contain event, state, and bloc logic.
- Used BlocProvider and BlocConsumer to manage UI states such as loading, success, and failure.

### Navigation

- After successful sign up, the user is automatically redirected to the Login screen.
- Both login and signup screens have text links to navigate between them (with different colors for actionable words).

---

## Demo Video

[Demo Video](https://github.com/user-attachments/assets/f33f1308-3f26-47b6-aa36-f95699be1b48)  
(Click the link to watch the demo)

---

## Contact

For questions or support, feel free to open an issue or contact me.

---

*Thank you for checking out this project!*
