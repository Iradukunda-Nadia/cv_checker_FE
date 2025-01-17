import 'package:cv_checker/AppUtils/appColors.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class CustomTF extends StatefulWidget {
  final String label;
  final String hint;
  final String? initialText;
  final bool? isDate;
  final bool? isShort;
  final bool? isMultiline;
  final bool? isDropDown;
  final bool? showLabel;
  final TextInputType? type;
  final List<dynamic>? values;
  final TextEditingController controller;
  final bool? isSearch;
  const CustomTF({Key? key,
    required this.label,
    required this.hint,
    this.initialText,
    this.isDate,
    this.isShort,
    this.isMultiline,
    this.isDropDown,
    this.showLabel,
    this.type,
    this.values,
    this.isSearch,
    required this.controller
  }) : super(key: key);

  @override
  State<CustomTF> createState() => _CustomTFState();
}

class _CustomTFState extends State<CustomTF> {

  String _currentSelectedValue = ' ';
  

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
    );
    if(picked != null) {
      var date = CommonService().dateShort(picked.toString());
      setState(() => widget.controller.text = date.toString());
      //returns the selected date and formats it to day- month- year format
    }
  }
  
  @override
  void initState() {
    _currentSelectedValue = widget.values!= null? widget.values![1]:' ';
    if(_currentSelectedValue != null &&
        _currentSelectedValue != ' '){
      widget.controller.text= _currentSelectedValue;
    }
    if(widget.initialText !=null){
      widget.controller.text= widget.initialText!;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isSearch == true?Offstage():Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8, bottom: 8),
          child: Container(
            constraints: const BoxConstraints(
                minWidth: 100
            ),
            height: 20,
            child:  Text(
              widget.label,
              style: GoogleFonts.getFont(
                'Montserrat',
                color: Color(0xD61E1E1E),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
              minWidth: 100,
              maxWidth: widget.isShort == true ? 300:600
          ),
          height: widget.isSearch == true?50:40,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: widget.isSearch == true? BorderSide(
                width: 0,
                color: Colors.white,
              ):BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.25),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: widget.isDropDown == true? FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    baseStyle: GoogleFonts.getFont(
                      'Istok Web',
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.getFont(
                        'Istok Web',
                        fontSize: 18,
                      ),
                      hintText: widget.hint,
                      hintStyle: GoogleFonts.getFont(
                        'Istok Web',
                        fontSize: 18,
                        color: AppColors.greylighten1
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder:
                      InputBorder.none,
                    ),
                    isEmpty: _currentSelectedValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue??'',
                        isDense: false,
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentSelectedValue = newValue?? '';
                            widget.controller.text = newValue?? '';
                            state.didChange(newValue);
                          });
                        },
                        items: widget.values!.where((element) => element != ' ').map((val){
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val, style: GoogleFonts.getFont(
                              'Istok Web',
                              fontSize: 18,
                            ),),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ):
              TextFormField(
                onTap: (){
                  if(widget.isDate== true){
                    _selectDate();
                  }
                },
                controller: widget.controller,
                minLines: widget.isMultiline == true? 4: 1,
                maxLines: widget.type== TextInputType.visiblePassword?1:null,
                keyboardType: widget.type ?? (widget.isMultiline == true?TextInputType
                    .multiline: TextInputType.text),
                obscureText: widget.type== TextInputType.visiblePassword? true:false,
                decoration: InputDecoration(
                  labelStyle: GoogleFonts.getFont(
                    'Istok Web',
                    fontSize: 18,
                  ),
                  hintText: widget.hint,
                  hintStyle: GoogleFonts.getFont(
                      'Istok Web',
                      fontSize: 18,
                      color: AppColors.greylighten1
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder:
                  InputBorder.none,
                ),
                validator: (val) => val.toString().isEmpty
                    ? 'This field is required'
                    : null,
                style: Theme.of(context)
                    .textTheme.bodyMedium!
                    .apply(
                  fontFamily: 'Istok Web',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
