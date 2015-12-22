//
//  UIControl+KTJUtil.h
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (KTJUtil)

/**
 *  add block. 重用覆盖！重用覆盖！重用覆盖！
 *
 *  @param event     UIControlEvents
 *  @param callBack callBack
 */
- (void)ktj_addEvent:(UIControlEvents)event callBack:(void(^)(id sender))callBack;
/**
 *  删除回调
 */
- (void)ktj_removeCallBack;

@end
