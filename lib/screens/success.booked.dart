import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pfa2/components/button.dart';

class AppointmentBooked extends StatelessWidget {
  final String status;
  const AppointmentBooked({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/success.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                status == "creation" ? 'Successfully Booked' : "Successfully updated",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            //back to home page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Button(
                width: double.infinity,
                title: 'Back to Home Page',
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false),
                disable: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
