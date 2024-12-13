import 'package:flutter/material.dart';
import 'package:project_frontend/screens/admin_screens/admin_screen.dart';
import 'package:project_frontend/screens/user_screens/user_screen_manager.dart';
import 'package:project_frontend/widgets/textfield.dart';
import 'package:project_frontend/screens/registration_screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_frontend/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen>{
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Center( child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.train_rounded, size: 150,color: Colors.grey,),
          const TextFieldContainer(Icons.email, "Email"),
          const TextFieldContainer(Icons.lock, "Password"),
          const SizedBox(height: 35,),
          ElevatedButton(onPressed: () async{
            String email = context.read<LoginProvider>().email;
            String password = context.read<LoginProvider>().password;
            try{
            await auth.signInWithEmailAndPassword(email: email, password: password);
            context.read<LoginProvider>().emailController.clear();
            context.read<LoginProvider>().passwordController.clear();
            email.substring(0,6) == "admin." ?
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminScreen(),)) :
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UserScreen(),));
            context.read<LoginProvider>().email = "";
            context.read<LoginProvider>().password = "";
            }catch(e){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login Failed: Either email or password is incorrect.")));
            }
            
          }, child: const Text("Login")),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
            }, 
            child: const Text("Register"))
        ],
      ),),
    );
  }
}












// ignore_for_file: use_build_context_synchronously