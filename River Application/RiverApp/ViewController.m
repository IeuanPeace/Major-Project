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
@synthesize levelsLabel;


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
    
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        NSData* kivaData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"http://users.aber.ac.uk/itp9/riverlevels/riverlevelsfile.json"]
                            ];
        //3
        NSDictionary* json = nil;
        if (kivaData) {
            json = [NSJSONSerialization
                    JSONObjectWithData:kivaData
                    options:kNilOptions
                    error:nil];
        }
        
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [self updateUIWithDictionary: json];
        });
        
    });
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


-(void)updateUIWithDictionary:(NSDictionary*)json {
    myRiverListDetail = (RiverList *)[self myRiverListDetail];
    if ([myRiverListDetail.River isEqualToString:(@"Dwyfor")]) {
    
    @try{
        levelsLabel.text = [NSString stringWithFormat:
                      @"%@ \n",
                    //  json[@"id"],
                      json[@"riverlevels"][0][@"river level"],
                      nil];
    }
    @catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Could not parse the JSON feed."
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
        NSLog(@"Exception: %@", exception);
    }
    }
}


- (void)viewDidUnload
{
    [self setRiver:nil];
    [self setSection:nil];
    [self setDescription:nil];
    [self setGrade:nil];
    [super viewDidUnload];
}




@end