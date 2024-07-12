import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payment.model.dart';
import 'package:chit_app_clean/src/presentation/controllers/chit_payment/chit_payment.controller.dart';
import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/classes/validators.dart';
import 'package:chit_app_clean/src/utils/functions/action_handler.dart';
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

  final DateTime? paymentDate;
  final PaymentType? paymentType;
  final int? chitId;
  final int? paidAmount;
  final int? receivedAmount;
  final ChitPaymentWithChitNameAndIdModel? chitPaymentWithChitNameAndIdModel;

  const ChitPaymentsForm({
    super.key,
    required this.chitNamesAndIds,
    this.isFormEdit = false,
    this.paymentDate,
    this.paymentType,
    this.chitId,
    this.paidAmount,
    this.receivedAmount,
    this.chitPaymentWithChitNameAndIdModel,
  });

  @override
  ConsumerState<ChitPaymentsForm> createState() => _ChitPaymentsFormState();
}

class _ChitPaymentsFormState extends ConsumerState<ChitPaymentsForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  late DateTime _paymentDate;
  late ChitNameAndId? _selectedChit;
  late int _paidAmount;
  late int _receivedAmount;
  late PaymentType _paymentType;

  void _setDate(DateTime date) {
    _paymentDate = date;
    _dateController.text = getFormattedDate(date);
  }

  void _pickDate() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );

    if (pickedDate == null) return;

    setState(() {
      _setDate(pickedDate);
    });
  }

  void initializer() {
    if (widget.isFormEdit) {
      final oldChitPaymentData =
          widget.chitPaymentWithChitNameAndIdModel!.chitPayment;
      final oldChitData = widget.chitPaymentWithChitNameAndIdModel!.chit;

      _setDate(oldChitPaymentData.paymentDate);
      _selectedChit = widget.chitNamesAndIds
          .firstWhere((chit) => chit.id == oldChitData.id);
      _paidAmount = oldChitPaymentData.paidAmount;
      _receivedAmount = oldChitPaymentData.receivedAmount;
      _paymentType = oldChitPaymentData.paymentType;
      return;
    }

    _setDate(widget.paymentDate ?? DateTime.now());
    _selectedChit = widget.chitId != null
        ? widget.chitNamesAndIds.firstWhere((chit) => chit.id == widget.chitId)
        : null;
    _paidAmount = widget.paidAmount ?? 0;
    _receivedAmount = widget.receivedAmount ?? 0;
    _paymentType = widget.paymentType ?? PaymentType.payment;
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

  void onFormSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    if (_paidAmount == 0 && _receivedAmount == 0) {
      showErrorDialog();
      return;
    }

    final newChitPayment = ChitPaymentWithChitNameAndIdModel(
      chitPayment: ChitPaymentModel(
        id: widget.isFormEdit
            ? widget.chitPaymentWithChitNameAndIdModel!.chitPayment.id
            : -1,
        paymentDate: _paymentDate,
        paidAmount: _paidAmount,
        receivedAmount: _receivedAmount,
        paymentType: _paymentType,
        createdAt: widget.isFormEdit
            ? widget.chitPaymentWithChitNameAndIdModel!.chitPayment.createdAt
            : DateTime.now(),
      ),
      chit: _selectedChit!.copyWith(),
    );

    if (widget.isFormEdit) {
      if (newChitPayment.equals(widget.chitPaymentWithChitNameAndIdModel)) {
        context.pop();
        return;
      }

      await ref
          .read(chitPaymentControllerProvider.notifier)
          .editChitPayment(newChitPayment);
    } else {
      await ref
          .read(chitPaymentControllerProvider.notifier)
          .createChitPayment(newChitPayment);
    }

    if (mounted) {
      final controller = ref.read(chitPaymentControllerProvider);
      final controllerState = widget.isFormEdit
          ? controller.editChitPayment
          : controller.createChitPayment;
      actionHandler(
        controllerState,
        context,
        successCallback: () {
          context.pop();
        },
      );
    }
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
    final isLoading =
        ref.watch(chitPaymentControllerProvider).createChitPayment.isLoading ||
            ref.watch(chitPaymentControllerProvider).editChitPayment.isLoading;

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
                        const RequiredInputLabel(label: "Payment Date"),
                    helperTextString: getWeekDay(_paymentDate),
                    suffixIconWidget: IconButton(
                      onPressed: isLoading ? null : _pickDate,
                      icon: Icon(
                        Icons.date_range,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  onTap: isLoading ? null : _pickDate,
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
                  onChanged: isLoading
                      ? null
                      : (value) {
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
                  onChanged: isLoading
                      ? null
                      : (value) {
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
                  initialValue: getFormattedCurrency(_paidAmount),
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
                  initialValue: getFormattedCurrency(_receivedAmount),
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
                    onPressed: isLoading ? null : onFormSubmit,
                    child: isLoading
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
