//
//  UINavigationController+extention.h
//  headView下拉放大
//
//  Created by xrh on 2017/10/27.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (extention)

- (void)clearNavigationBar;
- (void)setTintColor:(nullable UIColor*)color;
- (void)setBarTintColor:(nullable UIColor*)color;
- (void)setBackgroundImage:(nullable UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics;
- (void)setTitleColor:(nullable UIColor*)color;

@end
