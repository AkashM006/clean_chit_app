import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/classes/validators.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/bordered_input_decoration.dart';
import 'package:chit_app_clean/src/utils/widgets/required_input_label.dart';
import 'package:flutter/material.dart';

enum Mode {
  create,
  edit,
}

class ChitDetailForm extends StatefulWidget {
  final ChitModel? chit;
  final void Function(ChitModel chit) onChitDetailSave;

  const ChitDetailForm({
    super.key,
    required this.onChitDetailSave,
    this.chit,
  });

  @override
  State<ChitDetailForm> createState() => _ChitDetailFormState();
}

class _ChitDetailFormState extends State<ChitDetailForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _amount = 0;
  int _people = 0;
  int _frequencyNumber = 0;
  FrequencyType _frequencyType = FrequencyType.monthly;
  double _commissionPercentage = 0.0;
  int _fManAuctionNumber = 0;

  DateTime _startDate = DateTime.now();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    initalizeDateAndTime();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
    _timeController.dispose();
  }

  void initalizeDateAndTime() {
    final isCreateMode = widget.chit == null;
    if (!isCreateMode) {
      _setDate(widget.chit!.startDate);
      _setTime(
        TimeOfDay(
          hour: widget.chit!.startDate.hour,
          minute: widget.chit!.startDate.minute,
        ),
      );
      _frequencyType = widget.chit!.frequencyType;
    } else {
      final now = DateTime.now();
      _setDate(now);
      _setTime(
        TimeOfDay(
          hour: now.hour,
          minute: now.minute,
        ),
      );
    }
  }

  void _setDate(DateTime date) {
    setState(() {
      _startDate = _startDate.copyWith(
        year: date.year,
        month: date.month,
        day: date.day,
      );
      _dateController.text = getFormattedDate(_startDate);
    });
  }

  void _pickDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );

    if (pickedDate == null) return;

    _setDate(pickedDate);
  }

  void _pickTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: _startDate.hour,
        minute: _startDate.minute,
      ),
    );

    if (pickedTime == null) return;

    _setTime(pickedTime);
  }

  void _setTime(TimeOfDay time) {
    setState(() {
      _startDate = _startDate.copyWith(
        hour: time.hour,
        minute: time.minute,
        second: 0,
      );
      _timeController.text = getFormattedTime(_startDate);
    });
  }

  void _resetHandler() {
    _formKey.currentState?.reset();
  }

  void _nextHandler() {
    // todo: Need to implement
    final isFormValid = _formKey.currentState?.validate() ?? false;

    if (!isFormValid) return;

    _formKey.currentState!.save();

    final isCreateMode = widget.chit == null;

    if (isCreateMode) {
      widget.onChitDetailSave(ChitModel(
        name: _name,
        amount: _amount,
        people: _people,
        commissionPercentage: _commissionPercentage,
        frequencyType: _frequencyType,
        frequencyNumber: _frequencyNumber,
        fManAuctionNumber: _fManAuctionNumber,
        startDate: _startDate,
        endDate: DateTime.now(),
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chit = widget.chit ?? ChitModel.placeholder;
    final formMode = widget.chit == null ? Mode.create : Mode.edit;

    final List<Widget> buttonList = [];

    if (formMode == Mode.create) {
      buttonList.add(TextButton(
        onPressed: _resetHandler,
        child: const Text("Reset"),
      ));
      buttonList.add(SizedBox(width: SizeConfig.safeBlockHorizontal * 2));
    }
    buttonList.add(FilledButton(
      onPressed: _nextHandler,
      child: const Text("Next"),
    ));

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 3,
        right: SizeConfig.safeBlockHorizontal * 3,
        top: SizeConfig.safeBlockVertical * 3,
        bottom: MediaQuery.of(context).viewInsets.bottom +
            SizeConfig.safeBlockVertical * 3,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formMode == Mode.edit ? "Edit Chit" : "Add Chit",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 5),
            TextFormField(
              decoration: const BorderedInputDecoration(
                labelWidget: RequiredInputLabel(label: 'Name'),
              ),
              initialValue: chit.name,
              validator: (value) => Validator.validateString(
                value,
                "Name",
                minLength: 3,
              ),
              onSaved: (newValue) => _name = newValue!,
              textCapitalization: TextCapitalization.sentences,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            TextFormField(
              decoration: const BorderedInputDecoration(
                labelWidget: RequiredInputLabel(label: "Amount"),
                iconWidget: Icon(Icons.currency_rupee),
              ),
              keyboardType: TextInputType.number,
              initialValue: currencyFormatter.format(chit.amount),
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
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            TextFormField(
              decoration: const BorderedInputDecoration(
                labelWidget: RequiredInputLabel(label: "People Count"),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [IntegerFormatter()],
              initialValue: chit.people.toString(),
              validator: (value) => Validator.validateInt(
                value,
                "Count",
                canBeZero: false,
                canBeNegative: false,
              ),
              onSaved: (newValue) =>
                  _people = int.parse(undoFormatting(newValue!)),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
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
                    initialValue: chit.frequencyNumber.toString(),
                    onSaved: (newValue) =>
                        _frequencyNumber = int.parse(undoFormatting(newValue!)),
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
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
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            TextFormField(
              decoration: const BorderedInputDecoration(
                labelWidget: RequiredInputLabel(label: "Comission Percentage"),
                iconWidget: Icon(Icons.percent),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: const [DoubleFormatter(max: 99)],
              initialValue: chit.commissionPercentage.toString(),
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
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            TextFormField(
              decoration: const BorderedInputDecoration(
                labelWidget: Text("F.man Auction Number"),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [IntegerFormatter()],
              initialValue: chit.fManAuctionNumber.toString(),
              validator: (value) => Validator.validateInt(
                value,
                "F.man Auction Number",
                required: false,
                canBeNegative: false,
              ),
              onSaved: (newValue) => _fManAuctionNumber =
                  newValue != null ? int.parse(undoFormatting(newValue)) : 0,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const BorderedInputDecoration(
                      labelWidget: RequiredInputLabel(label: "Starting Date"),
                    ),
                    onTap: _pickDate,
                    readOnly: true,
                    controller: _dateController,
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockHorizontal * 2),
                TextButton(
                  onPressed: _pickDate,
                  child: const Text("Select Date"),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const BorderedInputDecoration(
                      labelWidget: RequiredInputLabel(label: "Time"),
                    ),
                    onTap: _pickTime,
                    readOnly: true,
                    controller: _timeController,
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                TextButton(
                  onPressed: _pickTime,
                  child: const Text("Select TIme"),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Row(
              children: buttonList,
            ),
          ],
        ),
      ),
    );
  }
}
