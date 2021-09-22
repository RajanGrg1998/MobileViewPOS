import 'package:flutter/material.dart';
import 'package:posmobile_app/provider/ticket.dart';
import 'package:provider/provider.dart';

class DropdownItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<TicketProvider>(context);
    return DropdownButton<String>(
      iconSize: 30,
      isExpanded: true,
      value: _controller.dropdonwvalue,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
      items: _controller.dropdownItems
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        _controller.dropdownOnchange(newValue);
      },
    );
  }

  DropdownMenuItem<String> buildMenuITem(String item) => DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
      );
}
