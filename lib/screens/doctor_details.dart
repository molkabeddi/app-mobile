import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfa2/models/doctor.dart';

const double spaceMedium = 16.0;
const double spaceSmall = 8.0;
const double widthSize = 300.0;

class DoctorDetails extends StatefulWidget {
  final Doctor doctor;
  const DoctorDetails({Key? key, required this.doctor}) : super(key: key);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
        leading: IconButton(
          icon: const FaIcon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: FaIcon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AboutDoctor(
              doctor: widget.doctor,
            ),
            DetailBody(
              doctor: widget.doctor,
            ),
            const Spacer(), // Ajout de Spacer pour pousser le bouton en bas
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('booking_page');
                },
                child: const Text('Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  final Doctor doctor;
  const AboutDoctor({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: NetworkImage(doctor.image),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: spaceMedium),
          Text(
            '${doctor.full_name}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: spaceSmall),
          Container(
            width: widthSize * 0.75,
            child: Text(
              textAlign: TextAlign.center,
              '${doctor.title}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  final Doctor doctor;
  const DetailBody({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: spaceSmall),
          DoctorInfo(
            doctor: doctor,
          ),
          const SizedBox(height: 20), // Ajout d'un espace supplémentaire
          const Text(
            'About Doctor',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10), // Espacement entre les deux textes
          Text(
            "${doctor.description}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  final Doctor doctor;
  const DoctorInfo({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InfoCard(label: 'Patients', value: "${doctor.patients}"),
        InfoCard(label: 'Experiences', value: '${doctor.experiences} years'),
        InfoCard(label: 'Rating', value: '${doctor.rating}'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value}) : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Ajoutez d'autres widgets ici si nécessaire
          ],
        ),
      ),
    );
  }
}
