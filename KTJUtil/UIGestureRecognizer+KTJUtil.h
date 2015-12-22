//
//  UIGestureRecognizer+KTJUtil.h
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (KTJUtil)
/**
 *  add block.
 *
 *  @param callBack callBack
 */
- (void)ktj_addActionCallBack:(void(^)(id gesture))callBack;
@end
