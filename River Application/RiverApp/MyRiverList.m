//
//  MyRiverList.m
//  RiverApp
//
//  Created by Ieuan Peace on 11/11/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//
#import "MyRiverList.h"
#import "RiverList.h"


@implementation MyRiverList

- (NSMutableArray *) getMyRivers{
    NSMutableArray *riverArray = [[NSMutableArray alloc] init];
    @try {
        
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"dbRivers.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        if(!success)
        {
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
        {
            NSLog(@"An error has occured.");
        }
        const char *sql = "SELECT id, River, Section, Grade, Description, GetOnLatitude, GetOnLongitude, GetOfLatitude, GetOfLongitud FROM ListOfRivers";
        sqlite3_stmt *sqlStatement;
        if(sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement");
        }
        while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
            RiverList *MyRiver = [[RiverList alloc]init];
            MyRiver.idriver = sqlite3_column_int(sqlStatement, 0);
            MyRiver.River = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
            MyRiver.Section = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
            MyRiver.Grade = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)];
            MyRiver.Description =       [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)];
            NSString *lat = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 5)];
            NSString *lon = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 6)];
     //       MyRiver.GetOnLatitude =  [NSNumber numberWithFloat:(float) sqlite3_column_double(sqlStatement, 9)];
            
            MyRiver.GetOnLatitude = [lat doubleValue];
            MyRiver.GetOnLongitude = [lon doubleValue];

            [riverArray addObject:MyRiver];
    //        NSLog(@"ID: %i", MyRiver.idriver);
            NSLog(@"lat: %f", MyRiver.GetOnLatitude);

        }
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return riverArray;
    }
}



@end
