import 'info.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Persona> _personas = [
    Persona("18760435", "Emmanuel Ortiz Hernandez", " I.S.C", "8vo",
        "6461633910", "al18760435@ite.edu.mx"),
    Persona("18760434", "Berenice Hernandez Arredondo", "I.S.C", "8vo", "646124567",
        "al18760434@ite.edu.mx"),
    Persona("18760609", "Dante Gonzalez Estrada", "I.S.C", "7mo", "6462481177",
        "al18760609@ite.edu.mx"),
  ];


   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(134, 45, 216, 228),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // ignore: prefer_const_constructors
          title: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: const Text(
              'Estudiantes',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListView.builder(
              itemCount: _personas.length,
              itemBuilder: (context, index) {
                var textStyle = TextStyle(
                              color: Color.fromARGB(247, 255, 255, 255));
                return Container(
                  alignment: Alignment.center,
                  height: 90,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentInfo(
                                    name: _personas[index].name,
                                    matricula: _personas[index].matricula,
                                    career: _personas[index].carrera,
                                    semester: _personas[index].semestre,
                                    phone: _personas[index].telefono,
                                    email: _personas[index].email,
                                  )));
                    },
                    title: Text(
                      _personas[index].name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Text(_personas[index].carrera,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138),
                            fontSize: 12)),
                    leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(154, 34, 13, 154),
                        child: Text(
                          _personas[index].name.substring(0, 1),
                          style: textStyle,
                        )),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  _borrarPersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar"),
              content: const Text("¿Seguro que deseas eliminarlo de la lista?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _personas.remove(persona);
                      });

                      Navigator.pop(context);
                    },
                    child: const Text("Delete",
                        style: TextStyle(color: Colors.red)))
              ],
            ));
  }
}

class Persona {
  String matricula;
  String name;
  String carrera;
  String semestre;
  String telefono;
  String email;

  Persona(this.matricula, this.name, this.carrera, this.semestre, this.telefono,
      this.email);
}

