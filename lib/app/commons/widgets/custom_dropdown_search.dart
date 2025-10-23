import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemAsString;
  final void Function(T?) onChanged;
  final String hintText;
  final bool showSearchBox;
  final String searchHint;
  final EdgeInsetsGeometry padding;

  const CustomDropdownSearch({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.itemAsString,
    required this.onChanged,
    this.hintText = "Choose",
    this.showSearchBox = true,
    this.searchHint = "Search...",
    this.padding = const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          DropdownSearch<T>(
            items: items,
            selectedItem: selectedItem,
            itemAsString: (item) => itemAsString(item),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE9F1FF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
                ),
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: showSearchBox,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: searchHint,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF2563EB)),
                ),
              ),
              menuProps: const MenuProps(backgroundColor: Colors.white),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
