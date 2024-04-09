import 'package:pfa2/models/doctor.dart';

class Appointement {
  final int userId;
  final int id;
  final DateTime date;
  final String status;
  final Doctor doctor;
  Appointement({required this.status, required this.id, required this.date, required this.userId, required this.doctor});

  factory Appointement.fromJson(Map<String, dynamic> json) {
    return Appointement(
      userId: json['user_id'],
      id: json['id'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      doctor: getDoctor(json['doctor_id']),
    );
  }
  static Doctor getDoctor(String doctorId) {
    Doctor foundDoctor = doctors.firstWhere((doctor) => doctor.id == doctorId);
    return foundDoctor;
  }
}
