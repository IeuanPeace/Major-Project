//
//  ForcastViewController.h
//  RiverApp
//
//  Created by Ieuan Peace on 21/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForcastViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *forcastLabel;
@property (strong, nonatomic) NSString *forecast;
@property (strong, nonatomic) IBOutlet UILabel *currentForcastLabel;
- (IBAction)forecastioButton:(id)sender;

@end
