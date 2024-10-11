import 'package:flutter/material.dart';
import 'package:flutter_booking_app/booking_controller.dart';
import 'package:get/get.dart';
import 'package:awesome_select/awesome_select.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final controller = Get.put(BookingController());
  final dateFormController = TextEditingController();
  final employeeFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:   const EdgeInsets.all(10.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const SizedBox(height: 30,),
           const Text('Date',),
            TextField(
            controller: dateFormController,
            onTap: () async {
                controller.pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2024), lastDate: DateTime(2030));
                String stringDate = controller.pickedDate.toString();
                String dateText   = controller.convertDateTimeDisplay(stringDate);
                dateFormController.text = dateText;
            },
            readOnly: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'select date'
            ),
          ),
           const SizedBox(height: 20,),
           const Text('Session',),
            TextField(
            controller: controller.sessionFormController,
            onTap: () {
              showDialog(context: context, builder: (context) {
                  return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), 
                  ),
                  child: Container(
                    width: 300, 
                    height: 300,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          for( var session in controller.sessionList)
                          Padding(padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                                title: Text('${session.name} (${session.startTime} - ${session.endTime})',style: const TextStyle(fontSize: 14)), // Ganti 'name' sesuai atribut
                                onTap: () {
                                  String selectedText = '${session.name} (${session.startTime} - ${session.endTime})';
                                  controller.setSelectedSession(selectedText);
                                  Navigator.of(context).pop(); 
                                },
                              ),
                         ),
                      ],
                    )
                  ),
                );
              });
            },
            readOnly: true,
            decoration: const InputDecoration(
              border:  UnderlineInputBorder(),
              hintText: 'select session'
            ),
          ),
           const SizedBox(height: 20,),
           const Text('Session',),
           const TextField(
            readOnly: true,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'select employee'
            ),
          ),
        ],
      ),
    );
  }
}