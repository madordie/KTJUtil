//
//  UITableView+KTJUtil.m
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "UITableView+KTJUtil.h"
#import "NSObject+KTJUtil.h"

@implementation UITableView (KTJUtil)

- (id)ktj_cacheHeightCellForReuseIDFA:(NSString *)idfa {
    if (!idfa.length) {
        return nil;
    }
    NSString *cacheName = [@"ktj_cacheHeightCellForReuseIDFA:" stringByAppendingString:idfa];
    id cell = [self.ktj_cache objectForKey:cacheName];
    if (!cell) {
        cell = [self dequeueReusableCellWithIdentifier:idfa];
        if (cell) {
            [self.ktj_cache setObject:cell forKey:cacheName];
        }
    }
    return cell;
}

- (id)ktj_cacheHeightHeaderFooterForReuseIDFA:(NSString *)idfa {
    if (!idfa.length) {
        return nil;
    }
    NSString *cacheName = [@"ktj_cacheHeightHeaderFooterForReuseIDFA:" stringByAppendingString:idfa];
    id cell = [self.ktj_cache objectForKey:cacheName];
    if (!cell) {
        cell = [self dequeueReusableHeaderFooterViewWithIdentifier:idfa];
        if (cell) {
            [self.ktj_cache setObject:cell forKey:cacheName];
        }
    }
    return cell;
}

@end
