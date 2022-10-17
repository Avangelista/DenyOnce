#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

%hook CLLocationManager
- (void)requestWhenInUseAuthorization {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status != 0) {
        %orig;
        return;
    }
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Location Requested"
                               message:@"This application is requesting access to your location."
                               preferredStyle:UIAlertControllerStyleAlert];
 
UIAlertAction* respondAction = [UIAlertAction actionWithTitle:@"Respond" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {%orig;}];

UIAlertAction* ignoreAction = [UIAlertAction actionWithTitle:@"Ignore for now" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {}];
 
[alert addAction:respondAction];
[alert addAction:ignoreAction];
[topController presentViewController:alert animated:YES completion:nil];
}

- (void)requestAlwaysAuthorization {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status != 0) {
        %orig;
        return;
    }
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Location Requested"
                               message:@"This application is requesting access to your location."
                               preferredStyle:UIAlertControllerStyleAlert];
 
UIAlertAction* respondAction = [UIAlertAction actionWithTitle:@"Respond" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {%orig;}];

UIAlertAction* ignoreAction = [UIAlertAction actionWithTitle:@"Ignore for now" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {}];
 
[alert addAction:respondAction];
[alert addAction:ignoreAction];
[topController presentViewController:alert animated:YES completion:nil];
}
%end
