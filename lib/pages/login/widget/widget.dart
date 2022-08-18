import 'package:flutter/material.dart';


class CustomTextFormFailed extends StatelessWidget {
  static const double _radius = 100;

  const CustomTextFormFailed({
    Key? key,
    String? initialValue,
    String? hint,
    String? labelText,
    String? helperText,
    TextInputType? keyboardType,
    TextAlignVertical? alignVertical,
    TextStyle? style,
    bool isObscureText = false,
    bool readOnly = false,
    bool hasBorder = true,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? label,
    TextEditingController? controller,
    EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
    Color? cursorColor,
    double borderWidth = 2,
    int? maxLines,
    int? minLines,
    bool  enabled = false ,
    Color enabledBorderColor = Colors.grey,
    double enabledBorderRadius = _radius,
    FocusNode? focusNode,
    String? Function(String?)? onValidator,
    void Function(String?)? onSaved,
    void Function(String)? onChanged,
    void Function()? onTap,
    this.action = TextInputAction.done,
    this.fillColor = Colors.white,
    this.inputBorder,
    this.isCollapsed = true,
    this.isDense = true,
    this.paddingH=0,
    this.fullName,

    required this.enable
  })  : _initialValue = initialValue,
        _cursorColor = cursorColor,
        _keyboardType = keyboardType,
        _alignVertical = alignVertical,
        _isObscureText = isObscureText,
        _readOnly = readOnly,
        _hasBorder = hasBorder,
        _textStyle = style,
        _hint = hint,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _label = label,
        _labelText = labelText,
        _helperText = helperText,
        _contentPadding = contentPadding,
        _enabledBorderColor = enabledBorderColor,
        _enabledBorderRadius = enabledBorderRadius,
        _onValidator = onValidator,
        _onSaved = onSaved,
        _onChanged = onChanged,
        _onTap = onTap,
        _borderSize = borderWidth,
        _controller = controller,
        _focusNode = focusNode,
        _maxLines = maxLines,
        _minLines = minLines,

        super(key: key);

  final String? _initialValue;
  final Color? _cursorColor;
  final TextInputType? _keyboardType;
  final TextStyle? _textStyle;
  final bool _isObscureText;
  final bool _readOnly;
  final bool _hasBorder;
  final TextAlignVertical? _alignVertical;
  final TextEditingController? _controller;
  final String? Function(String?)? _onValidator;
  final void Function(String?)? _onSaved;
  final void Function(String)? _onChanged;
  final void Function()? _onTap;

// * InputDecoration
  final String? _hint;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final Widget? _label;
  final String? _labelText;
  final String? _helperText;
  final EdgeInsetsGeometry _contentPadding;
  final Color _enabledBorderColor;
  final double _enabledBorderRadius;
  final double _borderSize;
  final FocusNode? _focusNode;
  final int? _maxLines;
  final int? _minLines;
  final TextInputAction action;
  final InputBorder? inputBorder;
  final bool isDense;
  final bool isCollapsed;
  final Color fillColor;
  final double paddingH;
  final bool enable;
  final bool ?fullName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: action,
      focusNode: _focusNode,
      initialValue: _initialValue,
      textAlignVertical: _alignVertical,
      cursorColor: _cursorColor,
      keyboardType: _keyboardType,
      obscureText: _isObscureText,
      readOnly: _readOnly,
      validator: _onValidator,
      onChanged: _onChanged,
      onTap: _onTap,

      controller: _controller,
      onFieldSubmitted: _onSaved,

      decoration: decoration(context),
      style: _textStyle ?? const TextStyle(),
      maxLines: _maxLines,
      minLines: _minLines,


    );
  }

  InputDecoration decoration(BuildContext context) {
    final border = _hasBorder
        ? inputBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(_enabledBorderRadius),
          borderSide:
          BorderSide(color: _enabledBorderColor, width: _borderSize),
        )
        : !_hasBorder
        ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.transparent),
    )
        : null;
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,



      ),

      fillColor: fillColor,
      filled: true,
      enabled: enable,
      border: border,


      hintText: _hint,
      label: _label,
      labelStyle: const TextStyle()
          ,
      hintStyle: const TextStyle()
      ,
      labelText: _labelText,
      helperText: _helperText,
      prefixIcon: _prefixIcon != null
          ? Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingH),
        child: _prefixIcon,

      )
          : null,
      suffixIcon: _suffixIcon != null
          ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: _suffixIcon,
      )
          : null,
      isDense: isDense,
      isCollapsed: isCollapsed,
      enabledBorder: border,
      focusedBorder: border,
      focusedErrorBorder: border,


      prefixIconConstraints: const BoxConstraints(minHeight: 0),
      suffixIconConstraints: const BoxConstraints(minHeight: 0),
      errorBorder:
      border?.copyWith(borderSide: const BorderSide(color: Colors.redAccent)),
      errorStyle:
      const TextStyle(),
    );
  }

// const NewtonTextFormFailed(
//     {Key? key,
//     required this.icon,
//     required this.hintText,
//     required this.textInputType,
//     this.suffixIcon})
//     : super(key: key);
// final IconData icon;
// final String hintText;
// final TextInputType textInputType;
// final Widget ?suffixIcon;
// @override
// Widget build(BuildContext context) {
//   return TextFormField(
//     keyboardType: textInputType,
//     autofocus: false,
//     decoration: InputDecoration(
//       prefixIconConstraints: const BoxConstraints(
//           maxHeight: 25, maxWidth: 35, minHeight: 10, minWidth: 20),
//       suffixIcon: suffixIcon,
//       prefixIcon: SizedBox(
//           width: 50.w,
//           height: 30.h,
//           child: Icon(
//             icon,
//             size: 20.w,
//           )),
//       hintText: hintText.tr(),
//       contentPadding: EdgeInsets.fromLTRB(20.0.r, 0.0.r, 30.0.r, 0.0.r),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(32.0),
//       ),
//     ),
//   );
// }
}
