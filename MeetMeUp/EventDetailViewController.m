//
//  EventDetailViewController.m
//  MeetMeUp
//
//  Created by John Malloy on 1/20/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()
{
    __weak IBOutlet UILabel *rsvpLabel;
    __weak IBOutlet UITextView *eventDescriptionLabel;
    __weak IBOutlet UILabel *hostingLabel;
    __weak IBOutlet UILabel *eventUrlLabel;
}

@end

@implementation EventDetailViewController
@synthesize detailViewName;

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
    self.navigationItem.title = detailViewName[@"name"];

    rsvpLabel.text =[NSString stringWithFormat:@"%@", detailViewName[@"yes_rsvp_count"]];
    eventDescriptionLabel.text = detailViewName[@"description"];
    hostingLabel.text = detailViewName[@"group"][@"name"];
    eventUrlLabel.text = detailViewName[@"event_url"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
