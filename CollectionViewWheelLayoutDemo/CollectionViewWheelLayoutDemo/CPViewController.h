//
//  CPViewController.h
//  CollectionViewWheelLayoutDemo
//
//  Created by Parsifal on 15/8/12.
//  Copyright (c) 2015年 Parsifal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPCollectionViewWheelLayout.h"

@interface CPViewController : UIViewController
+ (CPViewController *)viewControllerWithCollectionViewLayoutType:(CPWheelLayoutType)type;
@end
