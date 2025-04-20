import 'package:flutter/material.dart';
import 'package:getx/model/student_model.dart';

class StudentProvider extends ChangeNotifier {
  final List<StudentModel> _students = [];
  List<StudentModel> get student => [..._students];
  void addStudents(
      String name, int age, int rollnumber, String course, int year) {
    final newStudent = StudentModel(
        age: age,
        course: course,
        name: name,
        rollnumber: rollnumber,
        year: year,
        id: DateTime.now().toString());
    _students.add(newStudent);
    notifyListeners();
  }

  void updateStudent(String id, String name, int age, int rollNumber,
      String course, int year) {
    final index = _students.indexWhere((student) => student.id == id);
    if (index > 0) {
      _students[index] = StudentModel(
          age: age,
          course: course,
          id: id,
          name: name,
          rollnumber: rollNumber,
          year: year);
      notifyListeners();
    }
  }

  void deleteStudent(String id) {
    _students.removeWhere((student) => student.id == id);
    notifyListeners();
  }
}
// 
