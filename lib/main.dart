import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'model.dart';

void main() => runApp(MaterialApp(title: "My app", home: Homepage()));

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Person person;
  List post;

  Future<String> loadFromAssets() async{
    return await rootBundle.loadString('assets/data.json');
  }

  Future loadPerson() async{
    String jsonString = await loadFromAssets();
    final jsonResponse = jsonDecode(jsonString);
    person = new Person.fromJson(jsonResponse);
    print('name ${person.name}');
    print('place ${person.place}');
    print('Images ${person.images[1].name}');
    print('Address ${person.address.details.town}');
  }

  void initState(){
    super.initState();
    this.loadPerson();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Container(
        child: Text("shafi"),
      ),
    );
  }
}


