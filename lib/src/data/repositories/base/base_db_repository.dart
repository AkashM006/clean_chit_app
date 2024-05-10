import 'package:chit_app_clean/src/utils/classes/data_state.dart';
import 'package:chit_app_clean/src/utils/classes/errors.dart';
import 'package:flutter/material.dart';

abstract class BaseDbRepository {
  const BaseDbRepository();
  @protected
  Future<DataState<T>> safeExecute<T>(Future<T> Function() callback) async {
    try {
      final result = await callback();
      return DataSuccess(data: result);
    } catch (e) {
      final error = e as CustomError;
      return DataFailure(error: error);
    }
  }
}
