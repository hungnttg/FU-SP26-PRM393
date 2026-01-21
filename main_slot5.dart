import 'package:flutter/material.dart';
void main(){
  runApp(CalculatorApp());
}
class CalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}
class CalculatorScreen extends StatefulWidget{
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}
class _CalculatorScreenState extends State<CalculatorScreen>{
  String displayText = '';//ket qua
  double num1 = 0;//so hang 1
  double num2=0;//so hang 2
  String operation = '';//phep tinh
  bool isDieuKhienDisplay = false;
  void onNhanSo(String so){
    setState(() {
      if(isDieuKhienDisplay){
        displayText='';//xoa trang
        isDieuKhienDisplay=false;
      }
      displayText += so; //noi so vao bieu thuc
    });
  }
  void onNhanPhepTinh(String newPhepTinh){
    setState(() {
      num1 = double.parse(displayText);
      operation = newPhepTinh;
      isDieuKhienDisplay=true;
    });
  }
  void onNhanDauBang(){
    setState(() {
      num2 = double.parse(displayText);
      switch(operation){
        case '+':
          displayText=(num1+num2).toString();
          break;
        case '-':
          displayText=(num1-num2).toString();
          break;
        case '*':
          displayText = (num1*num2).toString();
          break;
        case '/':
          if(num2 != 0){
            displayText=(num1/num2).toString();
          } else {
            displayText='Error';
          }
          break;
        default:
          break;
      }
      isDieuKhienDisplay=true;
    });
  }
  //ham xoa du lieuj sau khi tinh toan
  void onClearPress(){
    setState(() {
      displayText='';
      num1=0;
      num2=0;
      operation='';
      isDieuKhienDisplay=false;
    });
  }
  //phan giao dien
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      body: Column(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black,
            alignment: Alignment.bottomRight,
            child: Text(
              displayText,
              style: TextStyle(fontSize: 35.0,color: Colors.white),
            ),
          ),
        
          ),
          buildButtonRow(['7','8','9','/'], onNhanSo, onNhanPhepTinh),
          buildButtonRow(['4','5','6','*'], onNhanSo, onNhanPhepTinh),
          buildButtonRow(['1','2','3','-'], onNhanSo, onNhanPhepTinh),
          buildButtonRow(['0','.','=','+'], onNhanSo, (value){
            if(value == '='){
              onNhanDauBang();
            }
            else {
              onNhanPhepTinh(value);
            }
          }),
          Container(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: onClearPress, child: Text('C'),)
              ],
            ),
          ),
        ],
      ),
    );
  }

//dinh nghia widget rieng
Widget buildButtonRow(List<String> buttons,Function(String) onDigitPress,
Function(String) onOperationPress ){
  return Container(
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons
        .map(
          (button)=>ElevatedButton(
            onPressed: (){
              if(button == '+' || button == '-' || button == '*' || button == '/' || button == '='){
                onOperationPress(button);
              }
              else {
                onDigitPress(button);
              }
            }
          , child: Text(
            button,
            style: TextStyle(fontSize: 25.0),
          ),
          ),
        ).toList(),
    ),
  );
}
}