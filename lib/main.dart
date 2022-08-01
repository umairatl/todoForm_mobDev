import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter TODO'),
    );
  }
}

class Todo{
  String? title;
  String? description;
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _textDescriptionController = TextEditingController();
  final _textTitleController = TextEditingController();
  List<Todo> todoList =[];



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // color: Colors.red,
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _textTitleController,
                decoration: InputDecoration(
                  hintText: "TODO Title",
                  border: OutlineInputBorder(),
                ),
              )
          ),
          Container(
            // color: Colors.red,
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _textDescriptionController,
                decoration: InputDecoration(
                  hintText: "TODO Description",
                  border: OutlineInputBorder(),
                ),
              )
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'RESULT', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
    ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20.0),
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(todoList[index].title??'',
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(todoList[index].description??'empty',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Todo todoItem=Todo();
          todoItem.title=_textTitleController.text;
          todoItem.description=_textDescriptionController.text;
          setState(() {
            todoList.add(todoItem);
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
















