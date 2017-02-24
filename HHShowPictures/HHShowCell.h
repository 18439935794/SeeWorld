//
//  HHShowCell.h
//  HHShowPictures
//
//  Created by LXH on 2017/2/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowPictureView.h"
@interface HHShowCell : UITableViewCell<ShowPictureViewDelegate>

+ (instancetype)creatCellWithTableView:(UITableView *)tableView;
- (void)refershCell:(NSArray *)array;
- (CGFloat)cellHeigth;
@end
