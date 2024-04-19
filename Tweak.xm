#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

const CGFloat firmware =  [[UIDevice currentDevice].systemVersion floatValue];

//Several updated methods for iOS 13
%hook SBRootFolderView
-(UIEdgeInsets)_statusBarInsetsForDockEdge:(unsigned long long)arg1 dockOffscreenPercentage:(double)arg2 {
    arg2= 0;
    return %orig(arg1,arg2);
}

-(void)setDockOffscreenFraction:(double)arg1 {
    arg1= 0.05;
    return %orig(arg1);
}

-(void)_setDockOffscreenFraction:(double)arg1 {
    arg1= 0.05;
    return %orig(arg1);
}

-(void)_applyDockOffscreenFraction:(CGFloat)arg1 {
    arg1=0.05;
    return %orig(arg1);
}

%end

//NEW IOS 13 CLASS ACTUALLY A PROTOCOL
%hook SBDockOffscreenFractionModifying
-(void)setDockOffscreenFraction:(double)arg1 {
    arg1= 0.05;
    return %orig(arg1);
}

%end

%hook SBDockView 
-(CGFloat)dockHeight {
     CGFloat screenHeight= [[UIScreen mainScreen]bounds].size.height;
     CGFloat screenWidth = [[UIScreen mainScreen]bounds].size.width;

     if((screenHeight>screenWidth)) {
          return 160;
     }
     else { return %orig; }
}
%end
