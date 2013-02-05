//
//  ViewController.m
//  RiverApp
//
//  Created by Ieuan Peace on 11/11/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//


#import "ViewController.h"
#import "RiverList.h"
#import "MyRiverList.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define METERS_PER_MILE 1609.344

@implementation ViewController


@synthesize River;
@synthesize Section;
@synthesize Grade;
@synthesize Description;
@synthesize rivers;
@synthesize myRiverListDetail;
@synthesize mapView;
@synthesize GetOnLatitude;
@synthesize GetOnLongitude;

/*- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    MyRiverList * myrivers =[[MyRiverList alloc] init];
    self.rivers = [myrivers getMyRivers];
    [self.River setText:((RiverList *) [self.rivers objectAtIndex:0]).River];
    [self.Section setText:((RiverList *) [self.rivers objectAtIndex:0]).Section];
    [self.Grade setText:((RiverList *) [self.rivers objectAtIndex:0]).Grade];
    [self.Description setText:((RiverList *) [self.rivers objectAtIndex:0]).Description];
    [super viewDidLoad];

   
 
}*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    myRiverListDetail = (RiverList *)[self myRiverListDetail];
    self.River.text =  myRiverListDetail.River;
    self.Section.text = myRiverListDetail.Section;
    self.Grade.text = myRiverListDetail.Grade;
    self.Description.text = myRiverListDetail.Description;
    self.GetOnLatitude = myRiverListDetail.GetOnLatitude;
    self.GetOnLongitude = myRiverListDetail.GetOnLongitude;
    self.mapView.delegate = self;
    
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Add an annotation
    
    CLLocationCoordinate2D myPlaceCoord ={.latitude = myRiverListDetail.GetOnLatitude, .longitude = myRiverListDetail.GetOnLongitude};
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(myPlaceCoord, 3000, 3000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = myPlaceCoord;
    point.title = myRiverListDetail.River;
    point.subtitle = myRiverListDetail.Description;
    
    [self.mapView addAnnotation:point];
}


- (void)viewDidUnload
{
    [self setRiver:nil];
    [self setSection:nil];
    [self setDescription:nil];
    [self setGrade:nil];
    //[self setGetOnLatitude:(double)];
    //[self setGetOnLongitude:(double)];
    [super viewDidUnload];
}


/*- (IBAction)GetRiverListing:(id)sender {
    static NSInteger currentIndex = 0;
    if (++currentIndex == [self.rivers count]) {
        currentIndex=0;
        
    }else{
        RiverList *aRiver = (RiverList *) [self.rivers objectAtIndex: currentIndex];
        [self.River setText:aRiver.River];
        [self.Section setText:aRiver.Section];
        [self.Grade setText:aRiver.Grade];
        [self.Description setText:aRiver.Description];
    }
}*/


@end