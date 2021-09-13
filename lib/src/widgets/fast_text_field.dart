import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FastTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final ToolbarOptions toolbarOptions;
  final bool? showCursor;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final String? restorationId;
  final EdgeInsetsGeometry margin;
  final FastInputDecoration decoration;

  const FastTextField(
      {Key? key,
      this.controller,
      this.focusNode,
      TextInputType? keyboardType,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      this.textAlign = TextAlign.start,
      this.textDirection,
      this.readOnly = false,
      ToolbarOptions? toolbarOptions,
      this.showCursor,
      this.autofocus = false,
      this.obscuringCharacter = '•',
      this.obscureText = false,
      this.autocorrect = true,
      SmartDashesType? smartDashesType,
      SmartQuotesType? smartQuotesType,
      this.enableSuggestions = true,
      this.maxLines = 1,
      this.minLines,
      this.expands = false,
      this.maxLength,
      this.maxLengthEnforcement,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.onAppPrivateCommand,
      this.inputFormatters,
      this.enabled,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.dragStartBehavior = DragStartBehavior.start,
      this.enableInteractiveSelection = true,
      this.selectionControls,
      this.onTap,
      this.mouseCursor,
      this.buildCounter,
      this.scrollController,
      this.scrollPhysics,
      this.autofillHints,
      this.restorationId,
      this.margin = const EdgeInsets.symmetric(vertical: 8),
      this.decoration = const FastInputDecoration()})
      : toolbarOptions = toolbarOptions ??
            (obscureText
                ? const ToolbarOptions(
                    selectAll: true,
                    paste: true,
                  )
                : const ToolbarOptions(
                    copy: true,
                    cut: true,
                    selectAll: true,
                    paste: true,
                  )),
        smartDashesType = smartDashesType ??
            (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ??
            (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextField(
        cursorWidth: 1,
        style: const TextStyle(height: 1.5),
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textAlign: textAlign,
        textDirection: textDirection,
        textCapitalization: textCapitalization,
        autofocus: autofocus,
        toolbarOptions: toolbarOptions,
        readOnly: readOnly,
        showCursor: showCursor,
        obscuringCharacter: obscuringCharacter,
        obscureText: obscureText,
        autocorrect: autocorrect,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        enableSuggestions: enableSuggestions,
        maxLengthEnforcement: maxLengthEnforcement,
        maxLines: maxLines,
        minLines: minLines,
        expands: expands,
        maxLength: maxLength,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        inputFormatters: inputFormatters,
        enabled: enabled,
        scrollPadding: scrollPadding,
        scrollPhysics: scrollPhysics,
        enableInteractiveSelection: enableInteractiveSelection,
        selectionControls: selectionControls,
        buildCounter: buildCounter,
        autofillHints: autofillHints,
        scrollController: scrollController,
        decoration: decoration.convert(),
      ),
    );
  }
}

@immutable
class FastInputDecoration {
  final Widget? icon;
  final String? labelText;
  final String? helperText;
  final int? helperMaxLines;
  final String? hintText;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final String? errorText;
  final int? errorMaxLines;
  final bool isCollapsed;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? suffixText;
  final String? counterText;
  final Widget? counter;
  final bool enabled;
  final String? semanticCounterText;
  final bool? alignLabelWithHint;

  const FastInputDecoration({
    this.icon,
    this.labelText,
    this.helperText,
    this.helperMaxLines,
    this.hintText,
    this.hintTextDirection,
    this.hintMaxLines,
    this.errorText,
    this.errorMaxLines,
    this.isCollapsed = false,
    this.prefixIcon,
    this.prefix,
    this.prefixText,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.counter,
    this.counterText,
    this.enabled = true,
    this.semanticCounterText,
    this.alignLabelWithHint,
  });

  InputDecoration convert() {
    return InputDecoration(
      icon: icon,
      labelText: labelText,
      labelStyle: const TextStyle(height: 1),
      helperText: helperText,
      helperStyle: const TextStyle(height: 1),
      helperMaxLines: helperMaxLines,
      hintText: hintText,
      hintTextDirection: hintTextDirection,
      hintMaxLines: hintMaxLines,
      errorText: errorText,
      errorStyle: const TextStyle(height: 1),
      errorMaxLines: errorMaxLines,
      isCollapsed: isCollapsed,
      prefixIcon: prefixIcon,
      prefix: prefix,
      prefixText: prefixText,
      suffixIcon: suffixIcon,
      suffix: suffix,
      suffixText: suffixText,
      counter: counter,
      counterText: counterText,
      enabled: enabled,
      semanticCounterText: semanticCounterText,
      alignLabelWithHint: alignLabelWithHint,
    );
  }
}
