import 'package:flutter/material.dart';
import 'package:search/invitation.dart';
import 'package:search/display.dart';
import 'package:untitled12/main.dart';
class profile extends StatefulWidget {

  final String sender;
  final String discription;
  final int myId;
  final int Age;
  final int Rid;
  final int rate;
  final String Profession;
  final String Address;
  final String level;
  final String pimage;
  final String cimage;
  const profile({
    Key? key,
    required this.sender,
    required this.rate,
    required this.discription,
    required this.Age,
    required this.myId,
    required this.Rid,
    required this.Profession,
    required this.Address,
    required this.level,
    required this.cimage,
    required this.pimage,
  }) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  int myID=43;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sender),

      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            height: 225,
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage("http://192.168.8.190:8000//FreeLanceEth/upload/"+widget.pimage.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(

                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text(
                              "Name : "+widget.sender.toString()+", "+widget.Age.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Profession : "+widget.Profession.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Address : "+widget.Address.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Work Expriance Level : "+widget.level.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Row(children:[
                                  for (var v = 0; v<widget.rate; v++)
                                    Icon(Icons.star, color: Colors.yellow, size: 15,),
                                ]),
                              ],
                            ),
      ],

                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20,),
            padding: EdgeInsets.all(10),
            width: 500,
            height: 300,
            color: Colors.grey,
            child: Text(widget.discription.toString(),style: TextStyle(color: Colors.white),),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,),
            width: 500,
            height: 300,

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage("http://192.168.43.83:8000//FreeLanceEth/upload/"+widget.cimage.toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height:10),
          ElevatedButton(

            style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

            child: Text("Comments"),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>display(
                myId: widget.Rid,
              ),
              ),);
            },
          ),
          SizedBox(height:10),
          ElevatedButton(

            style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

            child: Text("invite"),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => invite(myName: widget.sender,myId:widget.myId ,Rid:widget.Rid ,pro: widget.Profession,),
              ),);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}