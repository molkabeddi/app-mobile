import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);

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
            const AboutDoctor(),
            const DetailBody(),
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
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/doctor1.jpg'),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: Config.spaceMedium),
          const Text(
            'Dr Ahmed ben amor ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Config.spaceSmall),
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians)',
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

class Config {
  static const double spaceMedium = 16.0;
  static const double spaceSmall = 8.0;
  static const double widthSize = 300.0;
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: Config.spaceSmall),
          const DoctorInfo(),
          const SizedBox(height: 20), // Ajout d'un espace supplémentaire
          const Text(
            'About Doctor',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10), // Espacement entre les deux textes
          const Text(
            'Dr Ahmed ben amor has 10 years of experience in the medical field. He is highly skilled and dedicated to providing the best care for his patients.',
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
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        InfoCard(label: 'Patients', value: '109'),
        InfoCard(label: 'Experiences', value: '10 years'),
        InfoCard(label: 'Rating', value: '4.6'),
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
