import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:house_rental_app/widgets/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAQtuHWtg7IcpzcFNbSLHFzt_XhAKoN57s',
          appId: '1:23572013436:android:662e68d4a03bb77ad584f9',
          messagingSenderId: '23572013436',
          projectId: 'projectauth-afa06'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
