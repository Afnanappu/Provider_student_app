import 'package:flutter/material.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
import 'package:student_app_provider/presentation/home/widgets/custom_list_tile.dart';

class ListTileBuilder extends StatelessWidget {
  const ListTileBuilder({
    super.key,
    required this.studentList,
  });

  final List<StudentModel> studentList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CustomListTile(student: studentList[index]),
          );
        },
      ),
    );
  }
}
