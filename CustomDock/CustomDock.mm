// old iOS 9 SDK #import <Preferences/Preferences.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
// Modern Preference bundles use these three imports ^^
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CustomDockListController: PSListController {
}
- (void)twitterlink;
- (void)donate;
@end





@implementation CustomDockListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"CustomDock" target:self];
	}
	return _specifiers;
}

- (void)twitterlink {
	if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/brianvs"]
		options:@{}
		completionHandler:nil];
	}
}

- (void)donate {
	if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/i0stweak3r"]
		options:@{}
		completionHandler:nil];
	}
}

@end
