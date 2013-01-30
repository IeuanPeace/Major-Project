//
//  TableViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 21/12/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TableViewController : UITableViewController{
    
   NSMutableArray *rivers;
}


@property (nonatomic, retain) NSMutableArray *rivers;
@property (weak, nonatomic) IBOutlet UILabel *riverName;
@property (weak, nonatomic) IBOutlet UILabel *sectionName;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UILabel *decription;
-(IBAction)GetRiverListing:(id)sender;

@end
