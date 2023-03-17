import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {super.key}) {
    if (kDebugMode) {
      print('Constructor TransactionForm');
    }
  }

  @override
  // ignore: no_logic_in_create_state
  State<TransactionForm> createState() {
    if (kDebugMode) {
      print('create TransactionForm');
    }
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _TransactionFormState() {
    if (kDebugMode) {
      print('Constructor _TransactionFormState');
    }
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('initState _TransactionFormState');
    }
  }

  //@override
  //void didUpdateWidget(Widget oldWidget) {
  //  super.didUpdateWidget(oldWidget);
  //  print('didUpdateWidget _TransactionFormState');
  //}
  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print('dispose _TransactionFormState');
    }
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                label: 'Título',
                controller: _titleController,
                onSubmitted: (_) => _submitForm,
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm,
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    'Nova Transação',
                    _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
