//
//  RiverList.h
//  RiverApp
//
//  Created by Ieuan Peace on 11/11/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RiverList : NSObject{
    NSString *River;
    NSInteger idriver;
    NSString *Section;
    NSString *Grade;
    NSString *Description;
}

@property (nonatomic, retain) NSString *River;
@property (nonatomic, assign) NSInteger idriver;
@property (nonatomic, retain) NSString *Section;
@property (nonatomic, retain) NSString *Grade;
@property (nonatomic, retain) NSString *Description;

@end
