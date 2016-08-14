//
//  ScrollTabBarDelegate.m
//  ScrollTabBar
//
//  Created by QiuQiu on 16/8/14.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import "ScrollTabBarDelegate.h"
#import "ScrollTabBarAnimator.h"


@interface ScrollTabBarDelegate ()

@property (nonatomic, strong) ScrollTabBarAnimator *tabBarAnimator;

@end

@implementation ScrollTabBarDelegate

- (instancetype)init {
    if (self = [super init]) {
        _interactive = NO;
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        _tabBarAnimator = [[ScrollTabBarAnimator alloc] init];

    }
    return self;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                               interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactive ? self.interactionController : nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                                       toViewController:(UIViewController *)toVC {
    
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    self.tabBarAnimator.tabScrollDirection = (toIndex < fromIndex) ? TabLeftDirection: TabRightDirection;
    return self.tabBarAnimator;

}

@end
