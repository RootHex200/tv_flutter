
import 'package:flutter/material.dart';
import 'package:live_tv/utils/value/colors/colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  const CustomTextFieldWidget({super.key,this.obscure=false,this.textInputType,this.validator,required this.controller,required this.iconData,required this.labelText,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscure,
      controller: controller,
      keyboardType:textInputType,
      decoration: InputDecoration(
        prefixIcon:  Icon(iconData, color: AppColors.primaryAppBlacColor),
        hintText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: AppColors.primaryWhiteColor,
        filled: true,
        errorStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
        suffixIcon: suffixIcon,
        
        enabledBorder: const OutlineInputBorder(
          
            borderSide: BorderSide(color: AppColors.primaryAppBlacColor, width: 0.0)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryAppBlacColor, width: 0.0)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryAppBlacColor, width: 0.0)),
      ),
    );
  }
}
