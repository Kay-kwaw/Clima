import 'package:flutter/material.dart';

class OnboardingScreeen extends StatelessWidget {
  static const String routeName = '/onboarding';
  const OnboardingScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}