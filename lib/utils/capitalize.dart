// Text Capitalization Function

String toCap(String s) {
  String capString = s
      .split(" ")
      .map((i) => i.replaceRange(0, 1, i[0].toUpperCase()))
      .join(" ");

  return capString;
}
