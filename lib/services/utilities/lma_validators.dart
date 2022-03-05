import 'package:baker_app/data/constants/regex.dart';
import 'package:baker_app/services/utilities/lma_helper_functions.dart';
import 'package:baker_app/services/utilities/lma_text_formatter.dart';

class BakerValidators {
  static String? passwordValidator(String? password) {
    if (password == null || password.trim().isEmpty)
      return 'Password is required';

    if (!BakerRegex.passwordRegEx.hasMatch(password))
      return 'Invalid password';

    return null;
  }

  static String? matchValidator(
      String? base, String? comparison, String? message) {
    if ((base == null || base.trim().isEmpty) ||
        (comparison == null || comparison.trim().isEmpty))
      return 'This field is required';

    if (base != comparison) return message ?? "Fields do not match";

    return null;
  }

  static String? emailValidator(String? email, {bool isRequired = true}) {
    final isEmpty = (email == null || email.isEmpty);
    if (!isRequired && isEmpty) return null;
    if (isEmpty) return "Email field cannot be empty";

    bool _validateEmail(String value) {
      return (!BakerRegex.mailRegEx.hasMatch(value)) ? false : true;
    }

    if (!_validateEmail(email)) return "Invalid email";

    return null;
  }

  static String? phoneValidator(
    String? value, {
    String countryCode = "",
    bool isRequired = true,
  }) {
    final isEmpty = (value == null || value.isEmpty);
    if (!isRequired && isEmpty) return null;
    if (value == null || value.length == 0) {
      return 'Phone number field is required';
    }
    if (!BakerRegex.phoneRegex.hasMatch("$countryCode$value")) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? regCodeValidator(String? text) {
    if (text == null || text.trim().isEmpty)
      return "Registration code is required";

    if (text.length != 6) return "Registration codes should be 6 characters";

    return null;
  }

  static String? bvnValidator(String? text) {
    if (text == null) return "BVN/NIN is required";

    if (int.tryParse(text) == null) return "BVN/NIN must be digits";

    if (text.length != 11) return "BVN/NIN must be 11 digits";

    return null;
  }

  static String? pinValidator(String? text) {
    if (text == null) return "PIN is required";

    if (int.tryParse(text) == null) return "PIN must be digits";

    if (text.length != 4) return "PIN must be 4 digits";

    return null;
  }

  static String? dobValidator(String? date, {int minAge = 18}) {
    if (date == null) return "Date of birth is required";

    final parsedDate = DateTime.tryParse(date);

    if (parsedDate == null) return "Invalid date";

    final now = DateTime.now();

    final yearsSinceDate = (parsedDate.difference(now).inDays / 365);

    if (yearsSinceDate < minAge) {
      return "You need to be at lease $minAge years old";
    }

    return null;
  }

  static String? required(String? text) {
    if (text == null || text.trim().isEmpty) return "This field is required";

    return null;
  }

  static String? nameValidator(String? name) {
    if (name?.isEmpty ?? true) return "This field is required";

    if ((name?.length ?? 0) < 1)
      return "Name cannot be less than two characters";

    return null;
  }

  static String? amountValidator(
    String? value, {
    num? minAmount,
    num? maxAmount,
  }) {
    if (value?.isEmpty ?? true) {
      return 'Amount is required';
    }
    final num? amount = BakerHelpers.extractAmount(value);
    if (amount == null) {
      return 'Invald amount';
    }
    if (minAmount != null && amount < minAmount) {
      final min = BakerTextFormatter.formatCurrency(minAmount);
      return 'The minumum amount you may enter is $min';
    }
    if (maxAmount != null && amount > maxAmount) {
      final max = BakerTextFormatter.formatCurrency(maxAmount);
      return 'The maximum amount you may enter is $max';
    }
    return null;
  }

  static String? digitValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'This field cannot be left empty';
    }
    final num? amount = BakerHelpers.extractAmount(value);
    if (amount == null) {
      return 'Invalid number';
    }
    return null;
  }
}
