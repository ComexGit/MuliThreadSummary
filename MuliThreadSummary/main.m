//
//  main.m
//  MuliThreadSummary
//
//  Created by UncleDrew on 2018/9/9.
//  Copyright © 2018年 UncleDrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PThreadHandler.h"
#import "NSThreadHandler.h"
#import "GCDHandler.h"
#import "NSOperationHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
//        [PThreadHandler newThreadByPThread];
        
//        [[NSThreadHandler alloc]newThreadByNSThread];
        
//        [GCDHandler asyncMain];
//        [GCDHandler asyncSerial];
//        [GCDHandler asyncConcurrent];
//        [GCDHandler syncMain];
//        [GCDHandler syncSerial];
//        [GCDHandler syncConcurrent];
//        [GCDHandler groupWait];
//        [GCDHandler groupNotify];
        [NSOperationHandler setMaxConcurrentOperationCount];
        
        
        while (1);
    }
    return 0;
}


