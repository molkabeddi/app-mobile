import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pfa2/components/button.dart';
import 'package:pfa2/components/custom_appbar.dart';
import 'package:pfa2/models/appointement.dart';
import 'package:pfa2/providers/appointements_services.dart';
import 'package:pfa2/screens/success.booked.dart';
import 'package:table_calendar/table_calendar.dart';

class EditAppointement extends StatefulWidget {
  final Appointement appointement;
  const EditAppointement({Key? key, required this.appointement}) : super(key: key);

  @override
  State<EditAppointement> createState() => _EditAppointementState();
}

class _EditAppointementState extends State<EditAppointement> {
  bool loading = false;

  CalendarFormat _format = CalendarFormat.month;
  late DateTime _currentDay;
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  getDay() {
    setState(() {
      _currentDay = widget.appointement.date;
      _currentIndex = widget.appointement.date.hour - 9;
      _dateSelected = true;
      _timeSelected = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Appointment',
        route: null, // Remplacez null par la route souhaitée si nécessaire
        icon: const Icon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      'Weekend is not available, please select another date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index ? Colors.white : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index ? Colors.grey : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Button(
                      width: double.infinity,
                      title: 'Update Appointement',
                      onPressed: () async {
                        setState(() {
                          _currentDay = _currentDay.subtract(Duration(hours: _currentDay.hour));
                          _currentDay = _currentDay.add(Duration(hours: _currentIndex! + 9));

                          loading = true;
                        });
                        var data = await AppointementsServices.update_appointement(
                            widget.appointement.id, DateFormat("yyyy/MM/dd HH:mm").format(_currentDay));
                        setState(() {
                          loading = false;
                        });

                        if (data) {
                          Get.to(AppointmentBooked(
                            status: "updated",
                          ));
                        } else {}
                      },
                      disable: _timeSelected && _dateSelected ? false : true,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _currentDay,
      firstDay: DateTime.now().subtract(const Duration(days: 365)), // Un an en arrière
      lastDay: DateTime.now().add(const Duration(days: 365)), // Un an en avant
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _dateSelected = true;

          // Vérifiez si le week-end est sélectionné
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      },
    );
  }
}
