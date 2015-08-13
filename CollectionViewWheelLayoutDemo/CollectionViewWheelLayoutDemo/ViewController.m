//
//  ViewController.m
//  CollectionViewWheelLayoutDemo
//
//  Created by Parsifal on 15/8/12.
//  Copyright (c) 2015年 Parsifal. All rights reserved.
//

#import "ViewController.h"
#import "CPViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *titleArray;
@end

@implementation ViewController

#pragma mark - Life Cycle methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableView DataSource & Delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    CPViewController *vc = [CPViewController viewControllerWithCollectionViewLayoutType:indexPath.row];
    vc.title = self.titleArray[indexPath.row];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - Getter & Setter
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"CPWheelLayoutLeftBottom",
                        @"CPWheelLayoutRightBottom",
                        @"CPWheelLayoutLeftTop",
                        @"CPWheelLayoutRightTop",
                        @"CPWheelLayoutLeftCenter",
                        @"CPWheelLayoutRightCenter"];
    }
    
    return _titleArray;
}
@end
