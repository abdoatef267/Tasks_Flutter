## 📁 Files Overview

### 1. `login.dart`

This file contains the **Login Page UI**, which includes:

- `Scaffold`: Provides the structure and background color.
- `Padding`: Adds spacing around the content.
- `Column`: Arranges all widgets vertically.
- `Text`: For titles and instructions.
- `TextField`: For username and password input fields.
- `Icons`: Used inside the text fields (e.g. person, lock).
- `SizedBox`: Used to add vertical space between widgets.
- `ElevatedButton`: Login button with custom background and shape.
- `TextButton`: For "Forgot password?" and "Sign Up" navigation.
- `Navigator.push()`: Navigates to the SignUpPage when "Sign Up" is clicked.

### 2. `signup.dart`

This file contains the **Sign Up Page UI**, which includes:

- `SingleChildScrollView`: Allows vertical scrolling on smaller screens.
- `Center` and `Column`: Centered vertical layout.
- `TextField`: For Username, Email, Password, Confirm Password.
- `Icons`: Used for each field (e.g. person, email, lock).
- `ElevatedButton`: For the "Sign up" action.
- `OutlinedButton`: For "Sign In with Google" (currently inactive).
- `TextButton`: For navigating back to the LoginPage using `Navigator.pop()`.

---

## 🎨 UI Design Concepts Used

- **Padding & Spacing**: Controlled using `Padding` and `SizedBox` to create breathing room between elements.
- **Rounded Corners**: `OutlineInputBorder` and `RoundedRectangleBorder` used to give a smooth UI feel.
- **Colors**: Light purple color for input fields and primary buttons.
- **Responsive Scroll**: `SingleChildScrollView` ensures form doesn't overflow on small screens.

---

## 📌 Notes

- Navigation between pages is handled using the `Navigator` class.
---
