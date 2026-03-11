import 'package:flutter/material.dart';
//
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}
class CounterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}
class _CounterPageState extends State<CounterPage>{
  int count = 0;
  void increase(){
    setState(() {
      count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count: ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "$count",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: increase, 
                child: Text("Tang")),
          ],
        ),
      ),
    );
  }
}
/*
Kiến trúc:
User click button =>
increase =>
setState =>
count+ =>
build và chạy lại =>
Text sẽ hiển thị số mới
**/
//nên tách UI và logic
//hạn chế setState toàn màn hình
//nên dùng State Managemengt khi app lớn