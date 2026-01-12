import 'package:flutter/material.dart';
//ham main
void main(){
  runApp(const MyApp());//chay dung dung flutter
}
//viet file cau hinh
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  //khai bao man hinh can goi
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true
      ),
      home: CalculatorSlot3(),//goi den man hinh chinh
    );
  }
}
//dinh nghia man hinh
class CalculatorSlot3 extends StatefulWidget{
  @override
  _CalculatorSlot3State createState() {
    return _CalculatorSlot3State();
  }
}
//dinh nghia useState cho man hinh chinh
class _CalculatorSlot3State extends State<CalculatorSlot3>{
  //khai bao controller dieu khien cac o nhap lieu
  TextEditingController n1Control = TextEditingController();//text1
  TextEditingController n2Control = TextEditingController();//text2
  String result = '';//luu result tinh toan
  void SumCal(){
    //getter du lieu tu 2 o nhap lieu
    double n1 = double.tryParse(n1Control.text) ?? 0.0;
    double n2 = double.tryParse(n2Control.text) ?? 0.0;
    double tong = n1+n2;
    //cap nhat vao ket qua
    setState(() {
      result = 'Tong la $tong';
    });
    //chuyen ket qua sang man hinh 2
    Navigator.push(context, MaterialPageRoute(builder:
      (context)=> ResultScreen(result)),
    );
  }
  //giao dien cua man hinh chinh
  @override
  Widget build(BuildContext context) {
    return Scaffold(//tao template
      appBar: AppBar(title: Text('Tinh tong Slot 3'),
      ),
      body: Padding(padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //dinh nghia cac thanh phan giao dien
            TextField(
              controller: n1Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhap so 1'),
            ),
            SizedBox(height: 15.0,),
            TextField(
              controller: n2Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhap so 2'),
            ),
            SizedBox(height: 15.0,),
            ElevatedButton(onPressed: SumCal, child: Text('Tinh tong')),
            SizedBox(height: 20.0,),
            Text(
              result,
              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
//dinh nghia man hinh hien thi ket qua (co the tao file moi)
class ResultScreen extends StatelessWidget{
  final String result;
  ResultScreen(this.result);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ket qua'),),
      body: Center(
        child: Text(
          result,
          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}