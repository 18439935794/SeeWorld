//
//  HHShowCell.m
//  HHShowPictures
//
//  Created by LXH on 2017/2/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHShowCell.h"

@interface HHShowCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) ShowPictureView *picView;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, strong) UIButton *zanBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *talkBtn;

@end

#define kWidth ([UIScreen mainScreen].bounds.size.width)

@implementation HHShowCell


+ (instancetype)creatCellWithTableView:(UITableView *)tableView {
    HHShowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[HHShowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.nameLab];
        [self addSubview:self.timeLab];
        [self addSubview:self.message];
        [self addSubview:self.picView];
    }
    return self;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView =[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _iconView.layer.cornerRadius = 25;
        _iconView.clipsToBounds = YES;
        _iconView.backgroundColor = [UIColor redColor];

    }
    return _iconView;
}
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab =[[UILabel alloc] initWithFrame:CGRectMake(80, 30, 100, 20)];
        _nameLab.text = @"小但丁";
    }return _nameLab;
}
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[[UILabel alloc] initWithFrame:CGRectMake(kWidth - 100, 30, 80, 20)];
        _timeLab.textAlignment = NSTextAlignmentRight;
        _timeLab.text = @"10分钟前";
    }return _timeLab;
}

- (UILabel *)message {
    if (!_message) {
        _message =[[UILabel alloc] initWithFrame:CGRectMake(10, 70, kWidth - 20, 20)];
        _message.numberOfLines = 0;
        _message.text = @"10分钟前";
    }return _message;
}
- (ShowPictureView *)picView {
    if (!_picView) {
        _picView = [[ShowPictureView alloc] initWithFrame:CGRectMake(0, 100, kWidth, 0)];
        _picView.delegate = self;
    }
    return _picView;
}
- (void)refershCell:(NSArray *)array
{
    self.picView.images = array;
    [self layoutIfNeeded];
}

- (CGFloat)cellHeigth {
    [self layoutSubviews];
    NSLog(@"------%f",CGRectGetMaxY(self.picView.frame)+10);
    return CGRectGetMaxY(self.picView.frame)+10;
}
- (void)showmePictureView:(ShowPictureView *)picView index:(NSInteger)index{

//    UITapGestureRecognizer *tap = recognizer;
//    UIImageView *imgView = (UIImageView*)tap.view;
//    
//    __weak typeof (UIImageView *)imv = imgView;
//    [PhotoBroswerVC show:self type:PhotoBroswerVCTypeZoom index:(imgView.tag - 100)  photoModelBlock:^NSArray *{
//        
//        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:self.images.count];
//        for (NSUInteger i = 0; i< self.images.count; i++) {
//            PhotoModel *pbModel=[[PhotoModel alloc] init];
//            pbModel.mid = i + 1;
//            pbModel.image_HD_U = [NSString stringWithFormat:@"%@",[self.images objectAtIndex:i]];
//            
//            pbModel.sourceImageView = imv;
//            [modelsM addObject:pbModel];
//        }
//        return modelsM;
//    }];
    


}
@end
