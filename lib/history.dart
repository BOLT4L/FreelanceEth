import 'package:empro/employee2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;

class history extends StatefulWidget {
final int myID;

const history({
  Key? key,
  required this.myID,
}) : super(key: key);
  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {

  List<Map<String, dynamic>> allusers=[];
  List<Map<String, dynamic>> catemp=[];
  Future gethis()async{
    catemp.clear();
    allusers.clear();
    var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/search.php');
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
        if(int.parse(catemp[i]["EmployerID"])==widget.myID){
          if(int.parse(catemp[i]["EmployeeID"])!=0){
          allusers.add(catemp[i]);}
        }}
      print(allusers);
      print(catemp.length);
      print(allusers.length);
      return allusers;
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    gethis();
  }
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: gethis,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Employees" ,style: TextStyle(color: Colors.white),),

        ),

        body: ListView.separated(
            itemCount:allusers.length,
            itemBuilder: (context,index){
              return listViewItem(index,context);
            }, separatorBuilder: (context,index) {
          return Divider(height: 0);
        }),


      ),
    );

  }

Widget listViewItem(int index ,context){

  return  ListTile(
    key: ValueKey(allusers[index]["WrokId"]),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => employee2(Id: int.parse(allusers[index]["EmployeeID"]), job:allusers[index]["WorkName"].toString(), dis: allusers[index]["Discritption"].toString(), myID: widget.myID),
        ),);
    },

    tileColor:  Colors.white,
    trailing: Text(allusers[index]["Date"].toString(),style: const TextStyle(fontSize: 14,color: Colors.blue),),
             //trailing:Icon(Icons.star, color: Colors.yellow,),
    subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(maxLines: 3,allusers[index]["Discritption"].toString(),style: const TextStyle(fontSize: 15,color: Colors.cyan),
          ),


        ]),

    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    title:Text(allusers[index]["WorkName"].toString(),style:TextStyle(fontSize:20,color: Colors.blue),),
  );
}



Widget message(int index){

  return Container(
    child: RichText(

      text:TextSpan(

          text: allusers[index]["EmployerName"].toString()+"  ",

          style: TextStyle(
            fontSize:21,
            color:Colors.blue,
            fontWeight:FontWeight.bold,
          ),
          children:[

            TextSpan(
              text: allusers[index]["Discritption"].toString(),
              style: TextStyle(
                fontSize:14,
                color:Colors.blue,
                fontWeight: FontWeight.normal,


              ),),

          ]
      ),
      overflow:TextOverflow.fade,
      maxLines: 3,),


  );
}
Widget time(int index){
  return Container(
    margin: EdgeInsets.only(top:5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(allusers[index]['Date'].toString(),
          style: TextStyle(
            fontSize: 10,
          ),),

      ],
    ),
  );

}
  }




