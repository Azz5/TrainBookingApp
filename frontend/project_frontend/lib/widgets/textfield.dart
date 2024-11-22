import 'package:flutter/material.dart';
import 'package:project_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';



class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
    this.icon, 
    this.string , 
    {super.key}
    );
  final IconData icon;
  final String string;

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          Icon(icon,color: Colors.grey,),
          const SizedBox(width: 20,),
          Expanded(
            child: TextField(
              controller: string == "Email"? context.read<LoginProvider>().emailController :  
                          string == "Password"? context.read<LoginProvider>().passwordController : 
                          context.read<LoginProvider>().confirmedPasswordController,
              keyboardType: TextInputType.text,
              onChanged: (value)=> string == "Email"? context.read<LoginProvider>().enterEmail(value) : 
                                   string == "Password"? context.read<LoginProvider>().enterPassword(value) :
                                   context.read<LoginProvider>().enterConfirmedPassword(value),
              obscureText: icon == Icons.lock? true : false,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintText: string
              ),
            ),
          ),
        ],
      ),
    );
  }
}