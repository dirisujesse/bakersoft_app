class BakerRegex {
  static final RegExp mailRegEx = RegExp(
    r'\b[\w\d\W\D]+(?:@(?:[\w\d\W\D]+(?:\.(?:[\w\d\W\D]+))))\b',
  );
  static final RegExp passwordRegEx = RegExp(r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}');
  static final RegExp phoneRegex = RegExp(
    r"^[+]?[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]{7,15}$",
  );
  static final RegExp imageRegex = RegExp(r"\.(gif|jpe?g|tiff?|png|webp|bmp)$");
  static final RegExp bvnRegex = RegExp(r"\d{11}");
  static final RegExp xmlRegex = RegExp(r"<.+?>");
  static final RegExp cardCompany = RegExp(r"(Mastercard|Visa)(\s)?");
}
