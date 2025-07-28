import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;
import 'package:empro/profile dispaly.dart';

class firstpage extends StatefulWidget {
  final String ip;

  const firstpage({
    Key? key,
    required this.ip,
  }) : super(key: key);
  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freelance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system, // Use system theme mode (light/dark) based on device settings
      home: LandingPage(ip:widget.ip),
      routes: {
        CategoryPage.routeName: (context) => CategoryPage(),
        PeopleListPage.routeName: (context) => PeopleListPage(myId: 43),
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  final String ip;
  const LandingPage({
    Key? key,
    required this.ip,
  }) : super(key: key);
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Category> jobCategories = [
    Category(
      name: 'Web Development',
      icon: Icons.code,
    ),
    Category(
      name: 'Mobile App Development',
      icon: Icons.phone_android,
    ),
    Category(
      name: 'Graphic Design',
      icon: Icons.brush,
    ),
    Category(
      name: 'Content Writing',
      icon: Icons.article,
    ),
    Category(
      name: 'Data Entry',
      icon: Icons.data_usage,
    ),
    Category(
      name: 'Video Editing',
      icon: Icons.video_library,
    ),
    Category(
      name: 'other',
      icon: Icons.add,
    ),
  ];


  int _currentpage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: jobCategories.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PeopleListPage.routeName,
                        arguments: jobCategories[index],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            jobCategories[index].icon,
                            size: 48,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            jobCategories[index].name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}

class CategoryPage extends StatefulWidget {
  static const routeName = '/category';

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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

class PeopleListPage extends StatefulWidget {
  static const routeName = '/people-list';@override
  final int myId;
  const PeopleListPage({
    Key? key,
    required this.myId,
  }) : super(key: key);

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
    );}

  State<PeopleListPage> createState() => _PeopleListPageState();
}

class _PeopleListPageState extends State<PeopleListPage> {
   String sd='';
  void myCustomMethod(BuildContext context) {
    final Category category = ModalRoute.of(context)!.settings.arguments as Category;
    sd='${category.name}';
  }

  List<Map<String, dynamic>> emp=[];
  List<Map<String, dynamic>> catemp=[];
  Future getAllemp()async{
    emp.clear();

    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/emp.php');
    var response = await http.get(url);
    if (response.statusCode == 200){
      var jsonResponse =convert.jsonDecode(response.body)as List<dynamic> ;
      for(var item in jsonResponse ){
        if(item is Map<String, dynamic>){
          setState(() {
            emp.add(item);
            for(int i=0 ;i<emp.length;i++){
              if(emp[i]["Profession"]==sd){
                print(sd);
                catemp.add(emp[i]);
              }
            }
          });

        }
      }

      print(sd);
      print(emp.length);
      return emp;
    }
  }

  // Replace the below list with your actual list of people

  @override
  initState() {
    // TODO: implement initState

    super.initState();

    getAllemp();
  }
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context)!.settings.arguments as Category;
    myCustomMethod(context);

    return Scaffold(

      body: ListView.separated(

          itemCount:catemp.length,
          separatorBuilder: (context,index) {
            return Divider(height: 5);
          },
          itemBuilder: (context,index)=> ListTile(
            key: ValueKey(catemp[index]["FirstName"]),
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => profile(myId: widget.myId,Rid: int.parse(catemp[index]["Id"]),
                sender:catemp[index]["FirstName"].toString()+" "+catemp[index]["LastName"].toString(), discription: catemp[index]["Detail"].toString(),Age: int.parse(catemp[index]["Age"]),Profession: catemp[index]["Profession"].toString(),Address: catemp[index]["Address"].toString(),level: catemp[index]["Level"].toString(),rate :int.parse(catemp[index]["rate"]),cimage: catemp[index]["Certificate"].toString(),pimage: catemp[index]["ProfileImage"].toString(),
              ),
              ),);},
            tileColor:  Colors.white,
            leading:  Container(
              margin: EdgeInsets.only(left: 0),
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                image: DecorationImage(
                  image: NetworkImage("http://192.168.8.190:8000//FreeLanceEth/upload/"+catemp[index]["ProfileImage"].toString()),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          subtitle: Column(
            children: [
              Text(catemp[index]["Detail"].toString()),
              Row(    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Row(children:[
                      for (var v = 0; v<int.parse(catemp[index]["rate"]); v++)
                        Icon(Icons.star, color: Colors.yellow, size: 15,),
                    ]),
                        ])
            ],
          ),
            contentPadding: EdgeInsets.symmetric(vertical: 10,),
            title:Text(catemp[index]["FirstName"].toString()+" , "+catemp[index]["Profession"],style:TextStyle(color: Colors.blue,),),
          )
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