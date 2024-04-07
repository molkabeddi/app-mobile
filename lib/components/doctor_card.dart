import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pfa2/models/doctor.dart';
import 'package:pfa2/screens/doctor_details.dart';
import 'package:pfa2/utils/config.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard({Key? key, required this.doctor}) : super(key: key);
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: Config.screenHeight! * 0.2,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Get.to(DoctorDetails(doctor: doctor));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(doctor.image),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${doctor.full_name}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${doctor.title}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.star_border,
                              color: Colors.red,
                              size: 16,
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Text('${doctor.rating}'),
                            Spacer(
                              flex: 1,
                            ),
                            Text('Reviews'),
                            Spacer(
                              flex: 1,
                            ),
                            Text('(20)'),
                            Spacer(
                              flex: 7,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
