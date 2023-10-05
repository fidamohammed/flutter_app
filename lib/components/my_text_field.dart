// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget{
  const MyTextField({
    super.key,this.hintText = "Input",
    this.obscure = false,
    this.showToggleIcon = false,
    this.myController,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.onSubmitted

  });

  final String hintText;
  final bool obscure;
  final bool showToggleIcon;
  final TextEditingController? myController;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final Function()? onSubmitted;


  @override
  State<MyTextField> createState() => _MyTextField();

}


class _MyTextField extends State<MyTextField>{

  bool showToggleIconVisible = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Input Required';
        }
        return null;
      },
      textInputAction: widget.textInputAction,
      controller: widget.myController,
      decoration: InputDecoration(
        // errorText: widget.inputMissing ? 'Input Required' : null,
        suffixIcon: suffixIcon(),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(20)
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(20)
          ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)
        ),
        focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green),
      borderRadius: BorderRadius.circular(20)),
        fillColor: Colors.black12,
        filled: true,

      ),
      obscureText: widget.obscure && showToggleIconVisible,

    );
  }

  GestureDetector? suffixIcon(){
    if(widget.showToggleIcon){
      return GestureDetector(child: Icon(showToggleIconVisible ? Icons.visibility_off : Icons.visibility),
        onTap: () => {
        setState((){
          showToggleIconVisible = !showToggleIconVisible;
        })


        },
      );
    }else{
      return null;
    }

  }

}