//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"


@interface TimelineViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *arrayOfTweets;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@end

@implementation TimelineViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(loadTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
    // Get timeline
    [self loadTweets];
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
     [self.tableView reloadData];

    [refreshControl endRefreshing];
}

- (void)loadTweets {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.arrayOfTweets = (NSMutableArray*)tweets;
            NSLog(@"%@", ((Tweet*)self.arrayOfTweets[0]).text);
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self beginRefresh:self.refreshControl];
    }];
}

- (IBAction)didTapLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfTweets.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    return [[UITableViewCell alloc] init];
    TweetCell *cell = [ tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    Tweet *thisTweet = self.arrayOfTweets[indexPath.row];
    cell.tweet = thisTweet;
    
    cell.displayName.text = thisTweet.user.name;
    cell.tweetInfo.text = thisTweet.text;
    cell.userName.text = thisTweet.user.screenName;
    
    
    
//    [cell.poster setImageWithURL: self.movies[@"poster_path"]];
    NSString *URLString = thisTweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    [cell.displayPicture setImageWithURL:url];
//
//    NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    
    
    

//    cell.poster
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
