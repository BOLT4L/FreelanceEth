import 'package:flutter/material.dart';
import 'package:empro/employee2.dart';
List<Map<String, dynamic>> foundUsers=[
  {"id" :1 ,"pro":"plumber","name":"andy","age":23 , "des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :2 ,"pro":"plumber","name":"betty","age":26,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole." },
  {"id" :3 ,"pro":"plumber","name":"job","age":53 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :4 ,"pro":"accountant","name":"mark","age":23 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :3 ,"pro":"plumber","name":"tom","age":63 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :2 ,"pro":"data Analyst","name":"chris","age":20 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :1 ,"pro":"plumber","name":"abe","age":32 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :4 ,"pro":"plumber","name":"tina","age":97 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :1 ,"pro":"it professional","name":"moh","age":32 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :1 ,"pro":"plumber","name":"andy","age":23 , "des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :2 ,"pro":"plumber","name":"betty","age":26,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole." },
  {"id" :2 ,"pro":"plumber","name":"job","age":53 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :3 ,"pro":"electrician","name":"mark","age":23 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :3 ,"pro":"plumber","name":"tom","age":63 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :4 ,"pro":"plumber","name":"chris","age":20 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :4 ,"pro":"plumber","name":"abe","age":32 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :3 ,"pro":"plumber","name":"tina","age":97 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :2 ,"pro":"plumber","name":"abe","age":32 ,"des":"Technology has become an integral part of our lives, revolutionizing the way we communicate, work, and live. From smartphones to artificial intelligence, technological advancements have significantly impacted modern society. This essay explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},
  {"id" :1 ,"pro":"electrician","name":"tintea","age":97 ,"des":"Technology has explores the positive and negative effects of technology on various aspects of our lives and society as a whole."},


];
class emp extends StatefulWidget {


  const emp({
    Key? key,

  }) : super(key: key);

  @override
  State<emp> createState() => _empState();
}

class _empState extends State<emp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),

      ),
      body: ListView.separated(

          itemCount:foundUsers.length,
          separatorBuilder: (context,index) {
            return Divider(height: 5);
          },
          itemBuilder: (context,index)=> ListTile(
            key: ValueKey(foundUsers[index]["id"]),
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => employee2(
                sender:foundUsers[index]["name"].toString(), discription: foundUsers[index]["des"].toString(),type: foundUsers[index]["id"],
              ),
              ),);},
            tileColor:  Colors.blue,

            leading:  Text(foundUsers[index]["id"].toString(),style: const TextStyle(fontSize: 24,color: Colors.white),),
            //trailing:Icon(Icons.star, color: Colors.yellow,),
            subtitle: Column(
                children:[
                  Text(maxLines: 8,foundUsers[index]["des"].toString(),style: const TextStyle(fontSize: 15,color: Colors.white),
                  ),
                  Row(    mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text("looking for:   "),
                        Text(foundUsers[index]["pro"].toString(),style: const TextStyle(fontSize: 20,color: Colors.white , backgroundColor: Colors.green, overflow: TextOverflow.ellipsis,),),
                      ])

                ]),

            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            title:Text(foundUsers[index]["name"].toString()+" , "+foundUsers[index]["age"].toString(),style:TextStyle(fontSize:20,color: Colors.white ,backgroundColor:Colors.blue),),
          )
      ),

      backgroundColor: Colors.white,
    );
  }
}