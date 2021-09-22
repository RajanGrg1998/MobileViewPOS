import 'package:flutter/material.dart';
import 'package:posmobile_app/provider/ticket.dart';
import 'package:posmobile_app/screens/ticket_screen/edit_Items_screen.dart';
import 'package:posmobile_app/utils/custombutton.dart';
import 'package:posmobile_app/utils/dropDownItem.dart';
import 'package:provider/provider.dart';

class TicketDetail extends StatelessWidget {
  final int index;
  TicketDetail(this.index);

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<TicketProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('${_controller.openTicketList[index].name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeHeight(),
            DropdownItem(),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Items Ordered'),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    itemCount: _controller.itemsOrdered.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final itemsOrdered = _controller.itemsOrdered[index];
                      return Dismissible(
                        key: ValueKey(itemsOrdered),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          _controller.dismisItemOrdered(itemsOrdered);
                        },
                        background: Container(
                          padding: EdgeInsets.only(right: 20),
                          color: Color(0xffF2DFDF),
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                        child: MenuItemText(
                          itemName: itemsOrdered.itemName,
                          itemQuantity: itemsOrdered.itemQuantity,
                          itemRate: itemsOrdered.itemRate,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditItemScreen(index)),
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => sizeHeight(),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total'),
                      Text('Rs 3000'),
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   color: Colors.red,
            //   child: IntrinsicHeight(
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: <Widget>[
            //         // Container(
            //         //   width: 20.0,
            //         //   color: Colors.amber,
            //         // ),
            //         Expanded(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text('Items Ordered'),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Text('Mo:Mo '),
            //                       Text('x 2'),
            //                     ],
            //                   ),
            //                   Text('Rs. 240'),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  title: 'Save Order',
                  onPressed: () {},
                  shape: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomLeft: Radius.circular(3)),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                ),
                VerticalDivider(
                  width: 1,
                ),
                CustomElevatedButton(
                  title: 'Procced to Pay',
                  shape: BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3)),
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox sizeHeight() {
    return SizedBox(
      height: 10,
    );
  }
}

class MenuItemText extends StatelessWidget {
  final String itemName;
  final int itemQuantity;
  final double itemRate;
  final Function()? onTap;
  const MenuItemText({
    Key? key,
    required this.itemName,
    required this.itemQuantity,
    required this.itemRate,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(itemName),
              Text(' x$itemQuantity'),
            ],
          ),
          Text('Rs. $itemRate'),
        ],
      ),
    );
  }
}
