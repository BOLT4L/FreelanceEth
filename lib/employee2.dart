import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;
import 'package:untitled12/main.dart';
import 'package:search/invitation.dart';
class employee2 extends StatefulWidget {
  final int Id;
  final int myID;
  final String job;
  final String dis;

  const employee2({
    Key? key,
    required this.Id,
    required this.job,
    required this.dis,
    required this.myID,
  }) : super(key: key);

  @override
  State<employee2> createState() => _employee2State();
}

class _employee2State extends State<employee2> {
  List<Map<String, dynamic>> p=[];
  List<Map<String, dynamic>> catemp=[];
  Future getAllemp()async{
    catemp.clear();
    pro.clear();

    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/Employee.php');
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
        if(int.parse(catemp[i]["Id"])==widget.Id){
          p.add(catemp[i]);
        }}
      print(p);
      print(catemp.length);
      print(p.length);
      return p;
    }
  }
  @override
  List<Map<String, dynamic>> pro=[];

  void initState() {
    // TODO: implement initState
    super.initState();
    getAllemp();
    pro=p;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pro[0]["FirstName"].toString()+" "+pro[0]["LastName"].toString()),

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
                            image: NetworkImage("http://192.168.8.190:8000//FreeLanceEth/upload/"+p[0]["ProfileImage"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                        "Name : " +pro[0]["FirstName"].toString()+" , "+pro[0]["Age"].toString(),maxLines: 2,overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Profession : "+pro[0]["Profession"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Address : "+pro[0]["Address"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
      Row(children:[
        for (var v = 0; v<int.parse(pro[0]["rate"]); v++)
          Icon(Icons.star, color: Colors.yellow, size: 15,),
      ]),

                          ],
                        ),
                      ),
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
            child: Text(pro[0]["Detail"],style: TextStyle(color: Colors.white),),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 500,
            height: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("The job :"),
                    Text(widget.job.toString()),
                  ],
                ),
                Text(widget.dis.toString()),
              ],
            ),
          ),

          SizedBox(height:10),
          ElevatedButton(

            style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

            child: Text("Invite"),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => invite( Rid:widget.Id,pro: widget.job, myId: widget.myID,myName: "eyob", ),
              ),);
            },
          ),
          SizedBox(height:20),
          ElevatedButton(

            style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

            child: Text("Comment"),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommentPage(RId:widget.Id,Sendername: widget.job, SId: widget.myID,wId: 2, ),
              ),);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}