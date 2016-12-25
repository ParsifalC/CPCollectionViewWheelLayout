//
//  CPViewController.m
//  CollectionViewWheelLayoutDemo
//
//  Created by Parsifal on 15/8/12.
//  Copyright (c) 2015年 Parsifal. All rights reserved.
//

#import "CPViewController.h"
#import "CPCollectionViewCell.h"

@interface CPViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (assign, nonatomic) CPWheelLayoutType layoutType;
@end

#pragma mark - Life Cycle methods
@implementation CPViewController

+ (CPViewController *)viewControllerWithCollectionViewLayoutType:(CPWheelLayoutType)type
{
    CPViewController *vc = [CPViewController new];
    vc.layoutType = type;
    //note:you need set this property NO if your controller is on a navigation stack.
    [vc setAutomaticallyAdjustsScrollViewInsets:NO];
    return vc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[self collectionView]];
}

#pragma mark - UICollectionView DataSource & Delegate Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CPCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CPCollectionViewCell class])
                                              forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", @(indexPath.row));
}

#pragma mark - getter
- (UICollectionView *)collectionView
{
    CGSize viewSize = self.view.bounds.size;
    CGFloat radius = 0;
    if (self.layoutType == CPWheelLayoutTopCenter || self.layoutType == CPWheelLayoutBottomCenter) {
        radius = viewSize.width*0.4;
    } else {
        radius = viewSize.width*0.6;
    }
    
    CPCollectionViewWheelLayout *wheelLayout =
    [[CPCollectionViewWheelLayout alloc] initWithRadius:radius
                                               cellSize:CGSizeMake(40, 40)
                                                angular:20
                                               fadeAway:NO
                                             layoutType:self.layoutType];
    
    CGRect frame = CGRectMake(0, 64, viewSize.width, viewSize.height-64);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame
                                                          collectionViewLayout:wheelLayout];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[CPCollectionViewCell class]
       forCellWithReuseIdentifier:NSStringFromClass([CPCollectionViewCell class])];
    return collectionView;
}

@end
