//
//  MyRiverList.h
//  RiverApp
//
//  Created by Ieuan Peace on 11/11/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface MyRiverList : NSObject{
    sqlite3 *db;
}

@property (strong, nonatomic)NSMutableArray * getMyRivers;
- (NSMutableArray *) getMyRivers;



@end
