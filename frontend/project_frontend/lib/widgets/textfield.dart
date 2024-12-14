import 'package:flutter/material.dart';
import 'package:project_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      this.icon,
      this.string,
      {super.key}
      );

  final IconData icon;
  final String string;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Determine the correct controller based on the 'string' label
    final loginProvider = context.read<LoginProvider>();
    TextEditingController controller;
    Function(String) onChanged;

    if (string == "Email") {
      controller = loginProvider.emailController;
      onChanged = loginProvider.enterEmail;
    } else if (string == "Password") {
      controller = loginProvider.passwordController;
      onChanged = loginProvider.enterPassword;
    } else if (string == "Confirm Password") {
      controller = loginProvider.confirmedPasswordController;
      onChanged = loginProvider.enterConfirmedPassword;
    } else if (string == "Name") {
      controller = loginProvider.nameController;
      onChanged = loginProvider.enterName;
    } else if (string == "PhoneNumber") {
      controller = loginProvider.phoneNumberController;
      onChanged = loginProvider.enterPhoneNumber;
    } else {
      // Default to email if something unexpected occurs
      controller = loginProvider.emailController;
      onChanged = loginProvider.enterEmail;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(29),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              onChanged: onChanged,
              obscureText: icon == Icons.lock ? true : false,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintText: string,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
