import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
//ham main
void main(){
  runApp(MyApp());
}
//file cau hinh
class MyApp extends StatelessWidget{
  const MyApp({super.key});//ham khoi tao
  //giao dien
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gio hang voi GridView",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyGridView1(),//goi den app chinh
    );
  }
}
//dinh nghia man hinh MyGridView1
class MyGridView1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyGridView1State();//quan ly trang thai cho MyGridView1
  }
}
//dinh nghia phan quan ly trang thai
class _MyGridView1State extends State<MyGridView1>{
  late List<Photo> photos;
  List<CartItem> cartItems = [];//danh sach san pham trong gio hang
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromServer();//goi ham doc du lieu tu server
  }
  Future<void> fetchDataFromServer() async {
   final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1/photos'));
   if(res.statusCode == 200){
     final List<dynamic> jData = json.decode(res.body);
     photos = jData.map((item)=>Photo.fromJson(item)).toList();//chuyen json sang object
     setState(() {

     });
   } else {
     throw Exception('Khong the doc du lieu tu server');
   }
  }
  //ham them san pham vao gio hang
void addToCart(Photo p){
  setState(() {
    cartItems.add(CartItem(title: p.title, imageUrl: p.thumbnailUrl));
  });
}
//giao dien
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        ShoppingCartScreen(cartItems: cartItems)));
              },
              icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: photos == null
          ? Center(child: CircularProgressIndicator(),)
          : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0),
            itemCount: photos.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  addToCart(photos[index]);//khi click vao gridview => them vao gio hang
                }, 
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Image.network(
                            photos[index].thumbnailUrl,
                            fit: BoxFit.cover,
                          ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            photos[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 13.0),
                          ),
                      )
                    ],
                  ),
                ),
                
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
    return Scaffold(
      appBar: AppBar(title: Text('Shopping cart'),),
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
//dinh nghia cac model
class Photo {
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({required this.title,required this.url, required this.thumbnailUrl});
  //ham chuyen doi tu json sang doi tuong flutter
factory Photo.fromJson(Map<String, dynamic> json){
  return Photo(title: json['title'], url: json['url'], thumbnailUrl: json['thumbnailUrl']);
}
}
//tao model gio hang
class CartItem {
  final String title;
  final String imageUrl;
  CartItem({required this.title,required this.imageUrl});
}
