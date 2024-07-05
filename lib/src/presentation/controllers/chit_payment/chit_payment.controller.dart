import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_payments_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/controller_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chit_payment.controller.g.dart';
part 'chit_payment.controller.freezed.dart';

@freezed
class ChitPaymentControllerState with _$ChitPaymentControllerState {
  const factory ChitPaymentControllerState({
    @Default(ControllerState()) ControllerState createChitPayment,
    @Default(ControllerState()) ControllerState deleteChitPayment,
  }) = $ChitPaymentControllerState;
}

@riverpod
class ChitPaymentController extends _$ChitPaymentController {
  final _chitPaymentRepository = locator<ChitPaymentRepository>();

  @override
  ChitPaymentControllerState build() {
    return const ChitPaymentControllerState();
  }

  void createChitPayment(ChitPaymentWithChitNameAndIdModel chitPayment) async {
    state = state.copyWith(
      createChitPayment: state.createChitPayment.setLoading(),
    );

    final result = await _chitPaymentRepository.createChitPayment(chitPayment);

    state = result.fold(
      (data) => state.copyWith(
        createChitPayment: state.createChitPayment.setSuccess(null),
      ),
      (error) => state.copyWith(
        createChitPayment: state.createChitPayment.setFailure(error.toString()),
      ),
    );
  }

  void deleteChitPayment(int chitPaymentId) async {
    state = state.copyWith(
      deleteChitPayment: state.deleteChitPayment.setLoading(),
    );

    final result =
        await _chitPaymentRepository.deleteChitPayment(chitPaymentId);

    state = result.fold(
      (data) => state.copyWith(
        deleteChitPayment: state.deleteChitPayment.setSuccess(null),
      ),
      (error) => state.copyWith(
        deleteChitPayment: state.deleteChitPayment.setFailure(error.toString()),
      ),
    );
  }
}
