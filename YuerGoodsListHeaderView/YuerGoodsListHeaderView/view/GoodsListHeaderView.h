//
//  GoodsListHeaderView.h
//  YuerGoodsListHeaderView
//
//  Created by XiangTaiMini on 2017/5/22.
//  Copyright © 2017年 yuer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , BtnStateType) {
    ButtonStateTypeDefault = 0,
    ButtonStateTypeUp,
    ButtonStateTypeDown
};

@interface GoodsListHeaderView : UIView

@property (nonatomic , assign) BtnStateType btnStateType;

@end
