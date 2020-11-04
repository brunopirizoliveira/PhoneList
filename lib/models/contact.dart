class Contact {
  final int id;
  final String fullName;
  final int accounNumber;

  Contact({this.id, this.fullName, this.accounNumber});

  @override
  String toString() {
    return 'Contact{id: $id, name: $fullName, account: $accounNumber}';
  }
}