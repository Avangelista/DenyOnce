#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

%hook CLLocationManager

- (void)requestWhenInUseAuthorization {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status != 0) {
        %orig;
        return;
    }
    
    UIWindow* window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [UIViewController new];
    window.windowLevel = UIWindowLevelAlert + 1;

    NSString *appName = [[NSBundle mainBundle] localizedInfoDictionary][@"CFBundleDisplayName"];
    NSString *message = [NSString stringWithFormat:@"“%@” is requesting access to your location.", appName];

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Location Requested" message:message
preferredStyle:UIAlertControllerStyleAlert];
 
    UIAlertAction* respondAction = [UIAlertAction actionWithTitle:@"Respond" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {window.hidden = YES;%orig;}];

    UIAlertAction* ignoreAction = [UIAlertAction actionWithTitle:@"Ignore for now" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {window.hidden = YES;}];
 
    [alert addAction:respondAction];
    [alert addAction:ignoreAction];

    [window makeKeyAndVisible];

    [window.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)requestAlwaysAuthorization {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status != 0) {
        %orig;
        return;
    }
    
    UIWindow* window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [UIViewController new];
    window.windowLevel = UIWindowLevelAlert + 1;

    NSString *appName = [[NSBundle mainBundle] localizedInfoDictionary][@"CFBundleDisplayName"];
    NSString *message = [NSString stringWithFormat:@"“%@” is requesting access to your location.", appName];

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Location Requested" message:message
preferredStyle:UIAlertControllerStyleAlert];
 
    UIAlertAction* respondAction = [UIAlertAction actionWithTitle:@"Respond" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {window.hidden = YES;%orig;}];

    UIAlertAction* ignoreAction = [UIAlertAction actionWithTitle:@"Ignore for now" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {window.hidden = YES;}];
 
    [alert addAction:respondAction];
    [alert addAction:ignoreAction];

    [window makeKeyAndVisible];

    [window.rootViewController presentViewController:alert animated:YES completion:nil];
}

%end
