//
//  ViewController.m
//  TestDemo
//
//  Created by xiaowuxiaowu on 16/1/22.
//  Copyright © 2016年 xiaowuxiaowu. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImage/SDWebImageManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)buttonAction2:(id)sender{

    NSMutableArray *imgsArray = [NSMutableArray new];
    

    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        for(int i = 3; i<=9; i++){
            NSString *url = [NSString stringWithFormat:@"http://www.weltuke.com/%d.jpg",i*11];
            [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:url] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                ;
            } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                if(image)
                    [imgsArray addObject:image];
                
                if(i == 9){
                    if(imgsArray.count == 0)
                        [imgsArray addObject:[UIImage imageNamed:@"scanscanBg"]];

                    dispatch_async(dispatch_get_main_queue(), ^{

                        UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:imgsArray applicationActivities:nil];
                        
                        activityView.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePrint,UIActivityTypeAirDrop,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFacebook,UIActivityTypePostToFlickr];
                        [self presentViewController:activityView animated:YES completion:nil];
                    });
                    
                    
                    
                }

            }];
            
        }
        
    });
    

    
  //  http://www.weltuke.com/99.jpg
}
- (IBAction)buttonAction:(id)sender {
    
    NSMutableArray *imgsArray = [NSMutableArray new];
    
    for (int i = 0; i<9; i++) {
        [imgsArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]]];
    }
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:imgsArray applicationActivities:nil];
    
    activityView.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypePrint,UIActivityTypeAirDrop,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFacebook,UIActivityTypePostToFlickr];
    [self presentViewController:activityView animated:YES completion:nil];
}

@end
