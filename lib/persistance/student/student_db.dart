import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app_provider/application/home/student_controller.dart';
import 'package:student_app_provider/core/debug/debug_student.dart';
import 'package:student_app_provider/core/functions/generate_unique_id.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';

class StudentDB {
  final Box<StudentModel> _box = Hive.box('studentBox');
  final _logger = DebugStudent();

  List<StudentModel> fetchAllStudent() {
    return _box.values.toList();
  }

  StudentModel? getStudent(int studentId) {
    return _box.get(studentId);
  }

  List<StudentModel> searchForStudents(String value) {
    if (value.isEmpty) fetchAllStudent();
    return _box.values
        .where((student) => student.name.startsWith(value))
        .toList();
  }

  Future<void> addStudent(StudentModel student) async {
    student.id = generateUniqueId();
    log(student.id.toString());
    await _box.put(student.id, student);
    _logger.addStudentLog(student);
    StudentController().fetchAllStudent();
  }

  Future<void> updateStudent(StudentModel student) async {
    // await student.save();
    // log(student.id);
    await _box.put(student.id, student);
    _logger.updateStudentLog(student);
    StudentController().fetchAllStudent();
  }

  Future<void> deleteStudent(StudentModel student) async {
    await _box.delete(student.id);
    _logger.deleteStudentLog(student);
    StudentController().fetchAllStudent();
  }
}
