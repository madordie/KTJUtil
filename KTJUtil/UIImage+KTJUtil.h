//
//  UIImage+KTJUtil.h
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KTJUtil)

/**
 *  按倍率缩放
 *
 *  @param scale 倍率
 *
 *  @return 新的图片
 */
- (UIImage *)ktj_imageToScale:(CGFloat)scale;

/**
 *  图片方向纠正。相机方向不确定->照片方向不确定->显示不正常---这个方法-->正常了
 *
 *  @return 新的图
 */
- (UIImage *)ktj_imageFixOrientation;

/**
 *  提前缓存data.   解决批量处理图片获取图片造成的内存暴涨问题
 */
- (NSData *)ktj_needData;
- (void)ktj_cleanData;

@end
