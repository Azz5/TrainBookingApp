import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CVVTextField extends StatefulWidget {
  @override
  CVVTextFieldState createState() => CVVTextFieldState();
}

class CVVTextFieldState extends State<CVVTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatCreditCardNumber(String input) {
    // Remove any non-digit characters
    String digits = input.replaceAll(RegExp(r'\D'), '');
    // Group digits into chunks of 4
    return digits.replaceAllMapped(RegExp(r'.{1,4}'), (match) => '${match.group(0)} ').trimRight();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 200,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only numbers
          LengthLimitingTextInputFormatter(3), // Maximum length (16 digits + 3 spaces)
        ],
        decoration: InputDecoration(
          labelText: 'CVV',
          hintText: '123',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(Icons.credit_card),
        ),
        onChanged: (value) {
          final formatted = _formatCreditCardNumber(value);
          // Update the text with the formatted value
          _controller.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
          );
        },
      ),
    );
  }
  }