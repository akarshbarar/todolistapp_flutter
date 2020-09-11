// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  List<String> taskList=new List();
  
  TextEditingController  task=new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: Color.fromRGBO(143, 129, 124,1),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 2
            )]
          ),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(82,51,69,1),
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(left: 1)),
                  Icon(Icons.arrow_back_ios,size: 40,color: Colors.white,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("To Do List",style: TextStyle(fontSize: 30,color: Colors.white),),
                     SizedBox(
                     height: 5,
                     ),
                     Text("5 Task",style: TextStyle(fontSize: 15,color: Color.fromRGBO(142,120,77,1))),

                  ],
                  ),
                  Icon(Icons.arrow_forward_ios,size:40,color: Colors.white,),
                  Padding(padding: EdgeInsets.only(right: 1)),

                ],
              ),
            ),
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.builder(
            
                itemCount: taskList.length,
                itemBuilder: (context,index){
                  return Container(
                    padding:EdgeInsets.only(top:20),
                    height: 80,
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Text(taskList[index].toString(),textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(233, 233, 233,1),fontSize:40),),
                         MaterialButton(child: Text("Edit",style:TextStyle(color:Colors.white)),onPressed: (){
                           
                           
                           setState((){
                             
              showDialog(
                context:context,
                 builder:(BuildContext context){
                   return AlertDialog(
                      title:Text("Edit a task"),
                      content:TextField(
                       controller:task,
                        
                      ),
                     actions:<Widget>[
                       FlatButton(
                        child:Text("Edit"),
                         onPressed:(){
                          
                           
                           setState(() {
                             print("PRESSED");
                             taskList[index]=task.text;
                              Navigator.of(context).pop();
                              print(taskList);
                           });
                          
                         }
                       ),
                        FlatButton(
                        child:Text("CLOSE"),
                         onPressed:(){
                           Navigator.of(context).pop();
                         }
                       ),
                       
                     ],
                   );
                 }
               );
                           });
                           
                         },),
                         MaterialButton(child: Text("Done",style:TextStyle(color:Colors.white)),onPressed: (){
                           
                           setState((){
                             taskList.remove(taskList[index]);
                             
                           });
                         },),
                        
                        
                      ],
                    ),
                    
                    
                  );
                }
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
             child: const Icon(Icons.add,color: Colors.white,),
             onPressed: (){
            
               showDialog(
                context:context,
                 builder:(BuildContext context){
                   return AlertDialog(
                      title:Text("Add a task"),
                      content:TextField(
                       controller:task
                      ),
                     actions:<Widget>[
                       FlatButton(
                        child:Text("ADD"),
                         onPressed:(){
                          
                           
                           setState(() {
                             print("PRESSED");
                             taskList.add(task.text);
                              Navigator.of(context).pop();
                              print(taskList);
                           });
                          
                         }
                       ),
                        FlatButton(
                        child:Text("CLOSE"),
                         onPressed:(){
                           Navigator.of(context).pop();
                         }
                       ),
                       
                     ],
                   );
                 }
               );
             },
      ),
      floatingActionButtonLocation:    
        FloatingActionButtonLocation.centerFloat,
      ),
    );
      
      
      
      
      
      
  }
}
