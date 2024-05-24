import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_payments_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/controller_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chit_payments.controller.g.dart';
part 'chit_payments.controller.freezed.dart';

@freezed
class ChitPaymentsControllerState with _$ChitPaymentsControllerState {
  const factory ChitPaymentsControllerState({
    @Default(ControllerState()) ControllerState createChitPayment,
  }) = $ChitPaymentsControllerState;
}

@riverpod
class ChitPaymentsController extends _$ChitPaymentsController {
  final _chitPaymentsRepository = locator<ChitPaymentsRepository>();

  @override
  ChitPaymentsControllerState build() {
    return const ChitPaymentsControllerState();
  }

  void createChitPayment(ChitPaymentsModel chitPayment) async {
    state = state.copyWith(
      createChitPayment: state.createChitPayment.setLoading(),
    );

    final result =
        await _chitPaymentsRepository.createChitPayments(chitPayment);

    state = result.fold(
      (data) => state.copyWith(
          createChitPayment: state.createChitPayment.setSuccess(null)),
      (error) => state.copyWith(
        createChitPayment: state.createChitPayment.setFailure(error.toString()),
      ),
    );
  }
}
