//
//  NSString+KTJUtil.h
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (KTJUtil)

/**
 *  计算本字符串的高度。
 *
 *  @param width 限制的宽度
 *  @param font  设置的字体
 *
 *  @return 字符串实际所占的高度
 */
- (CGFloat)ktj_stringHeightWithWidth:(CGFloat)width font:(UIFont *)font;

@end
