//
//  MEKAnimationUtil.h
//  AutolayoutAnimationDemo
//
//  Created by limeijian on 16/1/25.
//  Copyright © 2016年 mekhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomePageAnimationUtil : NSObject

+ (void)titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view;

+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint WithView:(UIView *)view;

+ (void)phoneIconAnimationWithLabel:(UIImageView *)imageView withView:(UIView *)view;

+ (void)tipsLabelMaskAnimation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime;

+ (void)registerButtonWidthAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress;

@end
