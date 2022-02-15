class PasswordEntity {
  String value = "";
  PasswordEntity();

  int length() => value.length;

  addPasswordSymbol(String symbol) => value += symbol;

  removePasswordLastSymbol() {
    if (value.isNotEmpty) {
      value = value.substring(0, value.length - 1);
    }
  }

  @override
  String toString() => value;
}
