import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
//dinh nghia App
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductGridPage(),
    );
  }
}
//dinh nghia class ProductGridPage
class ProductGridPage extends StatelessWidget{
  //khai bao mang chua san pham
  final List<String> products = [
    "Laptop",
    "Ihone",
    "Tablet",
    "Camera",
    "Watch",
    "TV",
    "Speaker",
    "Keyboard"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Grid"),),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text(
                  products[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
            );
          }),
    );
  }
}