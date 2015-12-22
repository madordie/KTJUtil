
//
//  UIGestureRecognizer+KTJUtil.m
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "UIGestureRecognizer+KTJUtil.h"
#import <objc/runtime.h>

@implementation UIGestureRecognizer (KTJUtil)

- (void)ktj_addActionCallBack:(void (^)(id))callBack {
    [self addTarget:self action:@selector(ktj_actionForGeset)];
    objc_setAssociatedObject(self, @selector(ktj_addActionCallBack:), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)ktj_actionForGeset {
    void(^completed)(id) = objc_getAssociatedObject(self, @selector(ktj_addActionCallBack:));
    if (completed) {
        completed(self);
    }
}
@end
