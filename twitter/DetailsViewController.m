//
//  DetailsViewController.m
//  twitter
//
//  Created by Onwuosiuno Ikhioda on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *displayPicture;
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *tweetInfo;
@property (weak, nonatomic) IBOutlet UIButton *replyFeature;
@property (weak, nonatomic) IBOutlet UIButton *retweetFeature;
@property (weak, nonatomic) IBOutlet UIButton *favouriteFeature;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.displayName.text = self.tweet.user.name;
    self.tweetInfo.text = self.tweet.text;
    self.userName.text = self.tweet.user.screenName;
    self.dateLabel.text = self.tweet.createdAtString;
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    [self.displayPicture setImageWithURL:url];
    
    
    
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
