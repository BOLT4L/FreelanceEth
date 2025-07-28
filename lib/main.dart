import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:notifications/Notification.dart';
import 'package:empro/Search.dart';
import 'package:empro/post.dart';
import 'package:empro/first.dart';
import 'package:empro/setting.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert'as convert;
import 'package:empro/history.dart';
import 'package:login/main.dart';

String f=DateTime.timestamp().toString();
String _filetext="";


class FreelanceApp extends StatefulWidget {
  final int myId;

  const FreelanceApp({
    Key? key,
    required this.myId,
  }) : super(key: key);
  @override
  State<FreelanceApp> createState() => _FreelanceAppState();
}

class _FreelanceAppState extends State<FreelanceApp> {


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
      home: LandingPage(myId: widget.myId),
      routes: {
        CategoryPage.routeName: (context) => CategoryPage(),
        PeopleListPage.routeName: (context) => PeopleListPage(myId:widget.myId),
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  final int myId;

  const LandingPage({
    Key? key,
    required this.myId,
  }) : super(key: key);
  @override

  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String ip="192.168.8.190";
  initState() {
    // TODO: implement initState

    super.initState();
    updateVariable();
    getAllemp();
  }
  List<Map<String, dynamic>> pro=[];
  List<Map<String, dynamic>> catemp=[];
  Future getAllemp()async{
    catemp.clear();
    pro.clear();
    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/employers.php');
    var response = await http.get(url);
    if (response.statusCode == 200){
      var jsonResponse =convert.jsonDecode(response.body)as List<dynamic> ;
      for(var item in jsonResponse ){
        if(item is Map<String, dynamic>){
          setState(() {
            catemp.add(item);
          });
        }
      }
      for(int i=0 ;i<catemp.length;i++){
        if(catemp[i]["Id"]==widget.myId.toString()){
          pro.add(catemp[i]);
        }}
      print(pro);
      print(catemp.length);
      print(pro.length);
      return pro;
    }
  }
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
  ];

  final tabs =[

  ];
  void updateVariable() {
    setState(() {
      tabs.add( firstpage(ip:"192.168.8.190"));
      tabs.add( post(ip:"192.168.8.190",myId: widget.myId,));

    });
  }

logout(){
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => login(),
    ),);
}
  int _currentpage=0;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            tooltip: 'Add post',
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Addpost(myId: widget.myId),
              ),);},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'notification',
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen(myId: widget.myId,),
              ),);},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search(myId: widget.myId,),
                ),);
            },
          ),
        ],
        title: Text('Freelance Site'),
      ),
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image:DecorationImage(
                        image: NetworkImage("http://192.168.8.190:8000//FreeLanceEth/upload/"+pro[0]["ProfileImage"].toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    pro[0]["FirstName"].toString()+" "+pro[0]["LastName"].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    pro[0]["Address"].toString(),

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FreelanceApp(myId: widget.myId,),
                ),);
                //
                // TODO: Handle Home tap
              },
            ),
            ListTile(
              leading: Icon(Icons.work_history),
              title: Text('Employee'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>history(myID: widget.myId),
                  ),);
                // TODO: Handle Settings tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>setting(myId: widget.myId,),
                  ),);
                // TODO: Handle Settings tap
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen(myId: widget.myId),
                  ),);
                // TODO: Handle Notifications tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                showDialog(context: context, builder: (context)
                {
                  return Container(
                      child:AlertDialog(
                        title: Text("Are you sure?" ,),
                        actions: [
                          TextButton(onPressed: (){
                            logout();
                            Navigator.pop(context);//to login page

                          }, child: Text("yes")),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("no"))
                        ],
                      )
                  );
                },);
                // TODO: Handle Logout tap
              },
            ),
          ],
        ),
      ),
      body: tabs[_currentpage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentpage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_post_office_rounded),
            label: 'MY post',
          ),

        ],
        onTap: (index) {
          setState(() {
            _currentpage= index;
          });
        },
      ),
    );
  }
}

class Addpost extends StatefulWidget {
int myId;
   Addpost({
    Key? key,
    required this.myId,
  }) : super(key: key);

  @override
  State<Addpost> createState() => _AddpostState();
}


  addPost(
     String Id,String name,
    String payment , String Address, String Discription, String pro , String title,String image
    )async{

  try{
   var map= Map<String,dynamic>();
   map['action'] = "addpost";
   map['id']=Id;
   map['Payment']= payment;
   map['date']=DateTime.now().toString();
   map['empname']=name;
   map['Address']= Address;
   map['image']= image;
   map['Discription']= Discription;
   map['pro']=pro;
   map['type']='1';
   map["title"]=title;
   var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/add.php');
   final response =  await http.post(url,body: map);
   if(response.statusCode==200){
     print(map["Discription"]);
     return response.body;}
   else{
     print(map["Discription"]);
     return 'connection error';}
  }
  catch(e){
    print(e);
    return e;
  }
}

class _AddpostState extends State<Addpost> {
  late TextEditingController title;
  late TextEditingController discription;
  late TextEditingController payment;
  late TextEditingController address;
  late TextEditingController type;
  List<Map<String, dynamic>> pro=[];
  List<Map<String, dynamic>> catemp=[];
  Future getAllemp()async{
    catemp.clear();
    pro.clear();
    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/employers.php');
    var response = await http.get(url);
    if (response.statusCode == 200){
      var jsonResponse =convert.jsonDecode(response.body)as List<dynamic> ;
      for(var item in jsonResponse ){
        if(item is Map<String, dynamic>){
          setState(() {
            catemp.add(item);
          });
        }
      }
      for(int i=0 ;i<catemp.length;i++){
        if(int.parse(catemp[i]["Id"])==widget.myId){
          pro.add(catemp[i]);
        }}
      print(pro);
      print(catemp.length);
      print(pro.length);
      return pro;
    }
  }

  void initState(){
    getAllemp();
    title =TextEditingController();
    type =TextEditingController();
    address =TextEditingController();
    discription =TextEditingController();
    payment =TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
      IconButton(
      icon: const Icon(Icons.done),
      tooltip: 'finish',
      onPressed: () {showDialog(context: context, builder: (context)
      {
        return Container(
            child:AlertDialog(
              title: Text("Are you sure?" ,),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                 addPost(pro[0]["Id"].toString(),pro[0]["FirstName"].toString()+" "+pro[0]["LastName"].toString(),payment.text,address.text, discription.text, type.text, title.text,pro[0]["ProfileImage"].toString());
                }, child: Text("yes")),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("no"))
              ],
            )
        );
      },);},
    ),],
        title: Text("Add new Post"),
      ),
      body:ListView(
        children: [

          TextField(
            controller: title,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(
                    color: Colors.blue,
                    width: 12),
              ),
              hintText: "Title of the job",
              hintStyle:TextStyle(color: Colors.blue),

            ),
          ),

          TextField(maxLines: 5,

            controller: discription,
            decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: BorderSide(
                  color: Colors.blue,
                  width: 12),
            ),
            hintText: "Detail about the job",
            hintStyle:TextStyle(color: Colors.blue),

          ),),
          TextField(
            controller: payment,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(
                    color: Colors.blue,
                    width: 12),
              ),
              hintText: "Payment",
              hintStyle:TextStyle(color: Colors.blue),
              suffixIcon: Icon(Icons.attach_money_outlined),
              suffixIconColor: Colors.green,
            ),
          ),
          TextField(
            controller: address,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(
                    color: Colors.blue,
                    width: 12),
              ),
              suffixIcon:Icon(Icons.location_pin),
              suffixIconColor: Colors.cyan,
              hintText: "Address",
              hintStyle:TextStyle(color: Colors.blue),

            ),
          ),
          TextField(
            controller: type,
           decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(
                    color: Colors.blue,
                    width: 12),
              ),
              suffixIconColor: Colors.cyan,
              hintText: "Profession",
              hintStyle:TextStyle(color: Colors.blue),

            ),
          ),

        ],

      )
    );
  }
}

void _pickMultipleFiles() async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

  if (result!= null){
  List<File> files = result.paths.map((path) => File(path!)).toList();
    _filetext=files.toString();



  }
  else{

  }

}