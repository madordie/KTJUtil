
//
//  UIImage+KTJUtil.m
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "UIImage+KTJUtil.h"
#import <objc/runtime.h>

@implementation UIImage (KTJUtil)

- (UIImage *)ktj_imageToScale:(CGFloat)scale {
    if (scale == 1) {
        return self;
    }
    @autoreleasepool {
        UIImage *image = self;
        UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scale,image.size.height*scale));
        [image drawInRect:CGRectMake(0, 0, image.size.width * scale, image.size.height *scale)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    }
}

- (UIImage *)ktj_imageFixOrientation {
    if (self.imageOrientation == UIImageOrientationUp) {
        return self;
    }
    
    @autoreleasepool {
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        UIImageOrientation io = self.imageOrientation;
        //    UIImageOrientation io = orention ;
        if (io == UIImageOrientationDown || io == UIImageOrientationDownMirrored) {
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            
            
        }
        if (io == UIImageOrientationLeft || io == UIImageOrientationLeftMirrored) {
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
        }
        if (io == UIImageOrientationRight || io == UIImageOrientationRightMirrored) {
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            
            
        }
        
        if (io == UIImageOrientationUpMirrored || io == UIImageOrientationDownMirrored) {
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
        }
        if (io == UIImageOrientationLeftMirrored || io == UIImageOrientationRightMirrored) {
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform,  -1, 1);
            
        }
        
        CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                                 CGImageGetBitsPerComponent(self.CGImage), 0,
                                                 CGImageGetColorSpace(self.CGImage),
                                                 CGImageGetBitmapInfo(self.CGImage));
        CGContextConcatCTM(ctx, transform);
        
        if (io == UIImageOrientationLeft || io == UIImageOrientationLeftMirrored || io == UIImageOrientationRight || io == UIImageOrientationRightMirrored) {
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
        }else{
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
        }
        
        CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
        UIImage *img = [UIImage imageWithCGImage:cgimg];
        CGContextRelease(ctx);
        CGImageRelease(cgimg);
        return img;
    }
}

- (NSData *)ktj_needData {
    NSData *data = objc_getAssociatedObject(self, @selector(ktj_needData));
    if (!data) {
        data = UIImageJPEGRepresentation(self, 0.5);
        objc_setAssociatedObject(self, @selector(ktj_needData), data, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return data;
}
- (void)ktj_cleanData {
    objc_setAssociatedObject(self, @selector(ktj_needData), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
