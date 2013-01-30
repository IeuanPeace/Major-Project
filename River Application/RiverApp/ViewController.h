//
//  ViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 11/11/2012.
//  Copyright (c) 2012 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController{
    NSMutableArray *rivers;
}


@property (nonatomic, retain) NSMutableArray *rivers;
@property (weak, nonatomic) IBOutlet UILabel *riverName;
@property (weak, nonatomic) IBOutlet UILabel *sectionName;
@property (weak, nonatomic) IBOutlet UILabel *grade;
@property (weak, nonatomic) IBOutlet UILabel *decription;

-(IBAction)GetRiverListing:(id)sender;

@end
