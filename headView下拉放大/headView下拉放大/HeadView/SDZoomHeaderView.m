//
//  SDZoomHeaderView.m
//  headView下拉放大
//
//  Created by xrh on 2017/10/27.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "SDZoomHeaderView.h"

@interface SDZoomHeaderView ()

@property(nonatomic, assign) CGFloat aspectRatic;// 宽高比 width/height

@end

@implementation SDZoomHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _backgroundView.backgroundColor = self.backgroundColor;
        [self addSubview:_backgroundView];
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
        
        self.aspectRatic = CGRectGetWidth(frame)/CGRectGetHeight(frame);
    }
    return self;
}

- (void)setOffsetY:(CGFloat)offsetY {
    
    _offsetY = offsetY;
    
    if (_offsetY < 0) {
        if (_isFullImage) {
            self.imageView.frame = CGRectMake(CGRectGetMinX(self.imageView.frame), _offsetY + _imageViewEdgeInsets.top, CGRectGetWidth(self.bounds)-self.imageViewEdgeInsets.left-self.imageViewEdgeInsets.right, CGRectGetHeight(self.bounds)-self.imageViewEdgeInsets.top - self.imageViewEdgeInsets.bottom - _offsetY);
        } else {
            CGFloat height = CGRectGetHeight(self.bounds)-self.imageViewEdgeInsets.top - self.imageViewEdgeInsets.bottom - _offsetY;
            CGFloat width = height * self.aspectRatic;
            
            self.imageView.frame = CGRectMake((CGRectGetWidth(self.bounds) - width)/2, _offsetY+_imageViewEdgeInsets.top, width, height);
        }
    }
    
    self.backgroundView.frame = CGRectMake(0, CGRectGetMinY(self.imageView.frame)-_imageViewEdgeInsets.top, CGRectGetWidth(self.bounds), CGRectGetHeight(self.imageView.frame)+_imageViewEdgeInsets.bottom + _imageViewEdgeInsets.top);
}

- (void)setImageViewEdgeInsets:(UIEdgeInsets)imageViewEdgeInsets {
    
    _imageViewEdgeInsets = imageViewEdgeInsets;
    CGRect rect = CGRectMake(_imageViewEdgeInsets.left, _imageViewEdgeInsets.top, CGRectGetWidth(self.bounds) - self.imageViewEdgeInsets.left - self.imageViewEdgeInsets.right, CGRectGetHeight(self.bounds) - self.imageViewEdgeInsets.top - self.imageViewEdgeInsets.bottom);
    self.imageView.frame = rect;
    self.aspectRatic = CGRectGetWidth(self.imageView.frame) / CGRectGetHeight(self.imageView.frame);
}

@end
