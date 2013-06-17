//
//  ForcastViewController.m
//  RiverApp
//
//  Created by Ieuan Peace on 21/04/2013.
//  Copyright (c) 2013 Ieuan Peace. All rights reserved.
//

#import "ForcastViewController.h"


@implementation ForcastViewController

@synthesize forcastLabel;
@synthesize currentForcastLabel;
@synthesize forecast;


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
	// Do any additional setup after loading the view.
    //This code came from http://www.touch-code-magazine.com/tutorial-fetch-and-parse-json-in-ios6/
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        NSData* kivaData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"https://api.forecast.io/forecast/369535e9fda0cce17ef2cbe00c7f2d9f/52.958506,-4.24289"]
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



                                                 
                                                 
-(void)updateUIWithDictionary:(NSDictionary*)json {

        @try{
            NSString *forcast;

            forcast = [NSString stringWithFormat:
                                @"%@ \n",
                                //  json[@"id"],
                                json[@"currently"][@"summary"],
                                nil];
            if ([forcast isEqualToString:@"Raining"]) {
                forcastLabel.text = @"The river will rise";
            }
            else{
                forcastLabel.text =  @"The river will not rise";
            }
            currentForcastLabel.text = forcast;
    
            
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Used code from http://stackoverflow.com/questions/6748473/ios-create-a-link-button

- (IBAction)forecastioButton:(id)sender {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.forecast.io/"]];
}
@end
