import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/size/app_size.dart';
import '../../../../core/config/classes/status_request.dart';
import '../../../../widgets/buttons/custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {super.key,
      this.onTap,
      required this.statusRequest,
      required this.message,
      this.iconsSize,
      });
  final void Function()? onTap;
  final StatusRequest statusRequest;
  final String message;
  final double? iconsSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: AppSize.screenWidth(context: context),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical:( isOfflineError(statusRequest)) ? 20.h:0),
            decoration: BoxDecoration(
                color: (isOfflineError(statusRequest) )? AppColors().red : null,
                shape: BoxShape.circle),
            child: Icon(
              isOfflineError(statusRequest)
                  ? Icons.wifi_off_rounded
                  : isOfflineForbidden(statusRequest)
                      ? Icons.do_not_disturb_alt_outlined
                      : Icons.error_outline_rounded,
              color:( isOfflineError(statusRequest))
                  ? AppColors().white
                  : AppColors().red,
              size:iconsSize?? 200.w,
            ),
          ),
          SizedBox(
            height:( isOfflineError(statusRequest)) ? 20.h : 0,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomButton(
              buttonWidth: 150.w,
              buttonColor: AppColors().red,
              buttonBody: 'Retry',
              onTap: onTap),
        ],
      ),
    );
  }
}

bool isOfflineError(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.offlineFailure ||
      statusRequest == StatusRequest.timeOutFailure);
  return value;
}

bool isOfflineForbidden(StatusRequest statusRequest) {
  bool value = (statusRequest == StatusRequest.forbiddenFailure ||
      statusRequest == StatusRequest.authorizedFailure);
  return value;
}
