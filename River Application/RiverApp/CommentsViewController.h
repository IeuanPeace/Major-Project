//
//  CommentsViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 25/02/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "RiverList.h"

@interface CommentsViewController : UITableViewController

@property (nonatomic, strong) RiverList * myRiverListDetail;
@property (nonatomic) int theRiverID;

@end
