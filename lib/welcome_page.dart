import 'package:crypto/home/presentation/screen/home_screen.dart';
import 'package:crypto/home/presentation/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/1.gif'),
           Column(
            children: [
              const Text(
                'The Future',
                style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Learn more about cryptocurrency, look to',
                style:  TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(height: 10,),
              Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (_) => false),
              child: const CustomButtom(text: "Get Started")
            ),
          )
            ],
          ),
          
        ],
      ),
    );
  }
}
