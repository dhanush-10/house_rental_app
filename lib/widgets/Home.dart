import 'package:flutter/material.dart';
import 'package:house_rental_app/widgets/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAD88C6),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('images/house.jpg'),
                      fit: BoxFit.contain),
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  border: Border.all(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Get Your Dream House Here',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              'Explore Your Rent house in the Internet ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginWidget()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Owner',
                      style: TextStyle(
                          fontFamily: AutofillHints.addressCityAndState,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginWidget()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: const Text(
                      'User',
                      style: TextStyle(
                          fontFamily: AutofillHints.addressCityAndState,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
