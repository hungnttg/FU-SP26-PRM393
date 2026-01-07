import 'package:flutter/material.dart';

//ham main
void main() {
  runApp(const MyApp()); //chay ung dung flutter co ten la MyApp
}

//dinh nghia MyApp (file cau hinh)
class MyApp extends StatelessWidget {
  const MyApp({super.key}); //goi ham khoi tao
  //this widget is the root of your application
  @override
  Widget build(BuildContext context) {
    //tra ve man hinh tinh tong
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //thiet lap mau
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //giao dien chinh
      home: MyCalculator(), //goi den MyCalculator
    );
  }
}

//Dinh nghia man hinh chinh
class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() {
    return _MyCalculatorState();
  }
}

//lop quan ly trang thai cua man hinh chinh
class _MyCalculatorState extends State<MyCalculator> {
  TextEditingController num1Control = TextEditingController(); //so 1
  TextEditingController num2Control = TextEditingController(); //so 2
  //bien luu tru ket qua tinh toan
  String kq = '';
  //viet ham tinh tong va cap nhat trang thai
  void calculatorSum() {
    //lay gia tri tu 2 o nhap lieu
    double num1 = double.tryParse(num1Control.text) ?? 0.0;
    double num2 = double.tryParse(num2Control.text) ?? 0.0;
    double sum = num1 + num2;
    //cap nhat trang thai
    setState(() {
      kq = 'Tong: $sum';
    });
  }

  //giao dien cua Man hinh chinh
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ung dung tinh tong')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //thanh phan chinh: text 1
            TextField(
              controller: num1Control, //gan voi so 1
              keyboardType: TextInputType.number, //chi cho nhap so
              decoration: InputDecoration(labelText: 'Nhap so 1'), //placeholder
            ),
            SizedBox(height: 10.0), //khoang cach
            //thanh phan chinh: text2
            TextField(
              controller: num2Control, //gan voi so 2
              keyboardType: TextInputType.number, //chi cho nhap so
              decoration: InputDecoration(labelText: 'Nhap so 2'), //placeholder
            ),
            SizedBox(height: 10.0), //tao khoang cach
            //thanh phan chinh: button
            ElevatedButton(onPressed: calculatorSum, child: Text('Tinh tong')),
            SizedBox(height: 10.0), //khoang cach
            //thanh phan chinh: text hien thi ket qua
            Text(
              kq,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
