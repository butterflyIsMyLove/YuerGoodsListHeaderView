//
//  GoodsListHeaderViewSetDefault.m
//  YuerGoodsListHeaderView
//
//  Created by XiangTaiMini on 2017/5/23.
//  Copyright © 2017年 yuer. All rights reserved.
//

#import "GoodsListHeaderViewSetDefault.h"
#import "UIButton+SSEdgeInsets.h"

#define kBtnDefaultImage [UIImage imageNamed:@"goodlist_default_icon"]
#define kBtnUpImage [UIImage imageNamed:@"goodlist_select_up_icon"]
#define kBtnDownImage [UIImage imageNamed:@"goodlist_select_down_icon"]
@interface GoodsListHeaderViewSetDefault ()

@property (nonatomic , weak)   UIButton * shelfTimeBtn;    // 上架时间
@property (nonatomic , weak)   UIButton * priceBtn;        // 价格
@property (nonatomic , weak)   UIButton * currentSelectedBtn; // 当前选中的按钮
@property (nonatomic , assign) NSInteger isDown; // 箭头是否朝下

@end
@implementation GoodsListHeaderViewSetDefault

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

//  创建视图
- (void)setupViews {
    
    self.shelfTimeBtn = [self setupButtonWithTitle:@"上架时间" buttonIndex:0];
    self.priceBtn = [self setupButtonWithTitle:@"价格" buttonIndex:1];
    
    // 设置当前选中按钮的状态
    self.currentSelectedBtn = self.shelfTimeBtn;
    [self.shelfTimeBtn setImage:kBtnUpImage forState:UIControlStateNormal];
    [self.shelfTimeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

// 按钮的点击事件
- (void)buttonClick:(UIButton *)button {
    
//    // 先判断是否选中的是同一个按钮
//    // 同一个按钮 改变朝向
    if (self.currentSelectedBtn == button) {
        if (self.isDown) {
            [button setImage:kBtnUpImage forState:UIControlStateNormal];
        } else {
            [button setImage:kBtnDownImage forState:UIControlStateNormal];
        }
        self.isDown = !self.isDown;
    } else {
        [self.currentSelectedBtn setImage:kBtnDefaultImage forState:UIControlStateNormal];
        [self.currentSelectedBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        // 设置新点击按钮的状态
        self.currentSelectedBtn = button;
        self.isDown = NO;
        [button setImage:kBtnUpImage forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}

- (UIButton *)setupButtonWithTitle:(NSString *)btnTitle buttonIndex:(NSInteger)btnIndex {
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat h = self.frame.size.height;
    CGFloat x = btnIndex * w;
    CGFloat y = 0;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(x, y, w, h);
    [button setTitle:btnTitle forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setImage:kBtnDefaultImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    [self setupButtonImagePosition:button];
    return button;
}

- (void)setupButtonImagePosition:(UIButton *)button {
    [button setImagePositionWithType:SSImagePositionTypeRight spacing:5];
}

@end
