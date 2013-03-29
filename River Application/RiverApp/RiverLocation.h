//
//  RiverLocation.h
//  RiverApp
//
//  Created by Ieuan Peace on 28/03/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface RiverLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name grade:(NSString*)grade coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end
