import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  // -----------------------------------------Radio set up-----------------------------------------
  static List<Danger> getDanger(){
    return <Danger>[
      Danger('Short Circult', 'ไฟฟ้ารัดวงจร', 'Eletronic damage', 45),
      Danger('Cigaratte', 'ก้นบุหรี่', 'Smoke', 45),
      Danger('Campfire', 'กองไฟ', 'Heat from flame', 45),
    ];
  }

  // -----------------------------------------end Radio setup-----------------------------------------
  // -----------------------------------------Dropdown setup-----------------------------------------
  final List<Charactor> item = 
  [
    Charactor('Somsak', 'jame','goodman'),
    Charactor('Somsee', 'jane','goodwoman'),
    Charactor('Mai', 'May','Bad woman'),
  ];

  late List<DropdownMenuItem<Charactor>> dropdownMenuitem;
  late Charactor _selectedItem;
  
  @override
  void initState(){
    super.initState();
    dropdownMenuitem = buildDropdownMenuItem(item);
    _selectedItem = dropdownMenuitem[0].value!;
    // danger = getDanger();
  }

  List<DropdownMenuItem<Charactor>> buildDropdownMenuItem(List<Charactor> item) {
    List<DropdownMenuItem<Charactor>> items = [];
    for (Charactor listItem in item) {
      items.add(DropdownMenuItem(
        child: Text(listItem.charactorNameEN),
        value: listItem,
        )
      );
    };
    return items;
  }
  // -----------------------------------------end Dropdown set up-----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello lab6'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //-----------------------------------------DropDown-----------------------------------------
            DropdownButton(
              value: _selectedItem,
              items: dropdownMenuitem,
              onChanged: (value) {
                setState(() {
                _selectedItem = value!;
              });
              },
            ),
            //-----------------------------------------Radio-----------------------------------------

          ],
        )
        ),
    );
  }
}

// -----------------------------------------Class ITEM-----------------------------------------
class Charactor {
  final String charactorNameTH;
  final String charactorNameEN;
  final String charactorDec;

  Charactor(this.charactorNameTH, this.charactorNameEN, this.charactorDec);
}

// -----------------------------------------Class ITEM-----------------------------------------
class Danger{
  final String dangerNameEN;
  final String dangerNameTH;
  final String dangerDec;
  final double dangerChance;

  Danger(this.dangerNameEN, this.dangerNameTH, this.dangerDec, this.dangerChance);
}
