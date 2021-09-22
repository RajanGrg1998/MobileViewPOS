import 'package:flutter/material.dart';
import 'package:posmobile_app/provider/ticket.dart';
import 'package:posmobile_app/screens/ticket_screen/tickets_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

const primaryColor = const Color(0xFFFFFFFF);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TicketProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto-Regular',
          primaryColor: primaryColor,
        ),
        home: TicketsScreen(),
      ),
    );
  }
}
