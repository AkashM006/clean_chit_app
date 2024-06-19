import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/chit_payments/chit_payments.controller.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/classes/validators.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/bordered_input_decoration.dart';
import 'package:chit_app_clean/src/utils/widgets/required_input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChitPaymentsForm extends ConsumerStatefulWidget {
  final List<ChitNameAndId> chitNamesAndIds;
  final bool isFormEdit;

  const ChitPaymentsForm({
    super.key,
    required this.chitNamesAndIds,
    this.isFormEdit = false,
  });

  @override
  ConsumerState<ChitPaymentsForm> createState() => _ChitPaymentsFormState();
}

class _ChitPaymentsFormState extends ConsumerState<ChitPaymentsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  DateTime _paymentDate = DateTime.now();
  ChitNameAndId? _selectedChit;
  int _paidAmount = 0;
  int _receivedAmount = 0;
  PaymentType _paymentType = PaymentType.payment;

  bool isLoading = false;

  void _setDate(DateTime date) {
    setState(() {
      _paymentDate = date;
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
      _setDate(_paymentDate);
    }
  }

  void showErrorDialog() {
    // Both paid amount and received amount cannot be 0, Handling that case here:
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Incorrect Details!"),
        content: const Text(
          "Both Paid amount and received amount cannot be 0. Any one of them should not be zero. Please try again!",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  void onFormSubmit() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    if (_paidAmount == 0 && _receivedAmount == 0) {
      showErrorDialog();
      return;
    }
    final chitPayment = ChitPaymentWithChitNameAndIdModel(
      chitPayment: ChitPaymentModel(
        paymentDate: _paymentDate,
        paidAmount: _paidAmount,
        receivedAmount: _receivedAmount,
        paymentType: _paymentType,
      ),
      chit: _selectedChit!.copyWith(),
    );

    ref
        .read(chitPaymentsControllerProvider.notifier)
        .createChitPayment(chitPayment);
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
    final isCreateChitLoading =
        ref.watch(chitPaymentsControllerProvider).createChitPayment.isLoading;

    ref.listen(
      chitPaymentsControllerProvider,
      (previous, next) {
        String message = "";
        if (next.createChitPayment.isFailure) {
          message =
              "Something went wrong when trying to create a new payment. Please try again later";
        } else if (next.createChitPayment.isSuccess) {
          message = "Successfully created your payment";
          context.pop();
        }

        if (message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        }
      },
    );

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
                    helperTextString: getWeekDay(_paymentDate),
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
                DropdownButtonFormField<PaymentType>(
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: "Payment Type"),
                  ),
                  value: _paymentType,
                  items: const [
                    DropdownMenuItem(
                      value: PaymentType.receipt,
                      child: Text("Receipt"),
                    ),
                    DropdownMenuItem(
                      value: PaymentType.payment,
                      child: Text("Payment"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == null) return;
                    _paymentType = value;
                  },
                  validator: (value) {
                    if (value == null) return "Please select payment type";
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                DropdownButtonFormField<ChitNameAndId>(
                  decoration: const BorderedInputDecoration(
                    labelWidget: RequiredInputLabel(label: "Chit"),
                  ),
                  value: _selectedChit,
                  validator: (value) {
                    if (value == null) return "Please select a chit";
                    return null;
                  },
                  items: widget.chitNamesAndIds
                      .map(
                        (chit) => DropdownMenuItem(
                          value: chit,
                          child: Text(chit.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedChit = value;
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
                    onPressed: isCreateChitLoading ? null : onFormSubmit,
                    child: isCreateChitLoading
                        ? _buildLoader()
                        : Text(widget.isFormEdit ? "Edit" : "Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}
