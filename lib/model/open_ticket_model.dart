class OpenTicketModel {
  String? name;
  String? amount;
  DateTime? created;
  bool? isChecked;

  OpenTicketModel({
    this.isChecked,
    this.name,
    this.amount,
    this.created,
  });

  // void toogleAdded() {
  //   isChecked = !isChecked;
  // }
}
