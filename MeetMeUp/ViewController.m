//
//  ViewController.m
//  MeetMeUp
//
//  Created by John Malloy on 1/20/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "ViewController.h"
#import "EventDetailViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    
    __weak IBOutlet UITableView *myTableView;
    NSDictionary * results;
 //   NSDictionary * venue;
    NSArray * webResults;
    
    
    __weak IBOutlet UITableView *eventTableView;
    

    
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad




{
    [super viewDidLoad];
    

    
    
    NSURL * url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=77a157d726e34548c5f4a6662112"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     
     {
         results  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
         webResults = results[@"results"];
         
    
         
         NSLog(@"We got something %@", webResults);
         [eventTableView reloadData];
     }];

    NSLog(@"Getting our data");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return webResults.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Events"];
    NSDictionary * localResults = [webResults objectAtIndex:indexPath.row];
  //  NSDictionary * localVenue = localResults[@"venue"];
    
    cell.textLabel.text = localResults [@"name"];
    cell.detailTextLabel.text = localResults[@"venue"][@"address_1"];
    
//    [localVenue valueForKey:@"address_1"];

    return cell;
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EventDetailViewController *viewController = segue.destinationViewController;
    NSIndexPath *indexPath = [myTableView indexPathForSelectedRow];
    viewController.detailViewName = webResults[indexPath.row];
    
    
}

@end
