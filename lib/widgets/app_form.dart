import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

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
        Text(label, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: isPassword,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFF273469),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFF273469),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFF273469),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Colors.red,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor.withOpacity(.6),
            ),
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
        Text(label, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          obscureText: isPassword,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFF273469),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFF273469),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xFF273469),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Colors.red,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            prefixIcon: isPrefixIcon ? icon : null,
            suffixIcon: !isPrefixIcon ? icon : null,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor.withOpacity(.6),
            ),
          ),
        ),
      ],
    );
  }

  static Widget appSearchableDropDownField({
    required List<String> items,
    required String label,
    required Function(dynamic) onChanged,
    required selectedItem,
  }) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        menuProps: MenuProps(backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
        showSelectedItems: false,
        showSearchBox: true,
        disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          prefixText: "Ara...",
          suffixIcon: Icon(Icons.search),
          prefixStyle: const TextStyle(
            fontFamily: "MondaB",
            fontSize: 18,
            color: Colors.black26,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: "MondaB",
            fontSize: 18,
            color: Colors.transparent,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(242, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(39, 52, 105, 1),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(39, 52, 105, 1),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorStyle: const TextStyle(
            fontSize: 13,
            color: Colors.red,
          ),
          contentPadding: const EdgeInsets.only(left: 15),
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      onChanged: onChanged,
      selectedItem: selectedItem,
    );
  }
}
