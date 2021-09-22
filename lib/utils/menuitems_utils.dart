import 'package:flutter/material.dart';
import 'package:posmobile_app/provider/ticket.dart';
import 'package:provider/provider.dart';

class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<TicketProvider>(context);

    return PopupMenuButton<SortBy>(
      icon: Icon(Icons.sort),
      itemBuilder: (BuildContext context) {
        return List<PopupMenuEntry<SortBy>>.generate(
          _controller.sortby.length,
          (int index) {
            return new PopupMenuItem(
              padding: EdgeInsets.zero,
              value: _controller.sortby[index],
              child: new AnimatedBuilder(
                child: new Text(_controller.sortby.toString()),
                animation: _controller.selectedItem,
                builder: (context, child) {
                  return RadioListTile<SortBy>(
                    title: Text('${_controller.sortby[index].name}'),
                    value: _controller.sortby[index],
                    groupValue: _controller.selectedItem.value,
                    onChanged: (value) {
                      _controller.selectedRadio(value!);
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
