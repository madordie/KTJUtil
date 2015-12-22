//
//  UIControl+KTJUtil.m
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "UIControl+KTJUtil.h"
#import <objc/runtime.h>

@implementation UIControl (KTJUtil)

- (void)ktj_addEvent:(UIControlEvents)event callBack:(void (^)(id))callBack {
    [self addTarget:self action:@selector(ktj_actionForGeset) forControlEvents:event];
    objc_setAssociatedObject(self, @selector(ktj_addEvent:callBack:), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)ktj_actionForGeset {
    void(^completed)(id) = objc_getAssociatedObject(self, @selector(ktj_addEvent:callBack:));
    if (completed) {
        completed(self);
    }
}
- (void)ktj_removeCallBack{
    objc_setAssociatedObject(self, @selector(ktj_addEvent:callBack:), nil, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
