import 'package:flutter/material.dart';
import 'package:search/invitation.dart';
class change extends StatefulWidget {
  final String sender;


  const change({
    Key? key,
    required this.sender,

  }) : super(key: key);

  @override
  State<change> createState() => _changeState();
}

class _changeState extends State<change> {
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
                  margin:EdgeInsets.only(bottom:10),
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
                            image: AssetImage('assets/user_picture.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),



          ElevatedButton(

            style:ElevatedButton.styleFrom(minimumSize:Size(412, 50)),

            child: Text("update"),
            onPressed: () {  showDialog(context: context, builder: (context)
            {
              return Container(
                  child:AlertDialog(
                    title: Text("Are you sure?"),
                    actions: [
                      TextButton(onPressed: (){
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
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}