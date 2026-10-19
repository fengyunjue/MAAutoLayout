//
//  MAAppDelegate.m
//  MAAutoLayout
//

#import "MAAppDelegate.h"
#import "MAAutoLayout.h"
#import "MASceneDelegate.h"

@implementation MAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MAAutoLayout setErrorHandler:^(NSError *error) {
        NSLog(@"[MAAutoLayout] %@", error);
    }];
    return YES;
}

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    UISceneConfiguration *configuration = [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
    configuration.delegateClass = [MASceneDelegate class];
    return configuration;
}

@end
