import 'package:devicial_mobile/materials/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePick extends StatefulWidget {
  DatePick({super.key, this.padding, required this.dateController});
  final padding;
  TextEditingController dateController;

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.padding),
      child: SizedBox(
        height: 48,
        child: TextField(
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            fillColor: ThemeColor.textBox,
            hintText: 'date',
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            prefixIcon: Icon(Icons.calendar_today),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide.none),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(
                  color: Colors.transparent), // Set the color to transparent
            ),
          ),
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
          controller: widget.dateController,
        ),
      ),
    );
  }

  Future<void> _selectDate(context) async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      final formattedDate =
          DateFormat("yyyy-MM-dd'T'00:00:00.000'Z'").format(_picked);
      setState(() {
        widget.dateController.text = formattedDate;
      });
    }
  }
}
