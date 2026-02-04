import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//ham main
void main(){
  runApp(const MyApp());//ung dung flutter
}
//file cau hinh: goi file nao chay
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo 9',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: MyListViewSlot9(),//man hinh chinh la MyListViewSlot9
    );
  }
}
//dinh nghia man hinh chinh
class MyListViewSlot9 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _MyListViewSlot9();//lop quan ly trang thai cho MyListViewSlot9
  }
}
//dinh nghia lop quan ly trang thai
class _MyListViewSlot9 extends State<MyListViewSlot9>{
  late List<Photo> photos;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromServer();//goi ham load du lieu
  }
  Future<void> fetchDataFromServer() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1/photos'));
    if(response.statusCode == 200){
      final List<dynamic> jsonData = json.decode(response.body);//lay du lieu tu server
      photos = jsonData.map((item)=>Photo.fromJson(item)).toList();//chuyen sang doi tuong fluter hieu duoc
      setState(() {

      });//cap nhat trang thai
    }
    else {
      throw Exception('Failed to load data from API');
    }
  }
  //giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vi du ve Listview'),),
      body: photos == null ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(photos[index].title),
              leading: CircleAvatar(backgroundImage: NetworkImage(photos[index].thumbnailUrl),),
              // xu ly su kien
              onTap: (){
                //chuyen sang man hinh chi tiet
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                DetailScreen(title: photos[index].title,imageUrl:photos[index].url,
                    ),
                  ),
                );
              }
            );
          }),
    );
  }
}
//Dinh nghia model Photo
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({required this.title,required this.url,required this.thumbnailUrl});
  //ham chuyen doi tu json
factory Photo.fromJson(Map<String, dynamic> json){
  return Photo(
    title: json['title'],
    url: json['url'],
    thumbnailUrl: json['thumbnailUrl'],
  );
}
}
//dinh nghia DetailScreen
class DetailScreen extends StatelessWidget{
  final String title;
  final String imageUrl;
  DetailScreen({required this.title,required this.imageUrl});
  //giao dien cua Detail
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network(imageUrl),
          ],
        ),
      ),
    );
  }
}