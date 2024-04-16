import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseseries/screen/loginscreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cpassword = cpasswordController.text.trim();

    if (email == "" || password == " ") {
      debugPrint("Invalid Credentials");
    } else if (cpassword != password) {
      debugPrint("PasswordNOTmATCH");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        debugPrint("User Created");
      } on FirebaseAuthException catch (ex) {
        debugPrint(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                TextField(
                  controller: cpasswordController,
                  decoration:
                      const InputDecoration(hintText: " Confirm Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      createAccount();
                    },
                    child: const Text("Sign Up")),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text("Already SignIn"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
