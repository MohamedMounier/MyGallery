import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallrey/core/utils/enums.dart';
import 'package:my_gallrey/core/utils/resources/assets_manager.dart';
import 'package:my_gallrey/core/utils/resources/color_manager.dart';
import 'package:my_gallrey/core/utils/resources/size_config.dart';
import 'package:my_gallrey/presentation/components/button_with_icon.dart';
import 'package:my_gallrey/presentation/components/glass_widget.dart';
import 'package:my_gallrey/presentation/controller/login_bloc.dart';
import 'package:shimmer/shimmer.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.loginSteps == HomeSteps.isUploadingPhotoSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Photo was uploaded successfully")));
              context.read<LoginBloc>().add(GetGalleryEvent(state.user!.token));
            } else if (state.loginSteps == HomeSteps.isUploadingPhoto) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please wait while uploading your photo !")));
            }
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.galleryBg),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight(context) * .15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButtonWithIcon(
                          iconName: AppImages.logOut,
                          text: "log out",
                          onTap: () {
                            Navigator.pop(context);
                          }),
                      CustomButtonWithIcon(
                          iconName: AppImages.upload,
                          text: "upload",
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return Container(
                                    child: AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      content: GlassMorphism(
                                          opacity: 0.5,
                                          blur: 40,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: CustomButtonWithIcon(
                                                    iconName: AppImages.upload,
                                                    text: "Gallery",
                                                    onTap: () {
                                                      pickImageGallery(context);
                                                    }),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: CustomButtonWithIcon(
                                                    iconName: AppImages.upload,
                                                    text: "Camera",
                                                    onTap: () {
                                                      pickImageCamera(context);
                                                    }),
                                              ),
                                            ],
                                          )),
                                    ),
                                  );
                                });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight(context) * .05,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state.loginSteps == HomeSteps.isFetchingGallery) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Expanded(
                            child: GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1 / 1,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20),
                                itemCount: state.images!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(2),

                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                              offset: Offset(0.0, 0.7))
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: ColorManager.grey1),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                state.images![index]),
                                            fit: BoxFit.fill)),
                                    // child: CachedNetworkImage(
                                    //     imageUrl: state.images![index],fit: BoxFit.fill,fadeInCurve: Curves.easeIn),
                                  );
                                }));
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickImageGallery(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      context.read<LoginBloc>().add(UploadImageEvent(imageFile));
      Navigator.pop(context);
    }
  }

  Future pickImageCamera(BuildContext context) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      File imageFile = File(image.path);
      context.read<LoginBloc>().add(UploadImageEvent(imageFile));
      Navigator.pop(context);
    }
  }
}
