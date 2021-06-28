import 'dart:js';

import 'package:flutter/material.dart';


class Todo extends StatefulWidget {
  const Todo({ Key? key }) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "";
  List<dynamic>lst = [1,2,3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: ListView.builder(
     itemCount: lst.length,
     itemBuilder: (context,index){
     return Container(
       
       height: 50,
       color: Colors.pink,
       margin: EdgeInsets.only(top: 15),
       child: ListTile(
        
   title: Text("${lst[index]}"),
   trailing: Container(
     height: 50,
     child: Row(
       children: [
          GestureDetector(onTap:(){
             showDialog(context: context, builder: (context){
       return AlertDialog(
         title: Text("add item") ,
         content: TextField(
           onChanged: (value){
             output = value;
           },
         ),
         actions: [
           ElevatedButton(onPressed: (){
             setState(() {
               lst.replaceRange(index, index+1, {output});
             });
           }, child:Text("edit item"))
         ],
       );
     });
         },
           child: Icon(Icons.edit)),
      
         GestureDetector(onTap:(){
setState(() {
  lst.removeAt(index);
});
         },
           child: Icon(Icons.delete)),
       ],
     ),
   ),
       ),
     );
   }),
   floatingActionButton: FloatingActionButton(onPressed: (){
     showDialog(context: context, builder: (context){
       return AlertDialog(
         title: Text("add item") ,
         content: TextField(
           onChanged: (value){
             output = value;
           },
         ),
         actions: [
           ElevatedButton(onPressed: (){
             setState(() {
               lst.add(output);
             });
           }, child:Text("add"))
         ],
       );
     });
   },child: Text("Add Item"),),
    
      
    );
    

  }
}