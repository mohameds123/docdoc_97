import 'package:docdocapp97/core/utils/colors_manager.dart';
import 'package:docdocapp97/core/utils/txt_style.dart';
import 'package:flutter/material.dart';

class AppTxtFeild extends StatefulWidget {
  Widget ?suffixFeildIcon;
  bool? secureTxt;
  String hintTxt;
  TextEditingController textEditingController;
   AppTxtFeild({super.key,required this.hintTxt, required this.textEditingController,this.secureTxt, this.suffixFeildIcon});

  @override
  State<AppTxtFeild> createState() => _AppTxtFeildState();
}

class _AppTxtFeildState extends State<AppTxtFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,

      decoration: InputDecoration(

        hintText: widget.hintTxt,
        hintStyle: TxtStyle.font14wight400Grey,
        fillColor:ColorsManager.txtFeildFillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: ColorsManager.txtFeildBorderColor,
          )
        )
      ),
    );
  }
}
