import 'package:chit_app_clean/src/utils/classes/size_config.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:chit_app_clean/src/utils/widgets/bordered_input_decoration.dart';
import 'package:flutter/material.dart';

class DateField extends StatefulWidget {
  final DateTime initialDate;
  final String label;
  final void Function(DateTime newDate) onDateChanged;

  const DateField({
    super.key,
    required this.initialDate,
    required this.label,
    required this.onDateChanged,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController _controller = TextEditingController();

  late DateTime _currentDate;

  @override
  void initState() {
    _controller.text = getFormattedDate(widget.initialDate);
    _currentDate = widget.initialDate;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSelectDate() async {
    final result = await showDatePicker(
      context: context,
      firstDate: DateTime(_currentDate.year - 3),
      lastDate: DateTime(_currentDate.year + 3),
      initialDate: _currentDate,
    );

    if (result == null) return;

    setState(() {
      _currentDate = result;
      _controller.text = getFormattedDate(_currentDate);
    });
    widget.onDateChanged(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
      child: TextField(
        controller: _controller,
        decoration: BorderedInputDecoration(
          labelWidget: Text(widget.label),
          suffixIconWidget: IconButton(
            onPressed: _handleSelectDate,
            icon: const Icon(Icons.date_range),
          ),
          helperTextString: getWeekDay(_currentDate),
        ),
      ),
    );
  }
}
