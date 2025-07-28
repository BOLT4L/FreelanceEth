import 'package:flutter/material.dart';
import 'package:empro/mypost.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;
import 'package:empro/jobletter.dart';



class interest extends StatefulWidget {
  final int wrokId;
  final int myId;
  const interest({
    Key? key,
    required this.wrokId,
    required this.myId,
  }) : super(key: key);  @override
  State<interest> createState() => _interestState();
}

class _interestState extends State<interest> {

  int type =3;
  List<Map<String, dynamic>> emp=[];
  List<Map<String, dynamic>> catemp=[];
  Future getAllemp()async{
    catemp.clear();
    emp.clear();
    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/notification.php');
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
      if(int.parse(catemp[i]["RecieverId"])==widget.myId && int.parse(catemp[i]["wrokId"])==widget.wrokId && int.parse(catemp[i]["type"])==3 ){
        emp.add(catemp[i]);
      }}
      print(emp);
      print(catemp.length);
      print(emp.length);
      return emp;
    }
  }
  @override
  initState() {
    // TODO: implement initState

    super.initState();

    getAllemp();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Interested Employee"),
      ),
      body: ListView.separated(
          itemCount:emp.length,
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
                      MaterialPageRoute(builder: (context) => letter(
                        sender:emp[index]["SenderName"].toString(), discription:emp[index]["Content"].toString(),wId: int.parse(emp[index]["wrokId"]),Id:int.parse(emp[index]["SenderId"].toString()) ,myId: widget.myId,
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

                            text: emp[index]["SenderName"].toString()+"  ",

                      style: TextStyle(
                        fontSize:21,
                        color:Colors.blue,
                        fontWeight:FontWeight.bold,
                      ),
                      children:[

                        TextSpan(
                          text: emp[index]["Content"].toString(),
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
                    Text('21/0ct/23023',
                      style: TextStyle(
                        fontSize: 10,
                      ),),
                    Text('10 pm',
                      style: TextStyle(
                        fontSize: 10,
                      ),)
                  ],
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