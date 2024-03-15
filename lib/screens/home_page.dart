import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa2/components/appointment_card.dart';
import 'package:pfa2/components/doctor_card.dart';
import 'package:pfa2/utils/config.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> medCat = [
    {"icon": FontAwesomeIcons.userDoctor, "category": "General"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Cardiology"},
    {"icon": FontAwesomeIcons.lungs, "category": "Respirations"},
    {"icon": FontAwesomeIcons.hand, "category": "Dermatology"},
    {"icon": FontAwesomeIcons.personPregnant, "category": "Gynecology"},
    {"icon": FontAwesomeIcons.teeth, "category": "Dental"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'Ameni', // Hard code the user's name here
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/amanda.jpg'),
              ),
              SizedBox(height: 15),
              // Use config.spaceSmall if it's defined in your config class
              // Otherwise, you can use SizedBox with a specific height
              SizedBox(height: 8),
              // Display category name
              const Text(
                'category', // Hard code the category name here
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Display the list of medical categories
              SizedBox(
                height: Config.heightSize * 0.05,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(medCat.length, (index) {
                    return Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Config.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FaIcon(
                              medCat[index]['icon'],
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              medCat[index]['category'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            // Add other widgets related to medical categories here
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Config.spaceSmall,
              const Text(
                'Appointment Today',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Config.spaceSmall,
              AppointmentCard(color: Colors.blue),
              Config.spaceSmall,
              const Text(
                'Top Doctors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              // List of top Doctors
              Config.spaceSmall,
              Column(
                children: List.generate(10, (index) {
                  return DoctorCard(
                    route: 'doc_details',
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
