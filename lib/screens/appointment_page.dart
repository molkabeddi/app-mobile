import 'package:flutter/material.dart';
import 'package:pfa2/screens/canceled_appointements.dart';
import 'package:pfa2/screens/completed_appointements.dart';
import 'package:pfa2/utils/config.dart';

import 'upcoming_appointements.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({Key? key}) : super(key: key);

  @override
  State<Appointmentpage> createState() => _AppointmentpageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentpageState extends State<Appointmentpage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0)..addListener(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Padding(
              padding: EdgeInsets.symmetric(vertical: Config.screenHeight! * 0.01),
              child: Container(
                child: TabBar(
                  unselectedLabelStyle: TextStyle(color: Colors.blue),
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue),
                  controller: _tabController,
                  labelColor: Colors.white,
                  tabAlignment: TabAlignment.fill,
                  tabs: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Config.screenHeight! * 0.009,
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                            fontSize: Config.screenHeight! * 0.02,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Config.screenHeight! * 0.009,
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: Config.screenHeight! * 0.02,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Config.screenHeight! * 0.009,
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Canceled",
                          style: TextStyle(
                            fontSize: Config.screenHeight! * 0.02,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                UpcomingAppointements(
                  status: "upcoming",
                ),
                CompletedAppointements(
                  status: "completed",
                ),
                CanceledAppointements(
                  status: "canceled",
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
