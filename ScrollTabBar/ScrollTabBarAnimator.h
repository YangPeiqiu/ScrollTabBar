//
//  ScrollTabBarAnimator.h
//  ScrollTabBar
//
//  Created by QiuQiu on 16/8/14.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TabOperationDirection) {
    TabLeftDirection,
    TabRightDirection
};

@interface ScrollTabBarAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) TabOperationDirection tabScrollDirection;

@end
