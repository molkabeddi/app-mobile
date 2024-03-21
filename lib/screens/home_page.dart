import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa2/components/appointment_card.dart';
import 'package:pfa2/components/doctor_card.dart';
import 'package:pfa2/providers/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map<String, dynamic>? user;
  List<Map<String, dynamic>> medCat = [
    {"icon": FontAwesomeIcons.userDoctor, "category": "General"},
    {"icon": FontAwesomeIcons.heartPulse, "category": "Cardiology"},
    {"icon": FontAwesomeIcons.lungs, "category": "Respirations"},
    {"icon": FontAwesomeIcons.hand, "category": "Dermatology"},
    {"icon": FontAwesomeIcons.personPregnant, "category": "Gynecology"},
    {"icon": FontAwesomeIcons.teeth, "category": "Dental"},
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      final response = await DioProvider().getUser(token);
      if (response != null) {
        setState(() {
          user = json.decode(response);
        });
      }
    }
  }



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
                      user != null ? user!['name'] : 'Ameni',
                      style: const TextStyle(
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
              const SizedBox(height: 15),
              const SizedBox(height: 8),
              const Text(
                'category',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(medCat.length, (index) {
                    return Card(
                      margin: const EdgeInsets.only(right: 20),
                      color: Colors.blue,
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
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Appointment Today',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              AppointmentCard(color: Colors.blue),
              const SizedBox(height: 8),
              const Text(
                'Top Doctors',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
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
