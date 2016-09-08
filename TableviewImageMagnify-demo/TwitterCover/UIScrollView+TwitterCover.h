//
//  UIScrollView+TwitterCover.h
//  TwitterCover
//
//  Created by hangchen on 1/7/14.
//  Copyright (c) 2014 Hang Chen (https://github.com/cyndibaby905)
//

#import <UIKit/UIKit.h>

#define kMainScreen_Width [UIScreen mainScreen].bounds.size.width
//#define kMainScreen_Height [UIScreen mainScreen].bounds.size.height
#define CHTwitterCoverViewHeight 200

@interface CHTwitterCoverView : UIImageView
@property (nonatomic, weak) UIScrollView *scrollView;
- (id)initWithFrame:(CGRect)frame andContentTopView:(UIView*)view;
@end


@interface UIScrollView (TwitterCover)
@property(nonatomic,weak)CHTwitterCoverView *twitterCoverView;
- (void)addTwitterCoverWithImage:(UIImage*)image;
- (void)addTwitterCoverWithImage:(UIImage*)image withTopView:(UIView*)topView;
- (void)removeTwitterCoverView;
@end

@interface UIImage (Blur)
-(UIImage *)boxblurImageWithBlur:(CGFloat)blur;
@end