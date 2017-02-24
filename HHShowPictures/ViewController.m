//
//  ViewController.m
//  HHShowPictures
//
//  Created by LXH on 2017/2/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "ViewController.h"
#import "HHShowCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *images;
}
@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    images =[NSMutableArray array];
    for (int i = 0; i < 10; i ++) {
        NSMutableArray *array = [NSMutableArray array];
        NSUInteger count = arc4random() % 9 + 1;
        for (int j = 1; j <= count; j ++) {
            [array addObject:[NSString stringWithFormat:@"%d.png",j]];
        }
        [images addObject:array];
    }
//    [images insertObject:@[@"1.png"] atIndex:0];
    [self.view addSubview:self.myTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return images.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHShowCell *cell = (HHShowCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.cellHeigth;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHShowCell *cell = [HHShowCell creatCellWithTableView:tableView];
    [cell refershCell:images[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
