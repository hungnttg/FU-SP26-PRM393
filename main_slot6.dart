import 'package:flutter/material.dart';
//ham main
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyListView(),//man hinh chinh
    );
  }
}
//dinh nghia man hinh chinh
class MyListView extends StatefulWidget{
  @override
  _MyListViewState createState() {
    return _MyListViewState();
  }
}
//lop quan ly tramg thai cua mylistview
class _MyListViewState extends State<MyListView>{
  //tao cac item cho listview
  final List<ListItem> items = [
    ListItem(title: 'Item 1', subtitle: 'Subtitle 1', imageUrl:
    'http://assets.myntassets.com/assets/images/10271347/2019/10/24/2286c5fb-f5c2-436d-ac0a-4e41c79831b51571906926278-Nike-Men-Black-Solid-Standard-Fit-NSW-CE-PK-BASIC-DRI-FIT-Tr-1.jpg'
    ),
    ListItem(title: 'Item 2', subtitle: 'Subtitle 2', imageUrl:
    'http://assets.myntassets.com/assets/images/10271347/2019/10/24/2286c5fb-f5c2-436d-ac0a-4e41c79831b51571906926278-Nike-Men-Black-Solid-Standard-Fit-NSW-CE-PK-BASIC-DRI-FIT-Tr-1.jpg'
    ),
    ListItem(title: 'Item 3', subtitle: 'Subtitle 3', imageUrl:
    'http://assets.myntassets.com/assets/images/10271347/2019/10/24/2286c5fb-f5c2-436d-ac0a-4e41c79831b51571906926278-Nike-Men-Black-Solid-Standard-Fit-NSW-CE-PK-BASIC-DRI-FIT-Tr-1.jpg'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].subtitle),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(items[index].imageUrl),
              ),
              onTap: (){
                //xu ly su kien khi item duoc chon
                print('Item clicked: ${items[index].title}');
              },
            );

          }
      
      ),
    );
  }
}
//dinh nghia ListItem: doi tuong dai dien cho 1 muc trong danh sach
class ListItem {
  final String title;
  final String subtitle;
  final String imageUrl;//link anh
  ListItem({required this.title,required this.subtitle,required this.imageUrl});
}