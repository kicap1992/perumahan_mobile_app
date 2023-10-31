import 'package:flutter/material.dart';
import 'package:perumahan_bew/app/themes/app_colors.dart';
import 'package:perumahan_bew/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';

import './user_profile_view_model.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      viewModelBuilder: () => UserProfileViewModel(),
      onViewModelReady: (UserProfileViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        UserProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  // create a rounded container
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: const NetworkImage(
                            'http://kicap-karan.com/assets/img/me.jpg',
                          ),
                          fit: BoxFit.cover,
                          onError: (exception, stackTrace) {
                            model.log.e('Error: $exception');
                          },
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'Kicap Karan',
                      style: boldTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 10; i++) const _DetailChild(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Positioned(
                top: 15,
                right: 65,
                child: IconButton(
                  onPressed: () {
                    model.log.i('Edit Profile');
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: mainColor,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: IconButton(
                    onPressed: () {
                      model.log.i('Logout');
                      model.logout();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: mainColor,
                      size: 30,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

class _DetailChild extends StatelessWidget {
  const _DetailChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.maps_home_work_outlined,
            color: mainColor,
            size: 40,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'Jln 2, Blok C, No 2',
            style: regularTextStyle.copyWith(
              fontSize: 15,
              color: mainGrey,
            ),
          ),
        ],
      ),
    );
  }
}
