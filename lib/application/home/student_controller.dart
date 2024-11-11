import 'package:flutter/foundation.dart';
import 'package:student_app_provider/persistance/student/model/student_model.dart';
import 'package:student_app_provider/persistance/student/student_db.dart';

class StudentController extends ChangeNotifier {
  //For creating a singleton instance(every object of this class is same)
  static final StudentController _instance = StudentController._internal();
  factory StudentController() => _instance;
  StudentController._internal() {
    fetchAllStudent();
  }

  List<StudentModel> studentList = [];

  void fetchAllStudent() {
    final list = StudentDB().fetchAllStudent();
    if (!listEquals(list, studentList)) {
      studentList = list;
      notifyListeners();
    }
  }

  void fetchAllSearchedStudentsData(String value) {
    final list = StudentDB().searchForStudents(value.trim());
    if (!listEquals(list, studentList)) {
      studentList = list;
      notifyListeners();
    }
  }
}
