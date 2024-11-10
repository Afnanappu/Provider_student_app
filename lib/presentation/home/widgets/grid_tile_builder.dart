import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_app_provider/core/navigations.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
import 'package:student_app_provider/presentation/home/widgets/home_tile_edit_and_delete_buttons.dart';
import 'package:student_app_provider/presentation/student_details/screen_student_details.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.studentList,
  });

  final List<StudentModel> studentList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: studentList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            onTap: () => Nav.push(
              context,
              ScreenStudentDetails(
                student: studentList[index],
              ),
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color.fromARGB(255, 81, 8, 94),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: kIsWeb
                      ? MemoryImage(base64Decode(studentList[index].profile))
                      : FileImage(File(studentList[index].profile)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  studentList[index].name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                HomeTileEditAndDeleteButtons(student: studentList[index])
              ],
            ),
          ),
        );
      },
    );
  }
}
