import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
void main(){
  runApp(MyApp()); //app chinh
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rest API demo',
      home: ProductPage(),//goi den man hinh can quan ly
    );
  }
}
class ProductPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ProductPageState();
  }
}
class _ProductPageState extends State<ProductPage>{
  List products = [];
  bool loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }
  //dinh nghia ham fetchProduct
  Future fetchProducts() async {
    final response = 
    await http.get(Uri.parse("http://localhost:3000/api/products"));
    final data = jsonDecode(response.body);
    //cap nhat trang thai
    setState(() {
      products = data["data"];
      loading=false;
    });
    
  }
  //giao dien
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sach san pham"),),
      body: loading
        ? Center(child: CircularProgressIndicator(),)
          : ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            final product = products[index];
            return ListTile(
              title: Text(product["name"]),
              subtitle: Text("Gia: ${product["price"]}"),
            );
          })
    );
  }
}
//FLutter App => api/product => backend serever => json resonse => hien thi listview