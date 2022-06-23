//
//  ComposeViewController.m
//  twitter
//
//  Created by Onwuosiuno Ikhioda on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"


@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ComposeViewController
- (IBAction)closeButton:(id)sender {[self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)tweetButton:(id)sender {
    [[APIManager shared] postStatusWithText:self.textView.text completion:^(Tweet *tweet, NSError *error) {
        if (error) {
            NSLog(@"Tweet failed to post: %@", error.localizedDescription);
        } else {
            NSLog(@"Tweet successfully posted.");
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
