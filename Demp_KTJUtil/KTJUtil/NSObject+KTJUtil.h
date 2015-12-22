//
//  NSObject+KTJUtil.h
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KTJUtil)

/**
 *  对象自带缓存
 */
@property (nonatomic, strong) NSCache *ktj_cache;

@end
