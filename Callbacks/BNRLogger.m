//
//  BNRLogger.m
//  Callbacks
//
//  Created by Anthony Dagati on 10/1/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

-(NSString *)lastTimeString {
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

-(void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    self.lastTime = now;
    NSLog(@"Just set the time to: %@", self.lastTimeString);
}

// Called each time a chunk of data arrives
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
 
    //Create a mutable data if it does not already exist
    if (!incomingData) {
        NSMutableData *incomingData = [[NSMutableData alloc] init];
    }
    [incomingData appendData:data];
    
}

// Called when the last chunk has been processed

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    
    incomingData = nil;
    NSLog(@"The string has %lu characters", [string length]);
    
    //Uncomment the next line to see the entire fetched file
    NSLog(@"The whole string is %@", string);
}

// Called if the fetch fails

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
    incomingData = nil;
}

-(void)zoneChange:(NSNotification *)note
{
    NSLog(@"The system time zone has changed.");
}
@end
