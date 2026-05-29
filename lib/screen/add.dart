import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemI;
  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount = FocusNode();
  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education",
  ];
  final List<String> _itemI = ['Income', 'Expand'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount.addListener(() {
      setState(() {});
    });
  }

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
          name(),
          SizedBox(height: 30),
          explain(),
          SizedBox(height: 30),
          amountNumber(),
          SizedBox(height: 30),
          how(),
          SizedBox(height: 30),
          date_time(),
          Spacer(),
          save(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
          onTap: (){},
          child: Container(
            width: 120,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff368983),
            ),
            child: Text(
              'Save',
              style: TextStyle(
                fontFamily: 'f',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        );
  }

  Container date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Color(0xffc5c5c5)),
      ),
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (newDate == null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          'Time : ${date.year} /  ${date.day} /  ${date.month}',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  Padding how() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffc5c5c5)),
        ),
        child: DropdownButton<String>(
          value: selectedItemI,
          items: _itemI
              .map(
                (e) => DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Container(height: 40),
                        Text(e, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  value: e,
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemI
              .map((e) => Row(children: [SizedBox(width: 5), Text(e)]))
              .toList(),
          hint: Text('How', style: TextStyle(color: Colors.grey)),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          onChanged: ((value) {
            setState(() {
              selectedItemI = value;
            });
          }),
        ),
      ),
    );
  }

  Padding amountNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount,
        controller: amount_c,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff368983)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'explain',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff368983)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffc5c5c5)),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          items: _item
              .map(
                (e) => DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          child: Image.asset('images/${e}.png'),
                        ),
                        SizedBox(height: 10, width: 10),
                        Text(e, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  value: e,
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map(
                (e) => Row(
                  children: [
                    Container(width: 42, child: Image.asset('images/${e}.png')),
                    SizedBox(width: 5),
                    Text(e),
                  ],
                ),
              )
              .toList(),
          hint: Text('Name', style: TextStyle(color: Colors.grey)),
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
