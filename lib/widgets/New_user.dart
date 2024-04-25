import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_rental_app/components/squaretile.dart';
import 'package:house_rental_app/widgets/login.dart';
import 'package:house_rental_app/widgets/second.dart';

class New_User extends StatefulWidget {
  const New_User({super.key});

  @override
  State<New_User> createState() => _New_UserState();
}

class _New_UserState extends State<New_User> {
  //declare variables
  String name = " ";
  String place = " ";
  String email = " ";
  String password = "";
  final _formkey = GlobalKey<FormState>();

  //reg function
  registration() async {
    if (password != "" &&
        namecontroller.text != "" &&
        emailcontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registered Successfully")));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => New(email: email)));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('password is to weak')));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Account already exists')));
        }
      }
    }
  }

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController placecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3FEF7),
      body: SafeArea(
        child: SingleChildScrollView(
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
                              return 'Please Enter a Name';
                            }
                            return null;
                          },
                          controller: namecontroller,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Name"),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a Place';
                            }
                            return null;
                          },
                          controller: placecontroller,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Place"),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a Email';
                            } else if (!(value.contains('@'))) {
                              return "Please enter a Valid email";
                            }
                            return null;
                          },
                          controller: emailcontroller,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter a password';
                            } else if (value.length < 8) {
                              return "password must contains 8 letters";
                            }
                            return null;
                          },
                          controller: passwordcontroller,
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
                    child: GestureDetector(
                      onTap: () => {
                        if (_formkey.currentState!.validate())
                          {
                            setState(() {
                              name = namecontroller.text;
                              email = emailcontroller.text;
                              place = placecontroller.text;
                              password = passwordcontroller.text;
                            }),
                          },
                        registration(),
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF86469C),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => New(email: email),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign up',
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
                        'If You are Existing Owner? ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginWidget()));
                        },
                        child: const Text(
                          'Login Here',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0C359E),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
