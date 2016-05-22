

#import <Foundation/Foundation.h>
//-----------------------------------------------------------
// MyClass.h
@interface MyClass : NSObject <NSCopying, NSCoding>
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *string;
- (void)method1;
- (void)method2;
+ (void)classMethod1;
@end
//-----------------------------------------------------------
// MyClass.m

@interface MyClass () {
    NSInteger _instance1;
    NSString *_instance2;
}
@property (nonatomic, assign) NSUInteger integer;
- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2;
@end
@implementation MyClass
+ (void)classMethod1
{
}
- (void)method1
{
    NSLog(@"call method method1");
}
- (void)method2
{
}
- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2
{
    NSLog(@"arg1 : %ld, arg2 : %@", arg1, arg2);
}
@end
//-----------------------------------------------------------
// main.h
#import <objc/runtime.h>
int main(int argc, const char *argv[])
{
    @autoreleasepool {
        MyClass *myClass = [[MyClass alloc] init];
        unsigned int outCount = 0;
        Class cls = myClass.class;
        id ojb =cls;
        // 类名
        NSLog(@"class name: %s", class_getName(cls));
        NSLog(@"==========================================================");
        // 父类
        NSLog(@"super class name: %s", class_getName(class_getSuperclass(cls)));
        NSLog(@"==========================================================");
        // 是否是元类
        NSLog(@"MyClass is %@ a meta-class", (class_isMetaClass(cls) ? @"" : @"not"));
        NSLog(@"==========================================================");
        Class meta_class = objc_getMetaClass(class_getName(cls));
        id obj = meta_class;
        NSLog(@"%s's meta-class is %s", class_getName(cls), class_getName(meta_class));
        NSLog(@"==========================================================");
        // 变量实例大小
        NSLog(@"instance size: %zu", class_getInstanceSize(cls));
        NSLog(@"==========================================================");
        // 成员变量
        Ivar *ivars = class_copyIvarList(cls, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSLog(@"instance variable's name: %s at index: %d", ivar_getName(ivar), i);
        }
        free(ivars);
        Ivar string = class_getInstanceVariable(cls, "_string");
        if (string != NULL) {
            NSLog(@"instace variable %s", ivar_getName(string));
        }
        NSLog(@"==========================================================");
        // 属性操作
        objc_property_t *properties = class_copyPropertyList(cls, &outCount);
        for (int i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSLog(@"property's name: %s", property_getName(property));
        }
        free(properties);
        objc_property_t array = class_getProperty(cls, "array");
        if (array != NULL) {
            NSLog(@"property %s", property_getName(array));
        }
        NSLog(@"==========================================================");
        // 方法操作
        Method *methods = class_copyMethodList(cls, &outCount);
        for (int i = 0; i < outCount; i++) {
            Method method = methods[i];
            NSLog(@"method's signature: %s", method_getName(method));
        }
        free(methods);
        Method method1 = class_getInstanceMethod(cls, @selector(method1));
        if (method1 != NULL) {
            NSLog(@"method %s", method_getName(method1));
        }
        Method classMethod = class_getClassMethod(cls, @selector(classMethod1));
        if (classMethod != NULL) {
            NSLog(@"class method : %s", method_getName(classMethod));
        }
        NSLog(@"MyClass is%@ responsd to selector: method3WithArg1:arg2:", class_respondsToSelector(cls, @selector(method3WithArg1:arg2:)) ? @"" : @" not");
        IMP imp = class_getMethodImplementation(cls, @selector(method1));
        imp();
        NSLog(@"==========================================================");
        // 协议
        Protocol *__unsafe_unretained *protocols = class_copyProtocolList(cls, &outCount);
        Protocol *protocol;
        for (int i = 0; i < outCount; i++) {
            protocol = protocols[i];
            NSLog(@"protocol name: %s", protocol_getName(protocol));
        }
        NSLog(@"MyClass is%@ responsed to protocol %s", class_conformsToProtocol(cls, protocol) ? @"" : @" not", protocol_getName(protocol));
        NSLog(@"==========================================================");
        
        BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
        BOOL class_isMetaClass(Class cls)
        BOOL class_respondsToSelector(Class cls, SEL sel)
        Class class_getSuperclass(Class cls)
        Class objc_getMetaClass(const char *name)
        IMP class_getMethodImplementation(Class cls, SEL name)
        Ivar *class_copyIvarList(Class cls, unsigned int *outCount)
        Ivar class_getInstanceVariable(Class cls, const char *name)
        Method *class_copyMethodList(Class cls, unsigned int *outCount)
        Method class_getClassMethod(Class cls, SEL name)
        Method class_getInstanceMethod(Class cls, SEL name)
        Protocol * __unsafe_unretained *class_copyProtocolList(Class cls, unsigned int *outCount)
        SEL method_getName(Method m)
        const char *class_getName(Class cls)
        const char *ivar_getName(Ivar v)
        const char *property_getName(objc_property_t property)
        const char *protocol_getName(Protocol *p)
        free(void *);
        objc_property_t *class_copyPropertyList(Class cls, unsigned int *outCount)
        objc_property_t class_getProperty(Class cls, const char *name)
        size_t class_getInstanceSize(Class cls)
    }
    return 0;
}