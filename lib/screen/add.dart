import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String? selectedItem;
  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundColor_Container(context),
            Positioned(top: 120, child: main_Container()),
          ],
        ),
      ),
    );
  }

  Container main_Container() {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Color(0xffc5c5c5)),
              ),
              child: DropdownButton<String>(
                items: _item
                    .map((e) => DropdownMenuItem(child: Container(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        child: Image.asset('images/${e}.png'),
                      ),
                      SizedBox(height: 10,width: 10,),
                      Text(e,style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ), value: e))
                    .toList(),
                hint: Text('Name', style: TextStyle(color: Colors.grey),),
                dropdownColor: Colors.white,
                isExpanded: true,
                underline: Container(),
                onChanged: ((value) {
                  setState(() {
                    selectedItem = value;
                  });
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column backgroundColor_Container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'Adding',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.attach_file_outlined, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
