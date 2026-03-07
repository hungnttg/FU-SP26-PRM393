import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      home: HomePage(),
    );
  }
}
//dinh nghia homepage
class HomePage extends StatelessWidget{
  final List<String> subjects = [
    "Flutter","Android","IOS","React Native","Kotlin"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sach mon hoc"),),
      body: ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(subjects[index]),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> DetailPage(subjects[index]),),);
              },
            );
          }),
    );
  }
}
class DetailPage extends StatelessWidget{
  final String subjectName;
  DetailPage(this.subjectName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chi tiet'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
               "Mon hoc",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 10,),
            Text(
              subjectName,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Quay lai")),
          ],

        ),
      ),
    );
  }
}
//bai tap:
//1. Tao ung dung gom danh sach: Ha Noi, HCM, Da Nang, QUang Ninh
//NHan vao thanh pho => chuyen sang man hinh chi tiet c chua thong tin ve tinh do
//2. Thay Listview boi Gridview