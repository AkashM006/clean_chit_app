class Validator {
  static String? _required(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateString(
    String? value,
    String fieldName, {
    bool required = true,
    int minLength = 0,
    int? maxLength,
  }) {
    final isRequiredCase = _required(value, fieldName);
    if (required && isRequiredCase != null) {
      return isRequiredCase;
    } else if (!required && isRequiredCase != null) {
      return null;
    }

    if (value!.length < minLength) {
      return "$fieldName must be atleast $minLength characters long";
    }

    if (maxLength != null && value.length > maxLength) {
      return "$fieldName cannot be longer then $maxLength characters";
    }

    return null;
  }

  static String? validateDouble(
    String? value,
    String fieldName, {
    bool required = true,
    bool canBeNegative = true,
    bool canBeZero = true,
    double? max,
    double? min,
  }) {
    final isRequiredCase = _required(value, fieldName);
    if (required && isRequiredCase != null) {
      return isRequiredCase;
    } else if (!required && isRequiredCase != null) {
      return null;
    }

    final result = value!.replaceAll(',', '');

    final parsedDouble = double.tryParse(result);

    if (parsedDouble == null) {
      return "Please enter valid ${fieldName.toLowerCase()}";
    }

    if (!canBeNegative && parsedDouble < 0) {
      return "$fieldName cannot be negative";
    }

    if (!canBeZero && parsedDouble == 0) return "$fieldName cannot be zero";

    if (min != null && parsedDouble < min) {
      return "$fieldName cannot be less than $min";
    }

    if (max != null && parsedDouble > max) {
      return "$fieldName cannot be more than $max";
    }

    return null;
  }

  static String? validateInt(
    String? value,
    String fieldName, {
    bool required = true,
    bool canBeNegative = true,
    bool canBeZero = true,
    int? max,
    int? min,
  }) {
    final isRequiredCase = _required(value, fieldName);
    if (required && isRequiredCase != null) {
      return isRequiredCase;
    } else if (!required && isRequiredCase != null) {
      return null;
    }

    final result = value!.replaceAll(',', '');

    final parsedInt = int.tryParse(result);

    if (parsedInt == null) {
      return "Please enter valid ${fieldName.toLowerCase()}";
    }

    if (!canBeNegative && parsedInt < 0) return "$fieldName cannot be negative";

    if (!canBeZero && parsedInt == 0) return "$fieldName cannot be zero";

    if (min != null && parsedInt < min) {
      return "$fieldName cannot be less then $min";
    }

    if (max != null && parsedInt > max) {
      return "$fieldName cannot be more than $max";
    }

    return null;
  }
}
