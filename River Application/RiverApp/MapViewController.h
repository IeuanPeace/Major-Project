//
//  MapViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 28/03/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "RiverList.h"
#import "MyRiverList.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>{
    
    NSMutableArray *rivers;
}


@property (nonatomic, strong) MyRiverList * ops;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) NSMutableArray *rivers;

@property (weak, nonatomic) NSString *riverName;
@property (weak, nonatomic) NSString *sectionName;
@property (weak, nonatomic) NSString *grade;
@property (nonatomic) double getOnLatitude;
@property (nonatomic) double getOnLongitude;
@property CLLocationCoordinate2D coords;


@end
