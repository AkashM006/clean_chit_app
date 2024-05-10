abstract class CustomError {
  final String message;
  const CustomError({required this.message});

  @override
  String toString() => message;
}

class AppError extends CustomError implements Exception {
  const AppError({required super.message});
}

class DataMigrationError extends CustomError implements Exception {
  const DataMigrationError({required fields})
      : super(
          message:
              "We encountered a problem with your data ($fields). To fix this, please try taking a backup of your data and reinstalling the app.",
        );
}
