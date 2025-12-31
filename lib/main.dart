import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String task = '';
  List<String> manytask = [];
  TextEditingController textcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: const Color.fromARGB(255, 245, 145, 178),
      appBar: AppBar(title: Text('ToDo List App'),
      backgroundColor: const Color.fromARGB(255, 114, 207, 198),
      centerTitle: false,),
      body:
       Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Row( 
              children: [
                Expanded(child: 
                Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              child: TextField( 
                controller: textcontrol,

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellowAccent), // black border
                      borderRadius: BorderRadius.circular(5),
                      ),
        
                    focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.white, width: 2), // thicker black border
                       borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                        label: Text('Enter a Task'),
                        labelStyle: TextStyle(color: Colors.white)
                )
              )
            ),),
            MaterialButton(onPressed: () 
            {
              setState(() {
                manytask.add(textcontrol.text);
                textcontrol.clear();
              });
            } ,
            minWidth: 70,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(60)
            ),
            color: const Color.fromARGB(255, 137, 6, 170),
            child: Text('Add',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold, 
              fontSize: 17),),
            )
              ],
            ),
            
            Flexible(
              child: ListView.builder(
                itemCount: manytask.length,
                itemBuilder: (context, index)
                {
                  return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(5),
                       decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 114, 207, 198),
                       borderRadius: BorderRadius.circular(10), // circular border radius
                      ),
                    child: Text(manytask[index],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  ),),
                  IconButton(iconSize: 30,
                  color: const Color.fromARGB(255, 223, 18, 3),
                    onPressed: () {
                      setState(() {
                        manytask.removeAt(index);
                      });
                    }, icon: const Icon(Icons.delete,))
                ],
              );
              }
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}




