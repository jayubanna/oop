// main.dart

import 'package:dart_day1/product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  String? _name;
  double? _grade;

  Student({required String name, required double grade}) {
    _name = name;
    _grade = grade;
  }

  String get name => _name ?? '';

  double get grade => _grade ?? 0.0;

  set name(String? value) => _name = value;

  set grade(double? value) => _grade = value;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Information',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _student = Student(name: 'jayveer', grade: 85.0);
  final _nameController = TextEditingController(text: 'jayveer');
  final _gradeController = TextEditingController(text: '85.0');

  void _updateStudent() {
    if (_formKey.currentState!.validate()) {
      _student.name = _nameController.text;
      _student.grade = double.parse(_gradeController.text);
      setState(() {
        _nameController.clear();
        _gradeController.clear();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductPage();
          }));
        },
        child: Icon(Icons.arrow_forward,),
      ),
      appBar: AppBar(
        title: Text('Student Information'),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Name: ${_student.name}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Grade: ${_student.grade}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _gradeController,
                    decoration: InputDecoration(
                      hintText: "Grade",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a grade';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid grade';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _updateStudent,
                    child: Text('Update'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
