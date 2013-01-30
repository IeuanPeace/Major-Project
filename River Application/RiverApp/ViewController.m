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


@implementation ViewController


@synthesize riverName;
@synthesize sectionName;
@synthesize grade;
@synthesize decription;
@synthesize rivers;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  /*  MyRiverList * myrivers =[[MyRiverList alloc] init];
    self.rivers = [myrivers getMyRivers];
    [self.riverName setText:((RiverList *) [self.rivers objectAtIndex:0]).River];
    [self.sectionName setText:((RiverList *) [self.rivers objectAtIndex:0]).Section];
    [self.grade setText:((RiverList *) [self.rivers objectAtIndex:0]).Grade];
    [self.decription setText:((RiverList *) [self.rivers objectAtIndex:0]).Description];
    [super viewDidLoad];
   */
    [super viewDidLoad];
   
   
    
}

- (void)viewDidUnload
{
    
    [self setRiverName:nil];
    [self setSectionName:nil];
    [self setDecription:nil];
    [self setGrade:nil];
    [super viewDidUnload];
}





- (IBAction)GetRiverListing:(id)sender {
    static NSInteger currentIndex = 0;
    if (++currentIndex == [self.rivers count]) {
        currentIndex=0;
        
    }else{
        RiverList *aRiver = (RiverList *) [self.rivers objectAtIndex: currentIndex];
        [self.riverName setText:aRiver.River];
        [self.sectionName setText:aRiver.Section];
        [self.grade setText:aRiver.Grade];
        [self.decription setText:aRiver.Description];
    }
}

@end