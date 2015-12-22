//
//  NSString+KTJUtil.m
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "NSString+KTJUtil.h"

@implementation NSString (KTJUtil)

- (CGFloat)ktj_stringHeightWithWidth:(CGFloat)width font:(UIFont *)font {
    font = font?:[UIFont systemFontOfSize:[UIFont systemFontSize]];
    CGSize size;
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        size = [self boundingRectWithSize:CGSizeMake(width, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:font}
                                  context:nil
                ].size;
    } else {
        //  狠的，iOS7以下直接用这个算。。
        static UILabel *label;
        label = label?:[UILabel new];
        label.font = font;
        label.frame = CGRectMake(0, 0, width, 0);
        label.text = self;
        [label sizeToFit];
        size = label.frame.size;
    }
    return size.height;
}

@end
