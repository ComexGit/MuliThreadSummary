//
//  GCDHandler.h
//  MuliThreadSummary
//
//  Created by yuqian on 2018/9/10.
//  Copyright © 2018年 UncleDrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDHandler : NSObject

+ (void)syncConcurrent;
+ (void)asyncConcurrent;
+ (void)syncSerial;
+ (void)asyncSerial;
+ (void)syncMain;
+ (void)asyncMain;
+ (void)barrier;
+ (void)after;
+ (void)once;
+ (void)apply;
+ (void)groupNotify;
+ (void)groupWait;
+ (void)groupEnterAndLeave;
+ (void)semaphoreSync;

@end
