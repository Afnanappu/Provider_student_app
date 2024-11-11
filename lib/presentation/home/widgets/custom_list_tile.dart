import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_app_provider/core/navigations.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
import 'package:student_app_provider/presentation/home/widgets/home_tile_edit_and_delete_buttons.dart';
import 'package:student_app_provider/presentation/student_details/screen_student_details.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.student,
  });

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Nav.push(
        context,
        ScreenStudentDetails(
          student: student,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(255, 81, 8, 94),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        student.name,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(student.age),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: kIsWeb
            ? MemoryImage(base64Decode(student.profile))
            : FileImage(File(student.profile)),
      ),
      // tileColor: Colors.amber[100],
      trailing: HomeTileEditAndDeleteButtons(student: student),
    );
  }
}
