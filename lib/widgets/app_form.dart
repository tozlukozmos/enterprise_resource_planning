import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../design/app_text.dart';

class AppForm {
  static Widget appTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required BuildContext context,
    bool isPassword = false,
    bool isEmail = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.label),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }

  static Widget appTextFormFieldIcon({
    required String label,
    required String hint,
    required Icon icon,
    required TextEditingController controller,
    required BuildContext context,
    bool isPassword = false,
    bool isEmail = false,
    bool isPrefixIcon = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.label),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: isPrefixIcon ? icon : null,
            suffixIcon: !isPrefixIcon ? icon : null,
            hintText: hint,
          ),
        ),
      ],
    );
  }

  static Widget appSearchableDropDownField({
    required List<String> items,
    required String label,
    required Function(String?) onChanged,
    required selectedItem,
    required BuildContext context,
  }) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        menuProps:
            const MenuProps(backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
        showSelectedItems: true,
        showSearchBox: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: items,
      onChanged: onChanged,
      selectedItem: selectedItem,
    );
  }
}
