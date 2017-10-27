//
//  SDZoomHeaderView.h
//  headView下拉放大
//
//  Created by xrh on 2017/10/27.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDZoomHeaderView : UIView

/**
 背景区域，其存在于所有子view之下，默认大小和控件大小相同
 */
@property(strong, nonatomic) UIView *backgroundView;
@property(strong, nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, assign) UIEdgeInsets imageViewEdgeInsets;

/**
 当界面滚动时将设置界面的偏移量
 */
@property (nonatomic, assign) CGFloat offsetY;

/**
 *   是否显示整张图片。图片尺寸可能比给出的区域大。这样下拉的时候，
 *   默认先按最大高度显示图片。当图片按高度全部展示完后，再等比拉伸图片,
 *   但仍不会完全显示图片。默认NO
 */
@property (nonatomic, assign) BOOL isFullImage;

@end
