import 'dart:convert';
import 'package:flutter/material.dart';
//flutter pub add http
import 'package:http/http.dart' as http;
//ham main
void main(){
  runApp(const MyApp());//ung dung flutter can chay
}
//file cau hinh
class MyApp extends StatelessWidget{
  const MyApp({super.key});//ham khoi tao
  //This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slot8',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: MyListViewSlot8(), //goi man hinh chinh
    );
  }
}
//man hinh chinh
class MyListViewSlot8 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyListViewSlot8State();
  }
}
//lop quan ly trang thai cho man hinh chinh
class _MyListViewSlot8State extends State<MyListViewSlot8>{
  late List<Photo> photos;
  @override
  void initState() {
    //khoi tao cac trang thai
    super.initState();
    fetchDaraFromServer();//goi ham doc du lieu tu server
  }
  Future<void> fetchDaraFromServer() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos/1/photos')
    );
    if(response.statusCode == 200){
      final List<dynamic> jsonData = json.decode(response.body);
      photos = jsonData.map((item)=>Photo.fromJson(item)).toList();
      //updat lai trang thai
      setState(() {

      });
    }
    else {
      throw Exception('Failed to load data from server');
    }
  }
  //giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vi du ve listview'),
      ),
      body: photos == null
          ? Center(child: CircularProgressIndicator(),)
          : ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(photos[index].title),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(photos[index].thumbnailUrl),
                  ),
                  onTap: (){
                    //xu ly su kien
                    print('Item clicked: ${photos[index].title}');
                  },
                );
              })
      ,
    );
  }
}
//Doi tuong dai dien cho 1 muc trong danh sach
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  //ham khoi tao
  Photo({required this.title,required this.url,required this.thumbnailUrl});
  //ham convert json sang object
  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}