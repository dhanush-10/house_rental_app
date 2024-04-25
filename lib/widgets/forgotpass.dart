import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_rental_app/widgets/New_user.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  String email = "";
  TextEditingController mailcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset mail has been successfully sent"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No user Found With email"),
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
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child: Text(
                    "Password Recovery",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter Your Email",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(80.0, 0, 0, 0),
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
                          hintText: "email",
                          border: InputBorder.none,
                          icon: Icon(Icons.people),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = mailcontroller.text;
                        });
                        resetPassword();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFF86469C),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Send Email',
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account?",
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
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0C359E),
                          ),
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
