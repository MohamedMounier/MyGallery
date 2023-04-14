// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:my_gallrey/core/shared/widgets/editable_text.dart';
// import 'package:my_gallrey/core/utils/resources/size_config.dart';
//
// class LoginWidget extends StatelessWidget {
//   const LoginWidget({Key? key,required this.emailCtrl,required this.passCtrl,required this.login}) : super(key: key);
// final TextEditingController emailCtrl;
// final TextEditingController passCtrl;
//
// final Function()  login;
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       padding: EdgeInsets.all(20),
//
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//       boxShadow:[
//         BoxShadow(color: Colors.white,
//         blurStyle: BlurStyle.inner,
//           offset: Offset(0.0, 0.9),
//           blurRadius: 100
//         ),
//         BoxShadow(color: Colors.white,
//             blurStyle: BlurStyle.inner,
//             offset: Offset(1, -1),
//             blurRadius: 100
//         )
//       ] ,
//         borderRadius: BorderRadius.circular(20)
//       ),
//       height: SizeConfig.screenHeight(context)*.44,
//       width: 500,
//       child: Column(
//         children: [
//           EditableInfoField(textEditingController: emailCtrl, hint: "email", iconName: Icons.add,isPassword: false),
//
//           EditableInfoField(textEditingController: passCtrl, hint: "password", iconName: Icons.add,isPassword: false),
//           SizedBox(height: 50,),
//           ElevatedButton(onPressed: login, child: Text("Login"))
//         ],
//       ),
//     );
//   }
// }
//
// class GlassEffectContainer extends StatelessWidget{
//   Widget widget;
//
//   GlassEffectContainer(this.widget);
//
//   @override
//   Widget build(BuildContext context) {
//     return  GlassContainer(
//
//       height: SizeConfig.screenHeight(context)*.4,
//       width: SizeConfig.screenWidth(context)*.8,
//       gradient: LinearGradient(
//         colors: [
//           Colors.white.withOpacity(0.5),
//           Colors.white.withOpacity(0.5),
//         ],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       borderGradient: LinearGradient(
//         colors: [
//           Colors.white.withOpacity(0.60),
//           Colors.white.withOpacity(0.10),
//           Colors.white.withOpacity(0.05),
//           Colors.white.withOpacity(0.60),
//         ],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         stops: [0.0, 0.39, 0.40, 1.0],
//       ),
//
//       blur: 2,
//       borderRadius: BorderRadius.circular(24.0),
//       borderWidth: 1.0,
//       elevation: 3.0,
//       isFrostedGlass: true,
//       shadowColor: Colors.white.withOpacity(0.20),
//       child: widget,
//     );
//
//   }
// }
