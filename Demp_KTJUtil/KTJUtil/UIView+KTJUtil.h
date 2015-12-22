//
//  UIView+KTJUtil.h
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KTJUtil)
/**
 *  把该View制作成图片。截图
 *
 *  @param rect 截图范围
 *
 *  @return 生成的图片
 */
- (UIImage *)ktj_makeImageFromRect:(CGRect)rect;

@end
