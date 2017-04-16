//
//  UIViewController+YHPExtension.m
//  15-Runtime_MethodSwizzle
//
//  Created by yhp on 2017/4/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

#import "UIViewController+YHPExtension.h"
#import <objc/runtime.h>
@implementation UIViewController (YHPExtension)

+(void)load
{
    Method method1 = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
    Method method2 = class_getInstanceMethod(self, @selector(yhp_dealloc));
    method_exchangeImplementations(method1, method2);

}

-(void)yhp_dealloc
{
    NSLog(@"%s",__func__);
    [self yhp_dealloc];
}

@end
