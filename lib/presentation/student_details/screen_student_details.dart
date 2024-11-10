import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
class ScreenStudentDetails extends StatelessWidget {
  const ScreenStudentDetails({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow:const [
                BoxShadow(
                  color: Colors.purple,
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.amber[50],
                  backgroundImage: kIsWeb
                      ? MemoryImage(
                          base64Decode(student.profile),
                        )
                      : FileImage(
                          File(student.profile),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Name: ${student.name}',
                      style: cardTextStyle(),
                    ),
                    Text(
                      'Age: ${student.age}',
                      style: cardTextStyle(),
                    ),
                    Text(
                      'Guardian: ${student.father}',
                      style: cardTextStyle(),
                    ),
                    Text(
                      'Ph: ${student.phone}',
                      style: cardTextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle cardTextStyle() =>
      const TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
}
