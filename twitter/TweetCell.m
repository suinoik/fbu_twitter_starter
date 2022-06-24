//
//  TweetCell.m
//  twitter
//
//  Created by Onwuosiuno Ikhioda on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@interface TweetCell()
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;

@end

@implementation TweetCell
- (void)refreshData {
    self.displayName.text = self.tweet.user.name;
    self.tweetInfo.text = self.tweet.text;
    self.userName.text = self.tweet.user.screenName;
    
    
}
- (IBAction)didTapFavorite:(id)sender {
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    UIImage *favorIconRed = [UIImage imageNamed: @"favor-icon-red"];
    [self.favouriteFeature setImage:favorIconRed forState:UIControlStateNormal];
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else{
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
         }
     }];
}

- (IBAction)didTapRetweet:(id)sender {
    self.tweet.retweeted = YES;
    self.tweet.retweetCount += 1;
    UIImage *retweetIconGreen = [UIImage imageNamed: @"retweet-icon-green"];
    [self.retweetFeature setImage:retweetIconGreen forState:UIControlStateNormal];
    
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
         }
         else{
             NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
         }
     }];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
   

    // Configure the view for the selected state
}

@end
