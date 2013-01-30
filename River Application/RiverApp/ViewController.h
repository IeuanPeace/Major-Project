//
//  ViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 11/11/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiverList.h"

@class RiverList;
@interface ViewController : UIViewController{
    NSMutableArray *rivers;
}

@property (nonatomic, strong) RiverList * myRiverListDetail;
@property (nonatomic, retain) NSMutableArray *rivers;
@property (weak, nonatomic) IBOutlet UILabel *River;
@property (weak, nonatomic) IBOutlet UILabel *Section;
@property (weak, nonatomic) IBOutlet UILabel *Grade;
@property (weak, nonatomic) IBOutlet UILabel *Description;

-(IBAction)GetRiverListing:(id)sender;

@end
