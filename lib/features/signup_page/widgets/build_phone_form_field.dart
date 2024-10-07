import 'package:flutter/material.dart';


class BuildPhoneFormField extends StatelessWidget {
   const BuildPhoneFormField({super.key});

   String generateCountryFlag(){
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text('${generateCountryFlag()}  +20',style: TextStyle(fontSize: 15),),
            )
        ),
        SizedBox(width: 16,),
        Expanded(
            flex: 3,
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  //controller: PhoneAuthCubit.get(context).phoneNumberController,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2.0,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter your phone number!';
                    }
                    else if(value.length < 11){
                      return 'please enter a validate number';
                    }
                    return null;
                  },
                )
            )
        ),
      ],
    );
  }
}
