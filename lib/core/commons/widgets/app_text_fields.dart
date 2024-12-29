import 'package:coin_app/core/utils/color_res.dart';
import 'package:flutter/material.dart';

import 'app_container.dart';

class AppTextField extends StatefulWidget {
  final Color? containerColor;
  final TextEditingController? controller;
  final InputBorder? inputBorder, focusedBorder;
  final String hintText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool readOnly;
  final void Function()? onSuffixIconPressed;
  final Color defaultCursorColor;
  final Color focusedCursorColor;

  const AppTextField({
    super.key,
    this.containerColor,
    this.controller,
    this.hintText = '',
    this.onChanged,
    this.inputBorder,
    this.focusedBorder,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.readOnly = false,
    this.onSuffixIconPressed,
    this.defaultCursorColor = ColorRes.appGrey,
    this.focusedCursorColor = ColorRes.appBlue,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  late Color _cursorColor;
  bool _showSuffixIcon = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _cursorColor = widget.defaultCursorColor;

    _focusNode.addListener(() {
      setState(() {
        _cursorColor = _focusNode.hasFocus
            ? widget.focusedCursorColor
            : widget.defaultCursorColor;
        _showSuffixIcon = _focusNode.hasFocus
            ? _showSuffixIcon = true
            : _showSuffixIcon = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      containerColor:
          widget.containerColor ?? ColorRes.appTransparent,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        style: TextStyle(
          color: ColorRes.appWhite,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        obscureText: widget.obscureText,
        validator: widget.validator,
        cursorColor: _cursorColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: ColorRes.appGrey.withOpacity(.5),
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          border: widget.inputBorder ?? InputBorder.none,
          focusedBorder: widget.focusedBorder ?? InputBorder.none,
          isDense: true,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: ColorRes.appGrey)
              : null,
          suffixIcon: _showSuffixIcon && widget.suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    widget.suffixIcon,
                    color: widget.obscureText
                        ? ColorRes.appGrey.withOpacity(.5)
                        : ColorRes.appBlue,
                  ),
                  onPressed: widget.onSuffixIconPressed,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        readOnly: widget.readOnly,
      ),
    );
  }
}
