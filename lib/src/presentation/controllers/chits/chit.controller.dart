import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/controller_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chit.controller.g.dart';
part 'chit.controller.freezed.dart';

@freezed
class ChitControllerState with _$ChitControllerState {
  const factory ChitControllerState({
    @Default(ControllerState()) ControllerState createChit,
    @Default(ControllerState()) ControllerState editChit,
    @Default(ControllerState()) ControllerState deleteChit,
  }) = $ChitControllerState;
}

@riverpod
class ChitController extends _$ChitController {
  final _chitRepository = locator<ChitRepository>();

  @override
  ChitControllerState build() {
    return const ChitControllerState();
  }

  void createChit(ChitWithDates newChit) async {
    state = state.copyWith(
      createChit: state.createChit.setLoading(),
    );
    final result = await _chitRepository.createChit(newChit);

    state = result.fold(
      (data) => state.copyWith(
        createChit: state.createChit.setSuccess(null),
      ),
      (error) => state.copyWith(
        createChit: state.createChit.setFailure(
          error.toString(),
        ),
      ),
    );
  }

  void editChit(ChitWithDates newChit) async {
    state = state.copyWith(
      editChit: state.editChit.setLoading(),
    );

    final result = await _chitRepository.editChit(newChit);

    state = result.fold(
      (data) => state.copyWith(
        editChit: state.editChit.setSuccess(null),
      ),
      (error) => state.copyWith(
        editChit: state.editChit.setFailure(
          error.toString(),
        ),
      ),
    );
  }

  void deleteChit(int chitId) async {
    state = state.copyWith(deleteChit: state.deleteChit.setLoading());

    final result = await _chitRepository.deleteChit(chitId);

    state = result.fold(
      (data) => state.copyWith(
        deleteChit: state.deleteChit.setSuccess(null),
      ),
      (error) => state.copyWith(
        deleteChit: state.deleteChit.setFailure(
          error.toString(),
        ),
      ),
    );
  }

  void reset() {
    state = const ChitControllerState();
  }
}
