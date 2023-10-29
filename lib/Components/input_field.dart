import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final String err;
  final double boxWidth;
  final TextEditingController controller;
  final bool ispasswordField;

  const InputField({
    Key? key,
    required this.label,
    required this.controller,
    this.boxWidth = 200,
    this.err = '',
    this.ispasswordField = false,
  }) : super(key: key);

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.ispasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.boxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: widget.ispasswordField
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null,
            ),
          ),
          Text(
            widget.err,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
