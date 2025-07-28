import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:empro/main.dart';
import 'dart:convert'as convert;

class setting extends StatefulWidget {
final int myId;

const setting({
  Key? key,
  required this.myId,
}) : super(key: key);  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {

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

  Future<Object> updatePass(
      String pass,
      )async{
    try{
      var map= Map<String,dynamic>();
      map['action'] = "updatepass";
      map['pass']= pass;
      map['Id']= widget.myId.toString();
      map['type']="employer";
      var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/empro.php');
      final response =  await http.post(url,body: map);
      if(response.statusCode==200){
        return Container(
            child: AlertDialog(
              title: Text("update Password"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("ok")),
              ],
            )
        );

        print(map["type"]);
        return response.body;}
      else{
        print(map["type"]);
        return 'connection error';}
    }
    catch(e){
      print(e);
      return e;
    }
  }
  Future<Object> updatePhone(
      String phone,
      )async{

    try{
      var map= Map<String,dynamic>();
      map['action'] = "updatephone";
      map['phone']= phone;
      map['Id']= widget.myId.toString();
      map['type']="employer";
      var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/empro.php');
      final response =  await http.post(url,body: map);
      if(response.statusCode==200){
        print(map["type"]);
        return response.body;}
      else{
        print(map["type"]);
        return 'connection error';}
    }
    catch(e){
      print(e);
      return e;
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllemp();
    password =TextEditingController();
    phone =TextEditingController();
    Confirmpassword =TextEditingController();
    currentPass =TextEditingController();
  }
  late TextEditingController password;
  late TextEditingController Confirmpassword;
  late TextEditingController phone;
  late TextEditingController currentPass;
change(int t ){
 if(t==1) {
   if (password.text != null && Confirmpassword.text != null ) {
     if (password.text == Confirmpassword.text) {
       if (pro[0]["Password"] == currentPass.text) {
         updatePass(password.text);
         return showDialog(context: context, builder: (context) {
           return Container(
               child: AlertDialog(
                 title: Text("Password UpDated"),
                 actions: [
                   TextButton(onPressed: () {
                     Navigator.pop(context);
                   }, child: Text("ok")),
                 ],
               )
           );
         },);
       }
       else {
         return showDialog(context: context, builder: (context) {
           return Container(
               child: AlertDialog(
                 title: Text("PassWord not Correct"),
                 actions: [
                   TextButton(onPressed: () {
                     Navigator.pop(context);
                   }, child: Text("ok")),
                 ],
               )
           );
         },);
       }
     }
     else {
       return showDialog(context: context, builder: (context) {
         return Container(
             child: AlertDialog(
               title: Text("PassWord not the Same"),
               actions: [
                 TextButton(onPressed: () {
                   Navigator.pop(context);
                 }, child: Text("ok")),
               ],
             )
         );
       },);
     }
   }
   else {
     return showDialog(context: context, builder: (context) {
       return Container(
           child: AlertDialog(
             title: Text("notting insert"),
             actions: [
               TextButton(onPressed: () {
                 Navigator.pop(context);
               }, child: Text("ok")),
             ],
           )
       );
     },);
   }
 }
 else if(t==2){
   if (phone.text != null  ) {
     
       if (pro[0]["Password"] == currentPass.text) {
         updatePhone(phone.text);
         return showDialog(context: context, builder: (context) {
           return Container(
               child: AlertDialog(
                 title: Text("Phone UpDated"),
                 actions: [
                   TextButton(onPressed: () {
                     Navigator.pop(context);
                   }, child: Text("ok")),
                 ],
               )
           );
         },);
       }
       else {
         return Container(
             child: AlertDialog(
               title: Text("not UpDated"),
               actions: [
                 TextButton(onPressed: () {
                   Navigator.pop(context);
                 }, child: Text("ok")),
               ],
             )
         );

       }
     

   }
   else{
     return Container(
         child: AlertDialog(
           title: Text("empty"),
           actions: [
             TextButton(onPressed: () {
               Navigator.pop(context);
             }, child: Text("ok")),
           ],
         )
     );
   }
  }
else {
  
 }
}
  Future<Object> Delete()async{
    try{
      var map= Map<String,dynamic>();
      map['action'] = "DeleteAcc";
      map['Id'] = "1";
      map['type'] = "employer";
      var url = Uri.parse('http://192.168.8.190:8000//FreeLanceEth/empro.php');
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
    title: Text("Setting"),
  ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
               height: 200,
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
                            image:DecorationImage(
                              image: NetworkImage("http://192.168.8.190:8000//FreeLanceEth/upload/"+pro[0]["ProfileImage"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(top: 20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         children:[ Text("Name : "+pro[0]['FirstName']+" "+pro[0]['FirstName'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                           Text("Address : "+pro[0]['Address'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                           Text("Email : "+pro[0]['Email'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                           Text("phoneNumber : "+pro[0]['Phonenumber'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("Profession : "+pro[0]['Profession'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),]


                      ),
                      )


                      ],
                    ),
                  ),

                ],
              ),
            ),
           Container(
             child:Column(
           children:[
             Container(
               color: Colors.blue,
               child:Column(
                children:[
                  SizedBox(height: 10,),
               Container(
                 color: Colors.white,
                 child: Column(
                   children: [
                  Text("Change Password"),
            TextField(controller: password,),],),),
                   SizedBox(height: 10,),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("Confirm Password"),
                        TextField(
                          controller: Confirmpassword,
                        ),],),),
                   SizedBox(height: 10,),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("Current Password"),
                        TextField(controller: currentPass),],),),
                  SizedBox(height: 10,),

             ],),),


            Container(
              color: Colors.lightBlueAccent,

              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Change Phone number"),
                  Row(

                    children: [
                      Icon(Icons.phone),
                      Expanded(child:  TextField(controller: phone,),)

                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),

            ElevatedButton(

              style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

              child: Text("update Password"),
              onPressed: () {  showDialog(context: context, builder: (context)
              {
                return Container(
                    child:AlertDialog(
                      title: Text("Are you sure?"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                          change(1);

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
             SizedBox(height: 10,),

             ElevatedButton(

               style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

               child: Text("update Phone NUmber"),
               onPressed: () {  showDialog(context: context, builder: (context)
               {
                 return Container(
                     child:AlertDialog(
                       title: Text("Are you sure?"),
                       actions: [
                         TextButton(onPressed: (){
                           Navigator.pop(context);
                           change(2);

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
            SizedBox(height: 10,),
            ElevatedButton(

              style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

              child: Text("Delete Account"),
              onPressed: () {  showDialog(context: context, builder: (context)
              {
                return Container(
                    child:AlertDialog(
                      title: Text("Are you sure?"),
                      actions: [
                        TextButton(onPressed: (){
                          Delete();//go to login page
                          Navigator.pop(context);
                        }, child: Text("yes")),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("no"))
                      ],
                    )
                );
              },);
              },
            ),],),),
          ],
        ),
      ),
    );
  }
}
