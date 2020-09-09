class Validator {
  static final RegExp _emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  static ValidationState validate(String input, {List<String> rules}) {
    for (var i = 0; i < rules.length; i++) {
      String rule = rules[i];
      if (rule == "required") {
        if (input == null || input.trim() == "") {
          return ValidationState(status: false, error: " is required");
        }
      }
      if (rule == "email") {
        if (input == null || input == "") {
          return ValidationState(status: false, error: " is required");
        }
        if (!_emailRegExp.hasMatch(input)) {
          return ValidationState(status: false, error: " format is invalid");
        }
      }
      if (rule.startsWith("min:")) {
        try {
          int letterCount = int.tryParse(rule.replaceAll("min:", ""));
          if (input.length < letterCount) {
            return ValidationState(
                status: false,
                error: " should be min $letterCount character long");
          }
        } catch (_) {
          return ValidationState(status: false, error: " - $rule is incorrect");
        }
      }
    }
    return ValidationState(status: true);
  }
}

class ValidationState {
  bool status;
  String error;
  ValidationState({this.status = false, this.error});
}
