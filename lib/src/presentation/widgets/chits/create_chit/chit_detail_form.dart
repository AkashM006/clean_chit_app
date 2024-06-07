import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/classes/validators.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/bordered_input_decoration.dart';
import 'package:chit_app_clean/src/utils/widgets/required_input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final now = DateTime.now();

class ChitDetailForm extends ConsumerStatefulWidget {
  final void Function(ChitModel newChit) onSubmitHandler;
  const ChitDetailForm({
    super.key,
    required this.onSubmitHandler,
  });

  @override
  ConsumerState<ChitDetailForm> createState() => _ChitDetailFormState();
}

class _ChitDetailFormState extends ConsumerState<ChitDetailForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _amount = 0;
  int _people = 0;
  double _commissionPercentage = 0.0;
  FrequencyType _frequencyType = FrequencyType.monthly;
  int _frequencyNumber = 0;
  int _fManAuctionNumber = 0;

  DateTime _startDate = DateTime.now();

  late TextEditingController _dateController;
  late TextEditingController _timeController;

  @override
  void initState() {
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    final now = DateTime.now();
    _setFormattedDate(now);
    _setFormattedTime(TimeOfDay(hour: now.hour, minute: now.minute));

    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _setFormattedDate(DateTime date) {
    _startDate =
        _startDate.copyWith(day: date.day, month: date.month, year: date.year);
    _dateController.text = getFormattedDate(date);
  }

  void _setFormattedTime(TimeOfDay time) {
    _startDate = _startDate.copyWith(hour: time.hour, minute: time.minute);

    _timeController.text = getFormattedTime(_startDate);
  }

  void _pickDate() async {
    final result = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );

    if (result == null) return;

    _setFormattedDate(result);
  }

  void _pickTime() async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: _startDate.hour, minute: _startDate.minute),
    );

    if (result == null) return;

    _setFormattedTime(result);
  }

  void _nextHandler() {
    final isFormValid = _formKey.currentState!.validate();

    if (!isFormValid) return;

    _formKey.currentState!.save();

    final scheduledDates = getScheduledDates(
      _startDate,
      _frequencyType,
      _frequencyNumber,
      _people,
    );

    final newChit = ChitModel(
      name: _name,
      amount: _amount,
      people: _people,
      commissionPercentage: _commissionPercentage,
      frequencyType: _frequencyType,
      frequencyNumber: _frequencyNumber,
      fManAuctionNumber: _fManAuctionNumber,
      startDate: _startDate,
      endDate: _startDate,
      dates: scheduledDates,
    );

    widget.onSubmitHandler(newChit);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.safeBlockHorizontal * 3,
        SizeConfig.safeBlockVertical * 3,
        SizeConfig.safeBlockHorizontal * 3,
        SizeConfig.safeBlockVertical * 3 +
            MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: 'Name'),
                  ),
                  validator: (value) => Validator.validateString(
                    value,
                    "Name",
                    minLength: 3,
                  ),
                  onSaved: (newValue) => _name = newValue!,
                  textCapitalization: TextCapitalization.sentences,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                TextFormField(
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: "Amount"),
                    iconWidget: Icon(Icons.currency_rupee),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [IntegerFormatter()],
                  validator: (value) => Validator.validateInt(
                    value,
                    "Amount",
                    canBeNegative: false,
                    canBeZero: false,
                  ),
                  onSaved: (newValue) =>
                      _amount = int.parse(undoFormatting(newValue!)),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                TextFormField(
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: "People Count"),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [IntegerFormatter()],
                  validator: (value) => Validator.validateInt(
                    value,
                    "Count",
                    canBeZero: false,
                    canBeNegative: false,
                  ),
                  onSaved: (newValue) =>
                      _people = int.parse(undoFormatting(newValue!)),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: const BorderedInputDecoration(
                          labelWidget: RequiredInputLabel(label: "Frequency"),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [IntegerFormatter()],
                        validator: (value) => Validator.validateInt(
                          value,
                          "Frequency",
                          canBeZero: false,
                          canBeNegative: false,
                        ),
                        onSaved: (newValue) => _frequencyNumber =
                            int.parse(undoFormatting(newValue!)),
                      ),
                    ),
                    SizedBox(width: SizeConfig.safeBlockHorizontal * 5),
                    Expanded(
                      flex: 2,
                      child: DropdownButton<FrequencyType>(
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: FrequencyType.monthly,
                            child: Text("Monthly"),
                          ),
                          DropdownMenuItem(
                            value: FrequencyType.weekly,
                            child: Text("Weekly"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _frequencyType = value!;
                          });
                        },
                        value: _frequencyType,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                TextFormField(
                  decoration: const BorderedInputDecoration(
                    labelWidget:
                        RequiredInputLabel(label: "Comission Percentage"),
                    iconWidget: Icon(Icons.percent),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: const [DoubleFormatter(max: 99)],
                  validator: (value) => Validator.validateDouble(
                    value,
                    "Comission",
                    canBeNegative: false,
                    canBeZero: false,
                    max: 99,
                  ),
                  onSaved: (newValue) => _commissionPercentage =
                      double.parse(undoFormatting(newValue!)),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                TextFormField(
                  decoration: const BorderedInputDecoration(
                    labelWidget: Text("F.man Auction Number"),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [IntegerFormatter()],
                  validator: (value) => Validator.validateInt(
                    value,
                    "F.man Auction Number",
                    required: false,
                    canBeNegative: false,
                  ),
                  onSaved: (newValue) => _fManAuctionNumber =
                      newValue != null && newValue.isNotEmpty
                          ? int.parse(undoFormatting(newValue))
                          : 0,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: BorderedInputDecoration(
                          labelWidget:
                              const RequiredInputLabel(label: "Starting Date"),
                          suffixIconWidget: IconButton(
                            onPressed: _pickDate,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ),
                        onTap: _pickDate,
                        readOnly: true,
                        controller: _dateController,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 2,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: BorderedInputDecoration(
                          labelWidget: const RequiredInputLabel(label: "Time"),
                          suffixIconWidget: IconButton(
                            onPressed: _pickTime,
                            icon: const Icon(Icons.watch_later_outlined),
                          ),
                        ),
                        onTap: _pickTime,
                        readOnly: true,
                        controller: _timeController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton(
                    onPressed: _nextHandler,
                    child: const Text("Next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
