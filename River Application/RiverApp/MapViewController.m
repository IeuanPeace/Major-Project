//
//  MapViewController.m
//  RiverApp
//
//  Created by Ieuan Peace on 28/03/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import "MapViewController.h"
#import "RiverList.h"
#import "MyRiverList.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "RiverLocation.h"

#define METERS_PER_MILE 1609.344

@implementation MapViewController

@synthesize riverName;
@synthesize sectionName;
@synthesize grade;
@synthesize rivers;
//@synthesize mapView;
@synthesize getOnLatitude;
@synthesize getOnLongitude;
@synthesize ops;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)refreshTapped:(id)sender {
  
 //   MKCoordinateRegion mapRegion = [_mapView region];

    
    MyRiverList * myrivers =[[MyRiverList alloc] init];
    self.rivers = [myrivers getMyRivers];
    self.riverName = ((RiverList *) [self.rivers objectAtIndex:0]).River;
    self.grade = ((RiverList *) [self.rivers objectAtIndex:0]).Grade;
    self.getOnLatitude = ((RiverList *) [self.rivers objectAtIndex:0]).GetOnLatitude;
    self.getOnLongitude = ((RiverList *) [self.rivers objectAtIndex:0]).GetOnLongitude;
    
   }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MyRiverList * myrivers =[[MyRiverList alloc] init];
    self.rivers = [myrivers getMyRivers];
    self.riverName = ((RiverList *) [self.rivers objectAtIndex:0]).River;
    self.grade = ((RiverList *) [self.rivers objectAtIndex:0]).Grade;
    self.getOnLatitude = ((RiverList *) [self.rivers objectAtIndex:0]).GetOnLatitude;
    self.getOnLongitude = ((RiverList *) [self.rivers objectAtIndex:0]).GetOnLongitude;
   // self.mapView.delegate = self;
    [self plotRivers:rivers riverAtIndex:0];
    
  
}

/*- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation indexPath:(NSIndexPath *) indexPath
{
    
    RiverList *aRiver = [self.rivers objectAtIndex:indexPath.row];
        //Creatate annotation
    CLLocationCoordinate2D myPlaceCoord = {.latitude = aRiver.GetOnLatitude, .longitude = aRiver.GetOnLongitude};
    
    //Add annotation
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(myPlaceCoord, 3000, 3000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = myPlaceCoord;
    point.title = aRiver.River;
    point.subtitle = aRiver.Grade;
    
    [self.mapView addAnnotation:point];
    
//    RiverList * riverListObj = [ops.getMyRivers objectAtIndex:indexPath.row];
  //  cell.textLabel.text = riverListObj.River;
    
}*/

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"RiverLocation";
    
    if ([annotation isKindOfClass:[RiverLocation class]]) {
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}


- (void)plotRivers:(NSMutableArray *)responseData riverAtIndex:(NSIndexPath *)indexPath
{
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    
    NSMutableArray * locations = [[NSMutableArray alloc] init];
    NSInteger i = 0;
    RiverList *aRiver = [self.rivers objectAtIndex:0];
   
    for (aRiver in self.rivers) {

        CLLocationCoordinate2D location;
        RiverList *aRiver = [self.rivers objectAtIndex:i];

        location.latitude =  aRiver.GetOnLatitude;
        location.longitude = aRiver.GetOnLongitude;
        RiverLocation *annotation = [[RiverLocation alloc] initWithName:aRiver.River grade:aRiver.Grade coordinate:location];
        [locations addObject:annotation];

        i=i+1;

        
    }
        [_mapView addAnnotations:locations];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
