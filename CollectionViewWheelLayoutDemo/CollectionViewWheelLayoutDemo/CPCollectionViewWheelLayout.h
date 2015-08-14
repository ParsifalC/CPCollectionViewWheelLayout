//
//  CPCollectionViewWheelLayout.h
//  CollectionViewCircleLayout
//
//  Created by Parsifal on 15/3/13.
//  Copyright (c) 2015年 Parsifal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CPWheelLayoutLeftBottom,
    CPWheelLayoutRightBottom,
    CPWheelLayoutLeftTop,
    CPWheelLayoutRightTop,
    CPWheelLayoutLeftCenter,
    CPWheelLayoutRightCenter,
    CPWheelLayoutTopCenter,
    CPWheelLayoutBottomCenter,
} CPWheelLayoutType;

@interface CPCollectionViewWheelLayout : UICollectionViewLayout
/**
 *  angular:degree measure eg.20° 30°
 *  radius:the radius of the wheel
 */
- (instancetype)initWithRadius:(CGFloat)radius
                      cellSize:(CGSize)cellSize
                       angular:(CGFloat)angular
                      fadeAway:(BOOL)fadeAway
                    layoutType:(CPWheelLayoutType)layoutType;

@property (assign, nonatomic) CGFloat contentHeightPadding;
@end
