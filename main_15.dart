//thiết kế form
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      home: HomePage15(),
    );
  }
}
class HomePage15 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePage15();
  }
}
class _HomePage15 extends State<HomePage15>{
  TextEditingController nameController=TextEditingController();
  TextEditingController classController = TextEditingController();
  String result ="";
  void showInfo(){
    setState(() {
      String name=nameController.text;
      String lop=classController.text;
      result = "Ten: $name\nLop: $lop";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form SInh vien"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Ten sinh vien",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: classController,
              decoration: InputDecoration(
                labelText: "Lop",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: showInfo,
                child: Text("Hien thi thong tin"),),
            SizedBox(height: 30,),
            Text(
              result,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
        ],
      ),
      ),
    );
  }
}
//bai tap"
//sua lai form nhap lieu de co cac truowng: Ho ten, email, sdt, password (co validate)