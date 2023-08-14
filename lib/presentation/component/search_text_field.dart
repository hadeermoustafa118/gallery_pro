import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.controller,
    this.isMulti = false,
    this.autofocus = false,
    required this.onTap,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool isMulti;
  final bool autofocus;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        width: size.width - 50,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          autofocus: autofocus,
          keyboardType: TextInputType.text,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          cursorColor: Colors.black,
          onFieldSubmitted: onTap,
          controller: controller,
          cursorHeight: size.height * 0.03,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: const Icon(Icons.search),
            hintText: 'enter topic here to search for ',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  size.width * 0.04,
                ),
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  size.width * 0.04,
                ),
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: size.height * .023,
              horizontal: size.width * 0.035,
            ),
          ),
        ),
      ),
    );
  }
}
