import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required TextEditingController textController,
    String hintText,
    @required TextInputType textInputType,
    this.maxLength,
    this.enable = true,
  })  : _textController = textController,
        _hintText = hintText,
        _textInputType = textInputType,
        super(key: key);

  final TextEditingController _textController;
  final String _hintText;
  final TextInputType _textInputType;
  final int maxLength;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      controller: _textController,
      decoration: InputDecoration(
        hintText: _hintText,
        counterText: "",
        contentPadding: EdgeInsets.all(0.0),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        hintStyle: const TextStyle(color: Color.fromRGBO(161, 161, 161, 1.0)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      cursorColor: Color.fromRGBO(88, 38, 90, 1.0),
      style: const TextStyle(color: Color.fromRGBO(161, 161, 161, 1.0)),
      keyboardType: _textInputType,
      maxLength: maxLength,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter value';
        }
        return null;
      },
    );
  }
}

