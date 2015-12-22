//
//  NSObject+KTJUtil.m
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "NSObject+KTJUtil.h"
#import <objc/runtime.h>

@implementation NSObject (KTJUtil)

- (NSCache *)ktj_cache {
    NSCache *cache = objc_getAssociatedObject(self, @selector(ktj_cache));
    if (!cache) {
        cache = [NSCache new];
        self.ktj_cache = cache;
    }
    return cache;
}
- (void)setKtj_cache:(NSCache *)ktj_cache {
    objc_setAssociatedObject(self, @selector(ktj_cache), ktj_cache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
