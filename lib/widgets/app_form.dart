import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../design/app_colors.dart';
import '../design/app_text.dart';

class AppForm {
  static Widget appTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required BuildContext context,
    bool isPassword = false,
    bool isEmail = false,
    bool isEnabled = true,
    bool isExpands = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.labelSemiBold),
        const SizedBox(height: 4),
        TextFormField(
          expands: isExpands,
          maxLines: maxLines,
          enabled: isEnabled,
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

  static Widget appAutoCompleteTextFormField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required GlobalKey<AutoCompleteTextFieldState<String>> key,
    required List<String> suggestions,
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.labelSemiBold),
        const SizedBox(height: 4),
        SimpleAutoCompleteTextField(
          key: key,
          controller: controller,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.lightPrimary,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.lightPrimary,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.lightInfo,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.lightError,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.lightError,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.lightError,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.lightPrimary.withOpacity(0.4),
            ),
            iconColor: AppColors.lightPrimary,
            hintText: hint,
          ),
          suggestions: suggestions,
          textSubmitted: (String value) {},
          clearOnSubmit: false,
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
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.labelSemiBold),
        const SizedBox(height: 4),
        TextFormField(
          enabled: isEnabled,
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
    bool isEnabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.labelSemiBold,),
        DropdownSearch<String>(
          enabled: isEnabled,
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
        )
      ],
    );
  }
}
