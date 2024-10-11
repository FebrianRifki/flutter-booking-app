import 'package:flutter/material.dart';
import 'package:flutter_booking_app/service.dart';
import 'package:flutter_booking_app/session.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  DateTime? pickedDate;
  RxList<Session> sessionList = <Session>[].obs;
  final sessionFormController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getSessionList();
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  Future<void> getSessionList() async { 
    String url = 'http://localhost:3000/api/get-session';
    try {
      List<Session> data = await getSessionData(url); 
      sessionList.value = data; 
    } catch (e) {
      print("Error fetching session data: $e"); 
      sessionList.clear(); 
    }
  }

  void setSelectedSession(String selectedSession) {
    sessionFormController.text = selectedSession;
  }
}