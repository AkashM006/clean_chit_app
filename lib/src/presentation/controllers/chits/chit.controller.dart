import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/controller_state.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chit.controller.g.dart';
part 'chit.controller.freezed.dart';

@freezed
class ChitControllerState with _$ChitControllerState {
  const factory ChitControllerState({
    @Default(ControllerState()) ControllerState createChit,
    @Default(ControllerState()) ControllerState editChit,
  }) = $ChitControllerState;
}

@riverpod
class ChitController extends _$ChitController {
  final _chitRepository = locator<ChitRepository>();

  @override
  ChitControllerState build() {
    return const ChitControllerState();
  }

  void createChit(ChitModel newChit) async {
    state = state.copyWith(
      createChit: state.createChit.setLoading(),
    );

    final result = await _chitRepository.createChit(newChit);

    if (result is DataFailure) {
      state = state.copyWith(
        createChit: state.createChit.setFailure(
          result.error!.toString(),
        ),
      );
      return;
    }

    final chitId = result.data!.id;

    final chitDatesResult = await _setChitDates(newChit.dates, chitId);

    state = chitDatesResult.fold(
      (data) => state.copyWith(
        createChit: state.createChit.setSuccess(
          null,
        ),
      ),
      (error) => state.copyWith(
        createChit: state.createChit.setFailure(
          error.toString(),
        ),
      ),
    );
  }

  Future<DataState<void>> _setChitDates(
      List<DateTime> dates, int chitId) async {
    return await _chitRepository.setDates(dates, chitId);
  }

  void editChit(ChitModel newChit) {}
}
