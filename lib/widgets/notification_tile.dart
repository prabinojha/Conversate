import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(
          color: const Color.fromRGBO(2, 43, 58, 1),
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
              'Notifications',
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
            child: FlutterSwitch(
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Colors.grey,
              toggleSize: 20,
              value: status,
              borderRadius: 30.0,
              padding: 8.0,
              showOnOff: false,
              onToggle: (val) {
                setState(
                  () {
                    status = val;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
