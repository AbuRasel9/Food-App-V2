import 'package:flutter/material.dart';
import 'package:food_app/data/auth/auth_repo.dart';
import 'package:food_app/dataModel/auth/login_request.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController=TextEditingController(text: "rakib@gmail.com");
  final _passwordController=TextEditingController(text: "Asd@12345");
  final _phoneController=TextEditingController(text: "01770995451");
  loginApi() async {
    await AuthRepoImpl().login(body: LoginRequest(password: _passwordController.text,email: _emailController.text,phone: _phoneController.text,),);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: "phone",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 15,), TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 15,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: (){
                  loginApi();
                }, child: Text("Login",),),
            )

          ],
        ),
      ),
    );
  }
}
