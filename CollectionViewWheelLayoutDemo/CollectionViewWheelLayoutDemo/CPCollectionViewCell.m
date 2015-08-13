//
//  CPCollectionViewCell.m
//  CollectionViewWheelLayoutDemo
//
//  Created by Parsifal on 15/8/12.
//  Copyright (c) 2015年 Parsifal. All rights reserved.
//

#import "CPCollectionViewCell.h"

@implementation CPCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = frame.size.width/2;
        self.layer.borderColor = [UIColor blueColor].CGColor;
        self.layer.borderWidth = 2.0;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        self.textLabel = label;
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}
@end
