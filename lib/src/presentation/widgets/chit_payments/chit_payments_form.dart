import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/classes/validators.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/bordered_input_decoration.dart';
import 'package:chit_app_clean/src/utils/widgets/required_input_label.dart';
import 'package:flutter/material.dart';

class ChitPaymentsForm extends StatefulWidget {
  final List<ChitNameAndId> chitNamesAndIds;
  final bool isFormEdit;

  const ChitPaymentsForm({
    super.key,
    required this.chitNamesAndIds,
    this.isFormEdit = false,
  });

  @override
  State<ChitPaymentsForm> createState() => _ChitPaymentsFormState();
}

class _ChitPaymentsFormState extends State<ChitPaymentsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  DateTime _date = DateTime.now();
  int _chitId = -1;
  int _paidAmount = 0;
  int _receivedAmount = 0;

  void _setDate(DateTime date) {
    setState(() {
      _date = date;
      _dateController.text = getFormattedDate(date);
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

  void initializer() {
    if (!widget.isFormEdit) {
      _setDate(_date);
    }
  }

  void onFormSubmit() {
    if (!_formKey.currentState!.validate()) return;
    // todo: handle form submission, loading, success and failure
  }

  @override
  void initState() {
    super.initState();
    initializer();
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 3,
        vertical: SizeConfig.safeBlockVertical * 2,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                TextField(
                  decoration: BorderedInputDecoration(
                    labelWidget:
                        const RequiredInputLabel(label: "Starting Date"),
                    helperTextString: getWeekDay(_date),
                    suffixIconWidget: IconButton(
                      onPressed: _pickDate,
                      icon: Icon(
                        Icons.date_range,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  onTap: _pickDate,
                  readOnly: true,
                  controller: _dateController,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                DropdownButtonFormField<int>(
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: "Chit"),
                  ),
                  validator: (value) {
                    if (value == null) return "Please select a chit";
                    return null;
                  },
                  items: widget.chitNamesAndIds
                      .map(
                        (chit) => DropdownMenuItem(
                          value: chit.id,
                          child: Text(chit.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _chitId = value;
                    });
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                TextFormField(
                  initialValue: _paidAmount.toString(),
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: "Paid Amount"),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [IntegerFormatter()],
                  validator: (value) => Validator.validateInt(
                    value,
                    "Paid Amount",
                    required: true,
                    canBeNegative: false,
                  ),
                  onSaved: (newValue) => _paidAmount = newValue != null
                      ? int.parse(undoFormatting(newValue))
                      : 0,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                TextFormField(
                  initialValue: _receivedAmount.toString(),
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: "Received Amount"),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [IntegerFormatter()],
                  validator: (value) => Validator.validateInt(
                    value,
                    "Received Amount",
                    required: true,
                    canBeNegative: false,
                  ),
                  onSaved: (newValue) => _receivedAmount = newValue != null
                      ? int.parse(undoFormatting(newValue))
                      : 0,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton(
                    onPressed: onFormSubmit,
                    child: Text(widget.isFormEdit ? "Edit" : "Submit"),
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
