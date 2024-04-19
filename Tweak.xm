#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

%hook SBRootFolderView
//Several updated methods for iOS 13

-(UIEdgeInsets)_statusBarInsetsForDockEdge:(unsigned long long)arg1 dockOffscreenPercentage:(double)arg2 {
    arg2= 0;
    return %orig(arg1,arg2);
}

-(double)currentDockOffscreenFraction {
    dockheightfrac= 0;
    return dockheightfrac;
}

-(void)setDockOffscreenFraction:(double)arg1 {
    arg1= 150;
    return %orig(arg1);
}

-(void)_setDockOffscreenFraction:(double)arg1 {
    arg1= 150;
    return %orig(arg1);
}


-(void)_applyDockOffscreenFraction:(CGFloat)arg1 {
    arg1= 150;
    return %orig(arg1);
}

%end

//NEW IOS 13 CLASS ACTUALLY A PROTOCOL
%hook SBDockOffscreenFractionModifying
-(void)setDockOffscreenFraction:(double)arg1 {
    arg1= 150;
    return %orig(arg1);
}
%end
