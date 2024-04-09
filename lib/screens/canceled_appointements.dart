import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pfa2/components/appointement_component.dart';
import 'package:pfa2/models/appointement.dart';
import 'package:pfa2/providers/appointements_services.dart';

import '../utils/config.dart';

class CanceledAppointements extends StatefulWidget {
  final String status;
  const CanceledAppointements({Key? key, required this.status}) : super(key: key);

  @override
  State<CanceledAppointements> createState() => _CanceledAppointementsState();
}

class _CanceledAppointementsState extends State<CanceledAppointements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: AppointementsServices.get_appointements(widget.status),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Appointement> app = [];
                snapshot.data.map((json) {
                  app.add(json);
                }).toList();

                if (app.length != 0) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.02, vertical: Config.screenHeight! * 0.01),
                        child: AppointementCard(
                          appointement: app[index],
                          function: () => setState(() {}),
                        ),
                      );
                    },
                    itemCount: app.length,
                  );
                } else {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Column(
                          children: [
                            Lottie.asset("assets/empty.json"),
                            Text(
                              "There is no appointement ",
                              style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        ));
                      });
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
