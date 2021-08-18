class DateToStringConverter {
  static String converter(DateTime date) {
    print(date);
    var dateSplitted = date.toString().split(' ');
    return dateSplitted.first;
  }
}
