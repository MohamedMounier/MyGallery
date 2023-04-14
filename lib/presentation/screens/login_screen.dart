
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallrey/core/routes/app_routes_names.dart';
import 'package:my_gallrey/core/shared/widgets/editable_text.dart';
import 'package:my_gallrey/core/shared/widgets/keys.dart';
import 'package:my_gallrey/core/utils/enums.dart';
import 'package:my_gallrey/core/utils/resources/assets_manager.dart';
import 'package:my_gallrey/core/utils/resources/color_manager.dart';
import 'package:my_gallrey/core/utils/resources/size_config.dart';
import 'package:my_gallrey/domain/entities/login.dart';
import 'package:my_gallrey/presentation/components/glass_widget.dart';
import 'package:my_gallrey/presentation/components/login_component.dart';
import 'package:my_gallrey/presentation/controller/login_bloc.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl= TextEditingController();

  final TextEditingController passCtrl=TextEditingController();
  static final loginKEy =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    if(state.loginSteps ==HomeSteps.isLoginUserInSuccess){
      context.read<LoginBloc>().add(GetGalleryEvent(state.user!.token));
      Navigator.pushNamed(context, AppRoutesName.gallery);

    }else if (state.loginSteps == HomeSteps.isLoginUserInError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.loginErrorMessage)));
    }
  },
        child: Stack(
          children: [
            Container(

              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.loginBg),fit: BoxFit.fill,),
              ),


            ),
            ListView(
              children: [
                SizedBox(height: SizeConfig.screenHeight(context)*.25,),
                Center(child: Text("My \nGallery",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: ColorManager.darkGrey),
                ),),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(30),

                  child: GlassMorphism(opacity: 0.5,blur: 20,child: Form(
                    key: loginKEy,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Center(child: Text("Log In",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: ColorManager.darkGrey),
                          ),),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: EditableInfoField(textEditingController: emailCtrl, hint: "email", iconName: Icons.add,isPassword: false),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: EditableInfoField(textEditingController: passCtrl, hint: "password", iconName: Icons.add,isPassword: false),
                          ),
                          SizedBox(height: 20,),
                          BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom( backgroundColor: Colors.blue.shade300,
                                fixedSize: Size(double.maxFinite, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                              ),
                                onPressed: (){
                              validateFields(context);
                            }, child: state.loginSteps==HomeSteps.isLoginUserIn?CircularProgressIndicator(color: Colors.white,):Text("Submit",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

                            )),
                          );
  },
)
                        ],
                      ),
                    ),
                    // child: LoginWidget(emailCtrl: emailCtrl, passCtrl: passCtrl, login: validateFields(context)),
                  )),
                ),
              ],
            )
          ],
        ),
)
    );
  }

  validateFields(BuildContext context){
if(loginKEy.currentState!.validate()){
  context.read<LoginBloc>().add(LoginEventLogUserIn(LoginEntity(email: emailCtrl.text, password: passCtrl.text)));
}
  }
}
