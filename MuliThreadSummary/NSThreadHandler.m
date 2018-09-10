//
//  NSThreadHandler.m
//  MuliThreadSummary
//
//  Created by UncleDrew on 2018/9/9.
//  Copyright © 2018年 UncleDrew. All rights reserved.
//

#import "NSThreadHandler.h"

@implementation NSThreadHandler


- (void) newThreadByNSThread {
    
    /** 方法一，需要start */
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(doSomething1:) object:@"NSThread1"];
    // 线程加入线程池等待CPU调度，时间很快，几乎是立刻执行
    [thread1 start];
    
    /** 方法二，创建好之后自动启动 */
    [NSThread detachNewThreadSelector:@selector(doSomething2:) toTarget:self withObject:@"NSThread2"];
    
    /** 方法三，隐式创建，直接启动 */
    [self performSelectorInBackground:@selector(doSomething3:) withObject:@"NSThread3"];
}

- (void)doSomething1:(NSObject *)object {
    // 传递过来的参数
    NSLog(@"%@",object);
    NSLog(@"Created by NSThread, doSomething1：%@",[NSThread currentThread]);
}

- (void)doSomething2:(NSObject *)object {
    NSLog(@"%@",object);
    NSLog(@"Created by NSThread, doSomething2：%@",[NSThread currentThread]);
}

- (void)doSomething3:(NSObject *)object {
    NSLog(@"%@",object);
    NSLog(@"Created by NSThread, doSomething3：%@",[NSThread currentThread]);
}

//主要api
// 获得主线程
//+ (NSThread *)mainThread;

// 判断是否为主线程(对象方法)
//- (BOOL)isMainThread;

// 判断是否为主线程(类方法)
//+ (BOOL)isMainThread;

// 获得当前线程
//NSThread *current = [NSThread currentThread];

// 线程的名字——setter方法
//- (void)setName:(NSString *)n;

// 线程的名字——getter方法
//- (NSString *)name;

// 在主线程上执行操作
//- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;
//- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray<NSString *> *)array;
// equivalent to the first method with kCFRunLoopCommonModes

// 在指定线程上执行操作
//- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array NS_AVAILABLE(10_5, 2_0);
//- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait NS_AVAILABLE(10_5, 2_0);

// 在当前线程上执行操作，调用 NSObject 的 performSelector:相关方法
//- (id)performSelector:(SEL)aSelector;
//- (id)performSelector:(SEL)aSelector withObject:(id)object;
//- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;

// 线程进入就绪状态 -> 运行状态。当线程任务执行完毕，自动进入死亡状态
//- (void)start;

// 线程进入阻塞状态
//+ (void)sleepUntilDate:(NSDate *)date;
//+ (void)sleepForTimeInterval:(NSTimeInterval)ti;

// 线程进入死亡状态
//+ (void)exit;

//+ (double)threadPriority;
//+ (BOOL)setThreadPriority:(double)p;
//The priorities in this range are mapped to the operating system's priority values. A “typical” thread priority might be 0.5, but because the priority is determined by the kernel, there is no guarantee what this value actually will be.
//Returns
//The current thread’s priority, which is specified by a floating point number from 0.0 to 1.0, where 1.0 is highest priority.


//iOS 开发中能遇到两个线程对象: pthread_t 和 NSThread。过去苹果有份文档标明了 NSThread 只是 pthread_t 的封装，但那份文档已经失效了，现在它们也有可能都是直接包装自最底层的 mach thread。苹果并没有提供这两个对象相互转换的接口，但不管怎么样，可以肯定的是 pthread_t 和 NSThread 是一一对应的。比如，你可以通过 pthread_main_np() 或 [NSThread mainThread] 来获取主线程；也可以通过 pthread_self() 或 [NSThread currentThread] 来获取当前线程。CFRunLoop 是基于 pthread 来管理的

@end
