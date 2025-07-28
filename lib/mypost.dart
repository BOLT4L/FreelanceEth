import 'package:empro/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:empro/interests.dart';
class new1 extends StatefulWidget {
  final int myId;
  final String sender;
  final String discription;
  final String ip;
  final int type;
  final String title;
  final String Address;
  final String Date;
  final String Profession;
  final int Pay;
  final int workid;
  const new1({
    Key? key,
    required this.sender,
    required this.myId,
    required this.discription,
    required this.ip,
    required this.title,
    required this.workid,
    required this.Address,
    required this.Date,
    required this.type,
    required this.Profession,
    required this.Pay,
  }) : super(key: key);
  @override
  State<new1> createState() => _new1State();
}

class _new1State extends State<new1> {
  Future<Object> Delete()async{
    try{
      var map= Map<String,dynamic>();
      map['action'] = "delete";
      map['Wid'] = widget.workid.toString();
      var url = Uri.parse('http://'+widget.ip+':8000//FreeLanceEth/empro.php');
      final response =  await http.post(url,body: map);
      if(response.statusCode==200){
        return response.body;}
      else{
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
        title: Text(widget.Profession),

      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            height: 200,
            padding: EdgeInsets.all(20),


                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title : "+widget.title.toString(), maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Employer Name : "+widget.sender.toString(), maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Address : "+widget.Address.toString(), maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Date Issued: "+ widget.Date.toString(), maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Payment: "+ widget.Pay.toString(), maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              "Service Amount : "+ widget.type.toString(), maxLines: 1,
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
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: 500,
            height: 300,
            color: Colors.lightBlue,
            child: Text(widget.discription.toString()),
          ),

          ElevatedButton(

            style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

            child: Text("Interests"),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => interest(wrokId:widget.workid ,myId: widget.myId),
              ),);
            },
          ),
          SizedBox(height: 10,),
          ElevatedButton(

            style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

            child: Text("deletePost"),
            onPressed: () {
              showDialog(context: context, builder: (context)
              {
               return Container(
                 child:AlertDialog(
                   title: Text("Are you sure?"),
                   actions: [

                     TextButton(onPressed: (){
                       Delete();
                       Navigator.pop(context);
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>LandingPage(myId: widget.myId,),
                         ),);
                     }, child: Text("yes")),
                     TextButton(onPressed: (){
                       Navigator.pop(context);
                     }, child: Text("no"))
                   ],
                 )
               );
              },);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
