import 'package:flutter/material.dart';
import 'package:empro/first.dart';
import 'package:search/new1.dart';
class PeopleListPage extends StatefulWidget {
  static const routeName = '/people-list';

  @override
  State<PeopleListPage> createState() => _PeopleListPageState();
}


class _PeopleListPageState extends State<PeopleListPage> {
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)!.settings.arguments as Category;

    // Replace the below list with your actual list of people
    final List<Person> peopleList = [
      Person(name: 'Person 1', profession: 'Web Developer'),
      Person(name: 'Person 2', profession: 'Mobile App Developer'),
      Person(name: 'Person 3', profession: 'Game Designer'),
      Person(name: 'Person 4', profession: '3d Designer'),
      Person(name: 'Person 5', profession: 'Dish Technishian Designer'),
      Person(name: 'Person 6', profession: 'Film Maker'),
      Person(name: 'Person 7', profession: 'Video Editior'),
      Person(name: 'Person 8', profession: 'Typist Designer'),
      Person(name: 'Person 9', profession: 'Digital Designer'),
      Person(name: 'Person 10', profession: 'Bot Devloper'),
      Person(name: 'Person 11', profession: 'Api Specialist'),
      Person(name: 'Person 12', profession: 'Dish Technishian'),
      Person(name: 'Person 13', profession: 'Blender Proffessional'),
      Person(name: 'Person 14', profession: 'Photoshop Professional'),
      Person(name: 'Person 15', profession: 'Camera Man'),
      Person(name: 'Person 16', profession: 'English Language Expert'),
      Person(name: 'Person 17', profession: 'Graphic Designer'),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('People List'),

      ),
      body: ListView.separated(

          itemCount:peopleList.length,
          separatorBuilder: (context,index) {
            return Divider(height: 5);
          },
          itemBuilder: (context,index)=> ListTile(
            key: ValueKey(peopleList[index].name),
            onTap: () {//Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context) => new1(
                //sender:peopleList[index].name, discription: peopleList[index].profession,type: 2,
              //),
              },
            tileColor:  Colors.blue,


            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            title:Text(peopleList[index].name+" , "+peopleList[index].profession,style:TextStyle(color: Colors.white ,backgroundColor:Colors.blue),),
          )
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Center(
        child: Text('Welcome to ${category.name} cards!'),
      ),
    );
  }
}


class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class Person {
  final String name;
  final String profession;

  Person({required this.name, required this.profession});
}
