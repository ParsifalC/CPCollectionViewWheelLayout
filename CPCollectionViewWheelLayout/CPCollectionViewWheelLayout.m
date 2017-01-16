//
//  CPCollectionViewWheelLayout.m
//  CollectionViewCircleLayout
//
//  Created by Parsifal on 15/3/13.
//  Copyright (c) 2015年 Parsifal. All rights reserved.
//

#import "CPCollectionViewWheelLayout.h"
@interface CPCollectionViewWheelLayout ()
@property (assign, nonatomic) NSUInteger cellCount;
@property (assign, nonatomic) CGFloat invisibleCellCount;
@property (assign, nonatomic) CGFloat radius;
@property (assign, nonatomic) CGSize cellSize;
@property (assign, nonatomic) CGFloat angular;
@property (assign, nonatomic) BOOL fadeAway;
@property (assign, nonatomic) CPWheelLayoutType layoutType;
@property (assign, nonatomic) CGFloat maxContentHeight;
@end

@implementation CPCollectionViewWheelLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellSize = CGSizeMake(50.0, 50.0);
        _angular = 20;
        _radius = 150;
        _layoutType = CPWheelLayoutRightBottom;
        _fadeAway = YES;
        _contentHeightPadding = 0;
    }
    return self;
}

- (instancetype)initWithRadius:(CGFloat)radius
                      cellSize:(CGSize)cellSize
                       angular:(CGFloat)angular
                      fadeAway:(BOOL)fadeAway
                    layoutType:(CPWheelLayoutType)layoutType
{
    self = [super init];
    if (self) {
        _cellSize = cellSize;
        _radius = radius;
        _angular = angular;
        _layoutType = layoutType;
        _fadeAway = fadeAway;
    }
    return self;
}

- (void)prepareLayout
{
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
    if (!self.cellCount) {
        return;
    }
    
    self.invisibleCellCount = self.collectionView.contentOffset.y/self.cellSize.height;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize viewSize = self.collectionView.bounds.size;
    CGSize cellSize = self.cellSize;
    CGPoint contentOffset = self.collectionView.contentOffset;
    CGFloat visibleCellIndex = indexPath.item-self.invisibleCellCount;//calculate new index->visible index
    
    UICollectionViewLayoutAttributes *attributes =
    [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = cellSize;
    attributes.hidden = YES;
    CGFloat angle = self.angular/90*visibleCellIndex*M_PI_2;
    CGFloat angleOffset = asin(cellSize.width/self.radius);
    CGAffineTransform translation = CGAffineTransformIdentity;
    
    switch (self.layoutType) {
        case CPWheelLayoutLeftBottom:
        {
            attributes.center =
            CGPointMake(cellSize.width/2,
                        contentOffset.y+viewSize.height-cellSize.height/2);
            
            if (angle <= (M_PI_2+2*angleOffset+self.angular/90) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation =
                CGAffineTransformMakeTranslation(sin(angle)*self.radius,
                                                 -(cos(angle)*self.radius+cellSize.height/2));
            }
            
            break;
        }
        case CPWheelLayoutRightBottom:
        {
            attributes.center =
            CGPointMake(viewSize.width-cellSize.width/2,
                        contentOffset.y+viewSize.height-cellSize.height/2);
            
            if (angle <= (M_PI_2+2*angleOffset+self.angular/90) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation =
                CGAffineTransformMakeTranslation(-sin(angle)*self.radius,
                                                 -(cos(angle)*self.radius+cellSize.height/2));
            }
            
            break;
        }
        case CPWheelLayoutLeftTop:
        {
            attributes.center = CGPointMake(cellSize.width/2, contentOffset.y);
            
            if (angle <= (M_PI_2+2*angleOffset+self.angular/90) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation = CGAffineTransformMakeTranslation(cos(angle)*self.radius,
                                                               (sin(angle)*self.radius+cellSize.height/2));
            }

            break;
        }
        case CPWheelLayoutRightTop:
        {
            attributes.center = CGPointMake(viewSize.width-cellSize.width/2, contentOffset.y);
            
            if (angle <= (M_PI_2+2*angleOffset+self.angular/90) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation = CGAffineTransformMakeTranslation(-cos(angle)*self.radius,
                                                               (sin(angle)*self.radius+cellSize.height/2));
            }
            
            break;
        }
        case CPWheelLayoutLeftCenter:
        {
            attributes.center = CGPointMake(cellSize.width/2, contentOffset.y+viewSize.height/2);
            angle = visibleCellIndex*self.angular/180*M_PI;
            
            if (angle <= (M_PI+2*angleOffset+self.angular/180) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation = CGAffineTransformMakeTranslation(sin(angle)*self.radius,
                                                               (-cos(angle)*self.radius));
            }
            
            break;
        }
        case CPWheelLayoutRightCenter:
        {
            attributes.center =
            CGPointMake(viewSize.width-cellSize.width/2, contentOffset.y+viewSize.height/2);
            angle = visibleCellIndex*self.angular/180*M_PI;
            
            if (angle <= (M_PI+2*angleOffset+self.angular/180) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation = CGAffineTransformMakeTranslation(-sin(angle)*self.radius,
                                                               (-cos(angle)*self.radius));
            }
            break;
        }
        case CPWheelLayoutTopCenter:
        {
            attributes.center = CGPointMake(viewSize.width/2, contentOffset.y+cellSize.width/2);
            angle = visibleCellIndex*self.angular/180*M_PI;
            
            if (angle <= (M_PI+2*angleOffset+self.angular/180) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation = CGAffineTransformMakeTranslation(-cos(angle)*self.radius,
                                                               (sin(angle)*self.radius));
            }
            break;
        }
        case CPWheelLayoutBottomCenter:
        {
            attributes.center =
            CGPointMake(viewSize.width/2, contentOffset.y+viewSize.height-cellSize.height/2);
            angle = visibleCellIndex*self.angular/180*M_PI;
            
            if (angle <= (M_PI+2*angleOffset+self.angular/180) && angle >= (0-angleOffset))
            {
                attributes.hidden = NO;
                translation = CGAffineTransformMakeTranslation(-cos(angle)*self.radius,
                                                               (-sin(angle)*self.radius));
            }
            break;
        }
        default:
        {
            break;
        }
    }

    attributes.transform = translation;
    CGFloat fadeFactor =
    (self.layoutType==CPWheelLayoutRightCenter || self.layoutType==CPWheelLayoutLeftCenter)?(1-fabs(angle-M_PI_2)*0.5):(1-fabs(angle-M_PI_4));
    attributes.alpha = self.fadeAway?fadeFactor:1;
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributesArray = @[].mutableCopy;
    for (int i = 0; i < self.cellCount; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        if (CGRectContainsRect(rect, attributes.frame) || CGRectIntersectsRect(rect, attributes.frame)) {
            [attributesArray addObject:attributes];
        }
    }
    
    return attributesArray;
}

- (CGSize)collectionViewContentSize
{
    CGSize viewSize = self.collectionView.bounds.size;
    CGFloat visibleCellCount = 0;
    if (self.layoutType == CPWheelLayoutLeftCenter ||
        self.layoutType == CPWheelLayoutRightCenter ||
        self.layoutType == CPWheelLayoutBottomCenter ||
        self.layoutType == CPWheelLayoutTopCenter) {
        
        visibleCellCount = 180/self.angular+1;
        return CGSizeMake(viewSize.width,
                          viewSize.height+(self.cellCount-visibleCellCount)*self.cellSize.height+self.contentHeightPadding);
    } else {
        visibleCellCount = 90/self.angular+1;
        return CGSizeMake(viewSize.width,
                          viewSize.height+(self.cellCount-visibleCellCount)*self.cellSize.height+self.contentHeightPadding);
    }
}
@end
