import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_rental_app/components/squaretile.dart';
import 'package:house_rental_app/widgets/Home.dart';
import 'package:house_rental_app/widgets/New_user.dart';
import 'package:house_rental_app/widgets/second.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String email = "", password = "";

  TextEditingController mailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  //sigin method
  userSignin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            content: Text(
              "No user Found For this Email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.purple,
            content: Text(
              "Wrong Password Provided by the user",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3FEF7),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.home,
                  size: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome you to  Owner Sign-in Page',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DancingScript'),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter a Email';
                          } else if (!(value.contains('@'))) {
                            return "Please enter a Valid email";
                          }
                          return null;
                        },
                        controller: mailcontroller,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                      child: TextFormField(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter a password';
                          } else if (value.length < 8) {
                            return "password must contains 8 letters";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Password"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 40.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF86469C),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = mailcontroller.text;
                            password = passwordcontroller.text;
                          });
                        }
                        userSignin();
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => New(
                                    email: email,
                                  )));
                        },
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                      child: Text(
                        'Or Continue with',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Squaretile(imagepath: 'images/google.png'),
                    SizedBox(width: 60),
                    Squaretile(imagepath: 'images/apple.png')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'If You are New Owner? ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => New_User()));
                      },
                      child: const Text(
                        'Register Here',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0C359E),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
