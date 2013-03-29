//
//  RiverLocation.m
//  RiverApp
//
//  Created by Ieuan Peace on 28/03/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import "RiverLocation.h"

@interface RiverLocation()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;

@end

@implementation RiverLocation

- (id)initWithName:(NSString*)name grade:(NSString*)grade coordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        if ([name isKindOfClass:[NSString class]]) {
            self.name = name;
            self.grade = grade;
        } else {
            self.name = @"Unknown charge";
        }
      //  self.grade = grade;
        self.theCoordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    return _name;
}

- (NSString *)subtitle {
    return _grade;
}

- (CLLocationCoordinate2D)coordinate {
    return _theCoordinate;
}

- (MKMapItem*)mapItem {
    
    MKPlacemark *placemark = [[MKPlacemark alloc]
                              initWithCoordinate:self.coordinate
                              addressDictionary:nil];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.title;
    
    return mapItem;
}

@end
