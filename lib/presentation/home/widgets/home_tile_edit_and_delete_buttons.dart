import 'package:flutter/material.dart';
import 'package:student_app_provider/core/navigations.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
import 'package:student_app_provider/persistance/student/student_db.dart';
import 'package:student_app_provider/presentation/student_add/screen_student_add.dart';

class HomeTileEditAndDeleteButtons extends StatelessWidget {
  HomeTileEditAndDeleteButtons({
    super.key,
    required this.student,
  });

  final studentDb = StudentDB();
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        IconButton(
          onPressed: () => Nav.push(
            context,
            ScreenStudentAdd(
              isUpdate: true,
              student: student,
            ),
          ),
          icon: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Delete student',
                        ),
                        content: const Text('Are you sure?'),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        actions: [
                          TextButton(
                              onPressed: () async {
                                await studentDb.deleteStudent(student);
                                Nav.pop(context);
                              },
                              child: const Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Nav.pop(context);
                              },
                              child: const Text('No')),
                        ],
                      )
                  // SimpleDialog(
                  //   title: const Text(
                  //     'Delete student',
                  //   ),
                  //   children: [
                  //     TextButton(
                  //         onPressed: () async {
                  //           await studentDb.deleteStudent(student);
                  //           Nav.pop(context);
                  //         },
                  //         child: const Text('Yes')),
                  //     TextButton(
                  //         onPressed: () {
                  //           Nav.pop(context);
                  //         },
                  //         child: const Text('No')),
                  //   ],
                  // ),
                  );
              // Get.defaultDialog(
              //     title: 'Delete student',
              //     middleText: 'Are you sure?',
              //     actions: [
              //       TextButton(
              //           onPressed: () async {
              //             await services.deleteStudent(student);
              //             Get.back();
              //           },
              //           child: const Text('Yes')),
              //       TextButton(
              //           onPressed: () {
              //             Get.back();
              //           },
              //           child: const Text('No'))
              //     ]);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    );
  }
}
