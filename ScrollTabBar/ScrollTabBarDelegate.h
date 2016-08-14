//
//  ScrollTabBarDelegate.h
//  ScrollTabBar
//
//  Created by QiuQiu on 16/8/14.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScrollTabBarDelegate : NSObject <UITabBarControllerDelegate>

@property (nonatomic, assign) BOOL interactive;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

@end
