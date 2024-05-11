String? requiredValidator(String? value, String fieldName) {
  if (value == null) return '$fieldName is required';

  return null;
}

String? minLengthValidator(String? value, String fieldName, int min) {
  final requiredCheck = requiredValidator(value, fieldName);
  if (requiredCheck != null) return requiredCheck;

  if (value!.length < min) {
    return '$fieldName must be atlease $min characters long';
  }

  return null;
}
