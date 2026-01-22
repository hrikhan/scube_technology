import 'package:flutter/material.dart';

import '../style/global_text_style.dart';
import '../utils/colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget> actions;

  const CommonAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryText,
          size: 20,
        ),
        onPressed: onBack ?? () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        title,
        style: GlobalTextStyle.inter(
          color: AppColors.primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
