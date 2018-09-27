//
//  UINavigationController+Helper.m
//  FDTApp
//
//  Created by fdt on 2017/5/5.
//  Copyright © 2017年 HKFDT. All rights reserved.
//

#import "UINavigationController+Helper.h"
#import <objc/runtime.h>
@implementation UINavigationController (Helper)
+ (void)load {

    Class targetClass = [self class];
    SEL originSEL = @selector(interactivePopGestureRecognizer);
    SEL swizzleSEL = @selector(fdt_interactivePopGestureRecognizer);
    swizzleMethod(targetClass, originSEL, swizzleSEL);
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    IMP swizzledImp = method_getImplementation(swizzledMethod);
    char *swizzledTypes = (char *)method_getTypeEncoding(swizzledMethod);
    
    IMP originalImp = method_getImplementation(originalMethod);
    
    char *originalTypes = (char *)method_getTypeEncoding(originalMethod);
    BOOL success = class_addMethod(class, originalSelector, swizzledImp, swizzledTypes);
    if (success) {
        class_replaceMethod(class, swizzledSelector, originalImp, originalTypes);
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)fdt_interactivePopGestureRecognizer {
    NSLog(@"----------不能右滑退出了");
}

@end
