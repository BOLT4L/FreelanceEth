import 'package:flutter/material.dart';
import 'dart:convert'as convert;
import 'package:http/http.dart'as http;
import 'package:empro/profile dispaly.dart';

class Search extends StatefulWidget {
  final int myId;
  const Search({
    Key? key,

    required this.myId,
  }) : super(key: key);
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<Map<String, dynamic>> works=[];
  List<Map<String, dynamic>> allusers=[];
  Future getAllProduct()async{
    allusers.clear();
    works.clear();
    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/Employee.php');
    var response = await http.get(url);
    if (response.statusCode == 200){
      var jsonResponse =convert.jsonDecode(response.body)as List<dynamic> ;
      for(var item in jsonResponse ){
        if(item is Map<String, dynamic>){
          setState(() {
            allusers.add(item);

          });

        }
              }

      print(works);
      print(allusers.length);
      return allusers;
    }
  }

  int _currentIndex=0;
  List<Map<String, dynamic>>  foundUsers =[];
  @override
  initState() {
    getAllProduct();
    foundUsers=allusers;
    super. initState();
  }

  void runfilter(String enteredKeyword){
    List<Map<String, dynamic>> results =[];
    if (enteredKeyword. isEmpty) {
      results =  allusers;

    }
    else {
      results = allusers.where((user) => user["FirstName"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      if(results.isEmpty){
        results = allusers.where((user) => user["LastName"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
        if(results.isEmpty){
          results = allusers.where((user) => user["Profession"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
          if(results.isEmpty){
            results = allusers.where((user) => user["Detail"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
          }
        }

      }
    }
    setState(() {
      foundUsers= results;
    });}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left:6,right: 6),
        child: Column(
            mainAxisAlignment : MainAxisAlignment.start ,
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              TextField(
                onChanged: (value)=> runfilter(value),
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: Colors.blue,
                        width: 5),
                  ),
                  hintText: "eg : plumber",
                  hintStyle:TextStyle(color: Colors.blue),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20.0,  width: 5000,child: Container(

                color: Colors.white,

              ),),

              Expanded (
                child: ListView.separated(

                    itemCount:foundUsers.length,
                    separatorBuilder: (context,index) {
                      return Divider(height: 5);
                    },
                    itemBuilder: (context,index)=> ListTile(
                      key: ValueKey(foundUsers[index]["Id"]),
                      onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => profile(myId: widget.myId,rate:int.parse(foundUsers[index]["rate"] ),Rid:int.parse(foundUsers[index]["Id"].toString()),pimage: foundUsers[index]["ProfileImage"].toString(),cimage: foundUsers[index]["Certificate"].toString(),level: foundUsers[index]["Lastname"].toString(),Age:int.parse(foundUsers[index]["Age"]) ,
                            sender:foundUsers[index]["FirstName"].toString()+" "+foundUsers[index]["LastName"].toString(), discription: foundUsers[index]["Detail"].toString(),Address: foundUsers[index]["Address"].toString(),Profession: foundUsers[index]["Profession"].toString(), ),
                          ),);},


                      tileColor:  Colors.blue,
                      leading:     Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage("http://192.168.8.190:8000//FreeLanceEth/upload/"+foundUsers[index]["ProfileImage"].toString()),

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      subtitle: Column(
                          children:[
                            Text(maxLines: 3,foundUsers[index]["Detail"].toString(),style: const TextStyle(fontSize: 12,color: Colors.white),
                            ),
                            Row(    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  Row(children:[
                                    for (var v = 0; v<int.parse(foundUsers[index]["rate"]); v++)
                                      Icon(Icons.star, color: Colors.yellow, size: 15,),
                                  ]),
                                  Text(foundUsers[index]["Profession"].toString(),style: const TextStyle(fontSize: 20,color: Colors.white , backgroundColor: Colors.red, overflow: TextOverflow.ellipsis,),),
                                ])

                          ]),

                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      title:Text(foundUsers[index]["FirstName"].toString()+" "+foundUsers[index]["LastName"].toString()+" , "+foundUsers[index]["Age"].toString(),style:TextStyle(color: Colors.white ,backgroundColor:Colors.blue),),
                    )
                ),),
// Expanded

            ]

        ),),

    );
  }

}
