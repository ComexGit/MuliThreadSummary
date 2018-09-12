//
//  NSOperationHandler.h
//  MuliThreadSummary
//
//  Created by yuqian on 2018/9/12.
//  Copyright © 2018年 UncleDrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationHandler : NSOperation

+ (void)useInvocationOperation;
+ (void)useBlockOperation;
+ (void)useBlockOperationAddExecutionBlock;
+ (void)addOperationToQueue;
+ (void)addOperationWithBlockToQueue;
+ (void)setMaxConcurrentOperationCount;
+ (void)addDependency;

@end
