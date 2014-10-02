//
//  main.m
//  Callbacks
//
//  Created by Anthony Dagati on 10/1/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}

