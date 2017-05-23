//
//  GoodsListHeaderView.m
//  YuerGoodsListHeaderView
//
//  Created by XiangTaiMini on 2017/5/22.
//  Copyright © 2017年 yuer. All rights reserved.
//

#import "GoodsListHeaderView.h"
#import "UIButton+SSEdgeInsets.h"

#define kBtnDefaultImage [UIImage imageNamed:@"goodlist_default_icon"]
#define kBtnUpImage [UIImage imageNamed:@"goodlist_select_up_icon"]
#define kBtnDownImage [UIImage imageNamed:@"goodlist_select_down_icon"]

@interface GoodsListHeaderView ()

@property (nonatomic , weak)   UIButton * shelfTimeBtn;    // 上架时间
@property (nonatomic , weak)   UIButton * priceBtn;        // 价格
@property (nonatomic , weak)   UIButton * currentSelectedBtn; // 当前选中的按钮

@end
@implementation GoodsListHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

//  创建视图
- (void)setupViews {
    
    self.shelfTimeBtn = [self setupButtonWithTitle:@"上架时间" buttonIndex:0 withBtnDafaultTag:ButtonStateTypeUp];
    self.priceBtn = [self setupButtonWithTitle:@"价格" buttonIndex:1 withBtnDafaultTag:ButtonStateTypeDefault];
    
    // 设置当前选中按钮的状态
    self.currentSelectedBtn = self.shelfTimeBtn;
    self.shelfTimeBtn.selected = YES;
    [self setbuttonState:self.shelfTimeBtn];
    [self setbuttonState:self.priceBtn];
}

// 设置按钮的状态（图片和文字）
- (void)setbuttonState:(UIButton *)button {
    
    self.btnStateType = button.tag;
    
    if (button.selected) { // 选中状态
        if (self.btnStateType == ButtonStateTypeUp) {
            [button setImage:kBtnUpImage forState:UIControlStateNormal];
        } else {
            [button setImage:kBtnDownImage forState:UIControlStateNormal];
        }
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    } else {
        [button setImage:kBtnDefaultImage forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
}
// 按钮的点击事件
- (void)buttonClick:(UIButton *)button {
    
    // 先判断是否选中的是同一个按钮
    // 同一个按钮 改变朝向
    if (self.currentSelectedBtn == button) {
        
        if (button.tag == ButtonStateTypeUp) {
            button.tag = ButtonStateTypeDown;
        } else {
            button.tag = ButtonStateTypeUp;
        }
        [self setbuttonState:button];
    } else { // 不是同一个
        self.currentSelectedBtn.selected = NO; // 把原来的设为非选中状态
        [self setbuttonState:self.currentSelectedBtn]; // 重新设置按钮的状态
        
        self.currentSelectedBtn = button;  // 设置新点击的按钮为当前按钮
        button.selected = YES; // 新的当前按钮为选中状态
        
        if (button.tag == ButtonStateTypeDefault) { // 点击新按钮第一次默认朝上
            button.tag = ButtonStateTypeUp;
        }
        [self setbuttonState:button]; //设置新点击按钮的状态
    }
}

- (UIButton *)setupButtonWithTitle:(NSString *)btnTitle buttonIndex:(NSInteger)btnIndex withBtnDafaultTag:(NSInteger) btnDefaultTag {
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat h = self.frame.size.height;
    CGFloat x = btnIndex * w;
    CGFloat y = 0;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(x, y, w, h);
    button.tag = btnDefaultTag;
    [button setTitle:btnTitle forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    [self setupButtonImagePosition:button];
    return button;
}

- (void)setupButtonImagePosition:(UIButton *)button {
    [button setImagePositionWithType:SSImagePositionTypeRight spacing:5];
}

@end
