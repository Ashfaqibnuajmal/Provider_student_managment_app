import 'package:flutter/material.dart';
import 'package:getx/controllers/controllers.dart';
import 'package:provider/provider.dart';
import 'package:getx/model/student_model.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  final StudentModel student;
  final _formKey = GlobalKey<FormState>();
  late String _name = student.name;
  late int _age = student.age;
  late String _batch = student.course;
  late int _year = student.year;
  late int _roll = student.rollnumber;

  EditStudent({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Edit Student",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                _buildTextField(
                  initialValue: _name,
                  label: "Name",
                  onSaved: (value) => _name = value!,
                ),
                _buildTextField(
                  initialValue: _age.toString(),
                  label: "Age",
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _age = int.tryParse(value!) ?? 0,
                ),
                _buildTextField(
                  initialValue: _batch,
                  label: "Course",
                  onSaved: (value) => _batch = value!,
                ),
                _buildTextField(
                  initialValue: _year.toString(),
                  label: "Year",
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _year = int.tryParse(value!) ?? 0,
                ),
                _buildTextField(
                  initialValue: _roll.toString(),
                  label: "Roll No",
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _roll = int.tryParse(value!) ?? 0,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 4,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 100),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Provider.of<StudentProvider>(context, listen: false)
                              .updateStudent(
                            student.id,
                            _name,
                            _age,
                            _roll,
                            _batch,
                            _year,
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
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

  Widget _buildTextField({
    required String initialValue,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required Function(String?) onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
