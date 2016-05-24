//
//  ViewController.m
//  Class
//
//  Created by majunliang on 16/5/20.
//  Copyright © 2016年 majunliang. All rights reserved.
//
#import "ViewController.h"
#import <objc/runtime.h>
void TestMetaClass(id self, SEL _cmd)
{
    //    Class A = [self class];
    //    NSLog(@"UIViewController  isa obj:%p class:%p metaClass:%p\n\n", [str valueForKey:@"isa"], objc_getClass((__bridge void *)[UIViewController
    //    class]), objc_getClass((__bridge void
    //    *)objc_getMetaClass("UIViewController")));
    NSLog(@"TestClass is obj:%p class:%p metaClass:%p", self, [self class], objc_getMetaClass("TestClass"));
    Class currentClass = [self class];
    for (int i = 0; i < 4; i++) {
        NSLog(@"Following the isa pointer %d times gives %p", i, currentClass);
        currentClass = objc_getClass((__bridge void *)currentClass);
    }
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p", objc_getClass((__bridge void *)[NSObject class]));
}
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self ex_registerClassPair];
}
- (void)ex_registerClassPair
{
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)TestMetaClass, "v@:");
    objc_registerClassPair(newClass);
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
    Class A = [self class];
    [A alloc];
    UIViewController *obj0 = [UIViewController new];
    //    id obj1 = [obj0 class];
    id obj1 = objc_getClass("UIViewController");
    id obj2 = objc_getMetaClass("UIViewController");
    NSLog(@"UIViewController obj'isa:%p UIViewController'isa:%p UIViewControllerMetaClass'isa:%p", [obj0 valueForKey:@"isa"],
          [obj1 valueForKey:@"isa"], [obj2 valueForKey:@"isa"]);
    NSLog(@"UIViewController obj:%p class:%p metaClass:%p", obj0, [UIViewController class], objc_getMetaClass(class_getName([UIViewController class])));
    // class内存: 这种内存 ,系统存在对应对象类型,包含对象的内存的分配信息,结构体类型class
    // objcet内存: 这种内存, 系统不存在对象分配信息,类似上面的结构体分布,继承就是结构体的潜逃
    //其他的,如Ivar,,
    //结构体的继承,NSObject类型的结构体, ViewController继承它,仅仅是里面多了一个名字为结构体名字的的变量
    /*
     struct NSObject
     {
     Class isa;
     };
     struct UIViewController
     {
     struct NSObject1 NSObject;
     };
     */
    //    UIViewController *vc = [UIViewController new];
    //    struct ViewController1 *v = malloc(sizeof(struct ViewController1));

    id s = [UIVisualEffectView class];
    id sb = [s new];     // s对象的类型是,元类,只有加方法, 这样调用就崩溃了

    NSObject *obj;
    struct NSObject1 *objxx;
    Person *vc = [Person new];
    struct ViewController1 *vc1;
    id testObj = [NSString new];
    NSLog(@"%p  %@", testObj, testObj);
    for (int i = 0; i < 10; i++) {
        testObj = [testObj valueForKey:@"isa"];
        NSLog(@"%p  %@", testObj, testObj);
    }
    class_createInstance(NSString.class, sizeof(unsigned));
}
@end
