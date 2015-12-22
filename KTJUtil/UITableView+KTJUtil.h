//
//  UITableView+KTJUtil.h
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (KTJUtil)

/**
 *  cache: 缓存注册过的一个cell  缓存！ 缓存！ 缓存！
 *
 *  @param idfa 重用标识符
 *
 *  @return 注册的那个cell
 */
- (id)ktj_cacheHeightCellForReuseIDFA:(NSString *)idfa;

/**
 *  cache: 缓存注册过的一个HeaderFooter  缓存！ 缓存！ 缓存！
 *
 *  @param idfa 重用标识符
 *
 *  @return 注册的那个headerFooter
 */
- (id)ktj_cacheHeightHeaderFooterForReuseIDFA:(NSString *)idfa;


@end
