import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardTextField extends StatefulWidget {
  const CreditCardTextField({super.key, required this.onChanged});
  final ValueChanged<String>? onChanged;
  @override
  CreditCardTextFieldState createState() => CreditCardTextFieldState();
}

class CreditCardTextFieldState extends State<CreditCardTextField> {
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
      width: 400,
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allow only numbers
          LengthLimitingTextInputFormatter(16), // Maximum length (16 digits + 3 spaces)
        ],
        decoration: InputDecoration(
          labelText: 'Credit Card Number',
          hintText: '1234 5678 9012 3456',
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

        // Notify parent widget of the current input
        widget.onChanged!(formatted); // <--- Notify parent here
          
        },
      ),
    );
  }
}
