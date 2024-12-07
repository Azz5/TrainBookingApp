import 'package:flutter/material.dart';
import 'package:project_frontend/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:project_frontend/providers/login_provider.dart';

class RegistrationScreen extends StatelessWidget{
  const RegistrationScreen({super.key});

  

  @override
  Widget build(BuildContext context) {



    FirebaseAuth auth = FirebaseAuth.instance;
    
    Future<void> register(String email, String password) async{
      
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Registration is Successful.")));

      }

      
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextFieldContainer(Icons.email, "Email"),
            const TextFieldContainer(Icons.lock, "Password"),
            const TextFieldContainer(Icons.lock, "Confirm Password"),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Cancel")),
                ElevatedButton(onPressed: (){
                  String email = context.read<LoginProvider>().email;
                  String password = context.read<LoginProvider>().password;
                  String confirmedPassword = context.read<LoginProvider>().confirmedPassword;
                  if (password == confirmedPassword){
                    register(email, password);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Unmatched password")));
                  }
                }, 
                child: const Text("Create Account"))
              ],
            )
          ],
        ),
      ),
    );
  }
}













// ignore_for_file: use_build_context_synchronously