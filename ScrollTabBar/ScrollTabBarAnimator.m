//
//  ScrollTabBarAnimator.m
//  ScrollTabBar
//
//  Created by QiuQiu on 16/8/14.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import "ScrollTabBarAnimator.h"

@implementation ScrollTabBarAnimator

//动画持续时间
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

//动画执行效果
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 获取 toView fromView
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    if (!toViewController || !fromViewController || !containerView) return;
    
    // 给 toView fromView 设定相应的值
    toViewController.view.transform = CGAffineTransformIdentity;
    fromViewController.view.transform = CGAffineTransformIdentity;
    CGFloat translation = containerView.frame.size.width;

    switch (self.tabScrollDirection) {
        case TabLeftDirection:
            translation = translation;
            break;
        case TabRightDirection:
            translation = -translation;
            break;
        default:
            break;
    }

    [containerView addSubview:toViewController.view];
    toViewController.view.transform = CGAffineTransformMakeTranslation(-translation, 0);
    // 真正的变化
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeTranslation(translation, 0);
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        toViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
