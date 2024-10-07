import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:stapo/features/signup_page/widgets/build_phone_form_field.dart';
import 'package:stapo/features/signup_success_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Country? selectedCountry ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {

        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,)),
        title: Text('Create an account',style: TextStyle(color: Colors.black,fontSize: 18),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Let us get ',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            Text('to know more Info',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            Text('about you',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full name',
                prefixIcon: Image(image: AssetImage('assets/images/user.png'))

              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Image(image: AssetImage('assets/images/mail.png'))

              ),
            ),
            SizedBox(height: 30,),

             Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                            exclude: <String>['KN', 'MF'],
                            favorite: <String>['SE'],
                            //Optional. Shows phone code before the country name.
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              setState(() {
                                selectedCountry = country;
                              });

                              print('Select country: ${country.displayName}');
                            },
                            // Optional. Sheet moves when keyboard opens.
                            moveAlongWithKeyboard: false,
                            // Optional. Sets the theme for the country list picker.
                            countryListTheme: CountryListThemeData(
                              // Optional. Sets the border radius for the bottomsheet.
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              // Optional. Styles the search field.
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                                  ),
                                ),
                              ),
                              // Optional. Styles the text in the search field
                              searchTextStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          );
                        },
                        child: selectedCountry != null? Row(
                          children: [
                            Text(selectedCountry!.flagEmoji,style: TextStyle(fontSize: 25),),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ) : Text('select country'),
                      )
                  ),
                  Expanded(
                    flex: 3,
                      child: TextFormField()
                  ),

                ],
              ),
            SizedBox(height: 50,),
            Text('We will send 4-digits verification code',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            Text('to confirm them',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            TextButton(
                onPressed: () => Navigator.push( context, MaterialPageRoute(builder: (context) => SignUpSuccessPage()),),
                child: Text('create account')),
          ],
        ),
      ),
    );
  }
}
