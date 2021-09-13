import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/src/fast_theme.dart';

class FastAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final bool excludeHeaderSemantics;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  FastAppBar({
    Key? key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.excludeHeaderSemantics = false,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
  })  : preferredSize = Size.fromHeight(toolbarHeight ??
            kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final isDark = FastTheme.of(context).isDark;
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      shape: isDark
          ? null
          : const Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 245, 245, 245), width: 1)),
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      excludeHeaderSemantics: excludeHeaderSemantics,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
    );
  }
}
