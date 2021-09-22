import 'package:flutter/material.dart';
import 'package:posmobile_app/provider/ticket.dart';
import 'package:posmobile_app/screens/ticket_screen/serachbutton.dart';
import 'package:posmobile_app/screens/ticket_screen/ticket_details.dart';
import 'package:posmobile_app/utils/listile.dart';
import 'package:posmobile_app/utils/menuitems_utils.dart';
import 'package:posmobile_app/utils/timeago.dart';
import 'package:provider/provider.dart';

class TicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<TicketProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            Text(
              'Open Ticket (${_controller.openTicketList.length})',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchButton(),
              PopupOptionMenu(),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final openTicket = _controller.openTicketList[index];
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: ValueKey(openTicket),
                      onDismissed: (direction) {
                        _controller.dismisDelete(openTicket);
                      },
                      background: Container(
                        padding: EdgeInsets.only(right: 20),
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Delete',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      child: TileListBox(
                        isChecked: openTicket.isChecked!,
                        chechBoxCallback: (val) {
                          _controller.changeSwitchValue(index);
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TicketDetail(index)),
                          ); // if (openTicket.isChecked == true) {
                          //   print('true');
                          // } else
                          //   print('false');
                        },
                        created:
                            '${TimeAgo.timeAgoSinceDate(openTicket.created!)}',
                        taxTitle: '${openTicket.name}',
                        amount: '${openTicket.amount}',
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _controller.openTicketList.length),
            ),
          ),
        ],
      ),
    );
  }
}
