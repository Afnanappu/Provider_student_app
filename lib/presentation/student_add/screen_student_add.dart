import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/application/student_add/my_form_controllers.dart';
import 'package:student_app_provider/application/student_add/profile_image_provider.dart';
import 'package:student_app_provider/core/navigations.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
import 'package:student_app_provider/persistance/student/student_db.dart';
import 'package:student_app_provider/presentation/student_add/widgets/custom_text_form_field.dart';
import 'package:student_app_provider/presentation/student_add/widgets/student_add_profile.dart';

// ignore: must_be_immutable
class ScreenStudentAdd extends StatelessWidget {
  ScreenStudentAdd({
    super.key,
    this.isUpdate = false,
    StudentModel? student,
  }) {
    if (student != null) {
      formController.updateFormField(student);
      ProfileImageProvider().setImage = student.profile;
      studentId = student.id!;
    }
  }
  final _formKey = GlobalKey<FormState>();
  final studentDb = StudentDB();
  final bool isUpdate;
  String studentId = '';
  final MyFormController formController = MyFormController();

  // Rx<String?> image = Rx(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const StudentAddProfile(),

                //name

                CustomTextFormField(
                  controller: formController.nameController,
                  label: 'Name',
                  validator: formController.nameValidator,
                ),

                //age
                CustomTextFormField(
                  controller: formController.ageController,
                  label: 'Age',
                  validator: formController.ageValidator,
                ),

                //phone
                CustomTextFormField(
                  controller: formController.phoneController,
                  label: 'Phone',
                  validator: formController.phoneNumberValidator,
                ),

                //guardian
                CustomTextFormField(
                  controller: formController.fatherController,
                  label: 'Guardian',
                  validator: formController.nameValidator,
                ),
                const SizedBox(
                  height: 10,
                ),
                //Save Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            Provider.of<ProfileImageProvider>(context,
                                        listen: false)
                                    .image !=
                                null) {
                          try {
                            final student = StudentModel(
                              name: formController.nameController.value.text
                                  .trim(),
                              age: formController.ageController.text.trim(),
                              phone: formController.phoneController.text.trim(),
                              father:
                                  formController.fatherController.text.trim(),
                              profile: Provider.of<ProfileImageProvider>(
                                      context,
                                      listen: false)
                                  .image!
                                  .trim(),
                            );
                            if (isUpdate) {
                              student.id = studentId;
                              await studentDb.updateStudent(student);
                            } else {
                              await studentDb.addStudent(student);
                            }
                            Provider.of<ProfileImageProvider>(context,
                                    listen: false)
                                .clearImage();
                            Nav.pop(context);
                          } on Exception catch (e) {
                            log(e.toString());
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isUpdate
                                    ? 'Updating student failed, try to fill the fields'
                                    : 'Adding student is failed, try to fill the fields',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 3),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(10),
                            ),
                          );
                        }
                      },
                      child: Text(
                        isUpdate ? 'Update' : 'Save',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
