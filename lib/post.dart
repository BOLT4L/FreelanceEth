import 'package:empro/main.dart';
import 'package:flutter/material.dart';
import 'package:empro/mypost.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;
import 'dart:core';

class post extends StatefulWidget {
  final String ip;
  final int myId;
  const post({
    Key? key,
    required this.ip,
    required this.myId,
  }) : super(key: key);
  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  List<Map<String, dynamic>> sq=[];
  List<Map<String, dynamic>> db=[];
  Future getAllProduct()async{
    sq.clear();
    db.clear();
    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/search.php');
    var response = await http.get(url);
    if (response.statusCode == 200){
      var jsonResponse =convert.jsonDecode(response.body)as List<dynamic> ;
      for(var item in jsonResponse ){
        if(item is Map<String, dynamic>){
          setState(() {
            db.add(item);
          });

        }

        print(db);

      }


      for(int i=0;i<db.length;i++){
        if (int.parse(db[i]["EmployerID"])==widget.myId){
          sq.add(db[i]);
        }
      }
      print(sq.length);
      return sq;
    }
  }
  @override
  List<Map<String, dynamic>>  foundWork =[];
  initState() {
    super. initState();
    foundWork=sq;
    getAllProduct();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.separated(
          itemCount:foundWork.length,
          itemBuilder: (context,index){
            return Container(

              margin: EdgeInsets.symmetric(horizontal: 0,vertical: 5),

              child:SingleChildScrollView(

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),),shadowColor: Colors.cyanAccent,
                  color: Colors.white,
                  margin: EdgeInsets.only(top:10),
                  child:InkWell(
                    onTap: ()   {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => new1(ip: widget.ip,myId: widget.myId,
                        workid: int.parse(foundWork[index]['WrokId'].toString()),sender:foundWork[index]['WorkName'].toString(), discription:foundWork[index]["Discritption"].toString(),type: int.parse(foundWork[index]["WrokId"]),Address:foundWork[index]["Address"].toString() , Profession: foundWork[index]["Profession"].toString(),title: foundWork[index]["WorkName"].toString(),Pay: int.parse(foundWork[index]["Payment"].toString()),Date: foundWork[index]["Date"].toString(),
                      ),
                      ),);},
                    child:Row(
                      children: [

                        Expanded(
                          child:
                          Container(

                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  child: RichText(

                                    text:TextSpan(

                                        text: sq[index]["WorkName"].toString()+"  ",

                                        style: TextStyle(
                                          fontSize:21,
                                          color:Colors.blue,
                                          fontWeight:FontWeight.bold,
                                        ),
                                        children:[

                                          TextSpan(
                                            text: sq[index]["WrokId"].toString(),
                                            style: TextStyle(
                                              fontSize:14,
                                              color:Colors.blue,
                                              fontWeight: FontWeight.normal,


                                            ),),

                                        ]
                                    ),
                                    overflow:TextOverflow.fade,
                                    maxLines: 12,

                                  ),


                                ),
                                Container(
                                  margin: EdgeInsets.only(top:5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(sq[0]["Date"],
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),),
                                   ]
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, separatorBuilder: (context,index) {
        return Divider(height: 0);
      }),
    );
  }
}

