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
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/805/pg805.txt"];
                
        NSURL *request = [NSURLRequest requestWithURL:url];
        
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
        
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}

