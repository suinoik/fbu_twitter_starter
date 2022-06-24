//
//  TweetCell.h
//  twitter
//
//  Created by Onwuosiuno Ikhioda on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"


NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *displayPicture;
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *replyFeature;
@property (weak, nonatomic) IBOutlet UIButton *retweetFeature;
@property (weak, nonatomic) IBOutlet UIButton *favouriteFeature;
@property (weak, nonatomic) IBOutlet UILabel *tweetInfo;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) Tweet *tweet;

@end

NS_ASSUME_NONNULL_END
