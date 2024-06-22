import 'package:crypto/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/1.gif'),
            const Column(
              children: [
                Text(
                  'The Future',
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Learn more about cryptocurrency, look to',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (_) => false),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 218, 8),
                      borderRadius: BorderRadius.circular(18)),
                  child: const Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
