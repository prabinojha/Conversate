import 'package:flutter/material.dart';

class LanguageTile extends StatefulWidget {
  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  String dropdownValue = 'British English';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(
          color: const Color.fromRGBO(
            2,
            43,
            58,
            1,
          ),
          width: 3,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              'Language',
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6!.color,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            child: DropdownButton(
              value: dropdownValue,
              elevation: 0,
              
              icon: const Icon(Icons.arrow_drop_down_rounded),
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6!.color,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'British English',
                'Language 2',
                'Language 3',
                'Language 4'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
