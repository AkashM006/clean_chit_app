int? transformToInt(String? value) => value == null ? null : int.parse(value);

bool? transformToBool(String? value) =>
    value == null ? null : bool.parse(value);
