//
//  PThreadHandler.m
//  MuliThreadSummary
//
//  Created by yuqian on 2018/9/10.
//  Copyright © 2018年 UncleDrew. All rights reserved.
//

#import "PThreadHandler.h"
#import <pthread.h>


@implementation PThreadHandler

//主要api
//* thread_create() 创建一个线程
//* pthread_exit() 终止当前线程
//* pthread_cancel() 中断另外一个线程的运行
//* pthread_join() 阻塞当前的线程，直到另外一个线程运行结束
//* pthread_attr_init() 初始化线程的属性
//* pthread_attr_setdetachstate() 设置脱离状态的属性（决定这个线程在终止时是否可以被结合）
//* pthread_attr_getdetachstate() 获取脱离状态的属性
//* pthread_attr_destroy() 删除线程的属性
//* pthread_kill() 向线程发送一个信号

+ (void) newThreadByPThread {
    
    // 1. 创建线程: 定义一个pthread_t类型变量
    pthread_t thread;
    // 2. 开启线程: 执行任务
    pthread_create(&thread, NULL, run, NULL);
    // 3. 设置子线程的状态设置为 detached，该线程运行结束后会自动释放所有资源
    pthread_detach(thread);
}

void * run(void *param) // 新线程调用方法，里边为需要执行的任务
{
    NSLog(@"Created by pthread, current thread:%@", [NSThread currentThread]);
    
    return NULL;
}

@end
