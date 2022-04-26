import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  final matricula;
  final name;
  final career;
  final semester;
  final phone;
  final email;

  const StudentInfo(
      {Key? key,
      required this.matricula,
      required this.name,
      required this.career,
      required this.semester,
      required this.phone,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 39, 46, 300),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Informacion del Alumno', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Text(
          'Nombre: ' +
              name +
              '\n' +
              'Matricula: ' +
              matricula +
              '\n' +
              'Carrera: ' +
              career +
              '\n' +
              'Semestre: ' +
              semester +
              '\n' +
              'Celular: ' +
              phone +
              '\n' +
              'Corre: ' +
              email,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}