import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;
class letter extends StatefulWidget {
  final String sender;
  final String discription;
  final int Id;
  final int myId;
  final int wId;
  const letter({
    Key? key,
    required this.sender,
    required this.discription,
    required this.Id,
    required this.myId,
    required this.wId,
  }) : super(key: key);

  @override
  State<letter> createState() => _letterState();
}

class _letterState extends State<letter> {
  late TextEditingController Contents;
   initState(){
    Contents =TextEditingController();}
  List<Map<String, dynamic>> emp=[];
  List<Map<String, dynamic>> catemp=[];
  Future getAllemp()async{
    catemp.clear();
    emp.clear();
    var url = Uri.parse('http:192.168.8.190:8000//FreeLanceEth/employee.php');
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
          emp.add(catemp[i]);
        }}
      print(emp);
      print(catemp.length);
      print(emp.length);
      return emp;
    }
  }

  Future<Object> approve(
      String letter,int RId , int myIds , String SenderName , int workId , String Date
      )async{
    try{
      var map= Map<String,dynamic>();
      map['action'] = "approve";
      map['Content']= Contents.text;
      map['SenderId']= myIds.toString();
      map['ReceiverId']= RId.toString();
      map['type']= '2';
      map['SenderName']=SenderName;
      map["Date"]=Date;
      map['wrokId']= workId.toString();
      var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/empro.php');
      final response =  await http.post(url,body: map);
      if(response.statusCode==200){
        print(map["Content"]);
        return response.body;}
      else{
        print(map["Content"]);
        return 'connection error';}
    }
    catch(e){
      print(e);
      return e;
    }
  }
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
            height: 150,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [

                      Expanded(

                        child: Column(
                          children: [
                            Text(
                              widget.sender.toString(), maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

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
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: 500,
            height: 300,
            color: Colors.lightBlue,
            child: Text(widget.discription.toString()),
          ),

          ElevatedButton(

            style: ElevatedButton.styleFrom(minimumSize: Size(412, 50)),

            child: Text("Approve"),
            onPressed: () { showDialog(context: context, builder: (context)
            {
              return Container(
                  child:AlertDialog(
                    title: Text("Message "),
                    actions: [
                      TextField(
                        controller: Contents,
                                     ),
                      TextButton(onPressed: (){
                             Navigator.pop(context);
                             approve(Contents.text.toString(),widget.Id , widget.myId, widget.sender.toString(), widget.wId, DateTime.now().toString());

                      }, child: Text("Send")),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Exit"))
                    ],
                  )
              );
            },);
            },
          ),
          SizedBox(height: 10,),

        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

