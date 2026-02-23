import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//ham main
void main(){
  runApp(MyApp());
}
//file cau hinh
class MyApp extends StatelessWidget{
  const MyApp({super.key});//ham khoi tao
  //giao dien chung: tieu de + theme+ goi den component nao
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gio hang',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyListView1(), //goi den lop can xu ly
    );
  }
}
//dinh nghia man hinh quan ly trang thai
class MyListView1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyListViewState();
  }
}
//dinh nghia trang trang thai
class _MyListViewState extends State<MyListView1>{
  //https://jsonplaceholder.typicode.com/photos/1/photos
  late List<Photo> photos;
  List<CartItem> cartItems = [];//danh sach san pham trong gio hang
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docDuLieuTuServer();
  }
  Future<void> docDuLieuTuServer() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1/photos'));
    if(response.statusCode == 200){
      final List<dynamic> jsonData = json.decode(response.body);
      //chuyen sang doi tuong photo
      photos = jsonData.map((item)=> Photo.fromJson(item)).toList();
      //cap nhat trang thai
      setState(() {

      });
    } else {
      throw Exception('Failed to load data from server');
    }
  }
  //ham them san pham vao gio hang
void addToCart(Photo photo){
    setState(() {
      cartItems.add(CartItem(title: photo.title, imageUrl: photo.thumbnailUrl));
    });
}
//giao dien
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gio hang'),
        actions: [
          IconButton(
              onPressed: (){
                //hien thi man hinh gio hang khi nguoi dung nhap bieu tuong gio hang
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ShoppingCartScreen(cartItems: cartItems),),
                );
              },
              icon: Icon(Icons.shopping_cart))
        ],),
      body: photos == null ? Center(child: CircularProgressIndicator(),)
      : ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(photos[index].title),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(photos[index].thumbnailUrl),
              ),
              onTap: (){
                //khi 1 item trong gio hang duoc nhap => goi ham them san pham vao gio hang
                addToCart(photos[index]);
              },
            );
          }),
    );
  }
}
//dinh nghia lop xu ly gio hang
class ShoppingCartScreen extends StatelessWidget{
  final List<CartItem> cartItems;
  ShoppingCartScreen({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    //template gio hang
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping cart'),
      ),
      body: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(cartItems[index].title),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(cartItems[index].imageUrl),
              ),
            );
          }),
    );
  }
}
//ding nghia model
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({required this.title, required this.url, required this.thumbnailUrl});
  //ham chuyen doi tu json sang object
factory Photo.fromJson(Map<String,dynamic> json){
  return Photo(title: json['title'], url: json['url'], thumbnailUrl: json['thumbnailUrl']);
}
}
//dinh nghia model cho gio hang
class CartItem {
  final String title;
  final String imageUrl;
  CartItem({required this.title,required this.imageUrl});
}