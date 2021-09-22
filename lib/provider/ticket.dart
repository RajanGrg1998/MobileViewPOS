import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:posmobile_app/model/items_ordered_mode.dart';
import 'package:posmobile_app/model/open_ticket_model.dart';

class TicketProvider extends ChangeNotifier {
  //open ticket list

  final List<OpenTicketModel> _openTicketList = [
    OpenTicketModel(
      name: 'Amit Shrestha',
      amount: 'Rs. 2520',
      created: DateTime.parse("2021-09-17 07:50:04"),
      isChecked: false,
    ),
    OpenTicketModel(
      name: 'Bhagyashree Thapa',
      amount: 'Rs. 2100',
      created: DateTime.parse("2021-07-29 14:50:04"),
      isChecked: false,
    ),
    OpenTicketModel(
      name: 'Yumi Gurung',
      amount: 'Rs. 2510',
      created: DateTime.parse("2021-09-05 14:50:04"),
      isChecked: false,
    ),
    OpenTicketModel(
      name: 'Kritikaa Thapa',
      amount: 'Rs. 1121',
      created: DateTime.parse("2021-07-20 14:50:04"),
      isChecked: false,
    ),
    OpenTicketModel(
      name: 'Anmol Gurung',
      amount: 'Rs. 2500',
      created: DateTime.parse("2021-07-20 14:50:04"),
      isChecked: false,
    ),
    OpenTicketModel(
      name: 'Nrijala Shrestah',
      amount: 'Rs. 2211',
      created: DateTime.parse("2021-09-14 09:50:04"),
      isChecked: false,
    ),
  ];
//using get to access private open list
  UnmodifiableListView<OpenTicketModel> get openTicketList =>
      UnmodifiableListView(_openTicketList);

  // final List<Map<String, dynamic>> systemSettingList = [
  //   {
  //     "title": "Features",
  //     "route": FeaturesScreen(),
  //   },
  // ];

//swipe to delete selected index

  void dismisDelete(OpenTicketModel openTicketModel) {
    _openTicketList.remove(openTicketModel);
    print('deleted');
    notifyListeners();
  }

  changeSwitchValue(int index) {
    _openTicketList[index].isChecked = !_openTicketList[index].isChecked!;
    notifyListeners();
  }

//to sort radio button value
  selectedRadio(SortBy value) {
    selectedItem.value = value;
    if (selectedItem.value == sortby.first) {
      _openTicketList.sort((a, b) => a.name!.compareTo(b.name!));
      print('Sorted by Name');
    } else if (selectedItem.value == sortby.last) {
      _openTicketList.sort((a, b) => b.created!.compareTo(a.created!));
      print('Sorted by Time ago');
    } else
      _openTicketList.sort((a, b) => a.amount!.compareTo(b.amount!));
    print('Sorted by Amount');
    notifyListeners();
  }

//sort by list
  final List<SortBy> sortby = [
    SortBy(name: 'Name'),
    SortBy(name: 'Amount'),
    SortBy(name: 'Time'),
  ];

//radio valuenotifier for animated builder
  ValueNotifier<SortBy> selectedItem =
      new ValueNotifier<SortBy>(SortBy(name: 'Name'));

//for items ordered

  final List<ItemsOrdered> _itemsOrdered = [
    ItemsOrdered(
      itemName: 'Chowmin',
      itemQuantity: 3,
      itemRate: 300,
    ),
    ItemsOrdered(
      itemName: 'Pizza',
      itemQuantity: 2,
      itemRate: 1000,
    ),
    ItemsOrdered(
      itemName: 'Sizzler',
      itemQuantity: 1,
      itemRate: 340,
    ),
    ItemsOrdered(
      itemName: 'Coca cola',
      itemQuantity: 4,
      itemRate: 400,
    ),
    ItemsOrdered(
      itemName: 'Chowmin',
      itemQuantity: 4,
      itemRate: 100,
    ),
    ItemsOrdered(
      itemName: 'Mo : Mo',
      itemQuantity: 1,
      itemRate: 120,
    ),
    ItemsOrdered(
      itemName: 'Pizza',
      itemQuantity: 1,
      itemRate: 500,
    ),
  ];

  UnmodifiableListView<ItemsOrdered> get itemsOrdered =>
      UnmodifiableListView(_itemsOrdered);

  List<String> dropdownItems = <String>[
    'Dine in',
    'Takeaway',
    'Delivery',
  ];
  String dropdonwvalue = 'Dine in';

  dropdownOnchange(String? newValue) {
    dropdonwvalue = newValue!;
    notifyListeners();
  }

  void dismisItemOrdered(ItemsOrdered itemsOrdered) {
    _itemsOrdered.remove(itemsOrdered);
    print('deleted');
    notifyListeners();
  }

//Adds on List

  final List<AddsOn> _addsOn = [
    AddsOn(addonsName: 'Extra cheese', isChecked: false),
    AddsOn(addonsName: 'Toppings', isChecked: false),
    AddsOn(addonsName: 'Extra Sausage', isChecked: false),
  ];

//get private list
  UnmodifiableListView<AddsOn> get addsOn => UnmodifiableListView(_addsOn);

  changeAddsOnValue(int index) {
    _addsOn[index].isChecked = !_addsOn[index].isChecked!;
    notifyListeners();
  }

//Discount List
  final List<Discount> _discounts = [
    Discount(discountName: 'Opening', isDiscountChecked: false),
    Discount(discountName: 'Christmas', isDiscountChecked: false),
  ];

//get private list
  UnmodifiableListView<Discount> get discounts =>
      UnmodifiableListView(_discounts);

  changeDiscountSwitchValue(int index) {
    _discounts[index].isDiscountChecked = !_discounts[index].isDiscountChecked!;
    notifyListeners();
  }

  //Taxes List
  final List<Taxes> _taxes = [
    Taxes(taxName: 'VAT (13%)', isTaxChecked: false),
    Taxes(taxName: 'Christmas', isTaxChecked: false),
  ];

//get private list
  UnmodifiableListView<Taxes> get taxes => UnmodifiableListView(_taxes);

  changeTaxeSwitchValue(int index) {
    _taxes[index].isTaxChecked = !_taxes[index].isTaxChecked!;
    notifyListeners();
  }
//for now quantityCount=1

  int quatity = 1;

  quanityIncrease() {
    quatity++;
    print(quatity);
    notifyListeners();
  }

  quanityDecrease() {
    quatity--;
    print(quatity);
    notifyListeners();
  }

  // final TextEditingController count = TextEditingController();
}

//model class for Sortby
class SortBy {
  String name;
  SortBy({required this.name});
}

//adds on

class AddsOn {
  String addonsName;
  bool? isChecked;

  AddsOn({required this.addonsName, this.isChecked});
}

//disount
class Discount {
  String discountName;
  bool? isDiscountChecked;

  Discount({required this.discountName, this.isDiscountChecked});
}

//taxes
class Taxes {
  String taxName;
  bool? isTaxChecked;

  Taxes({required this.taxName, this.isTaxChecked});
}
