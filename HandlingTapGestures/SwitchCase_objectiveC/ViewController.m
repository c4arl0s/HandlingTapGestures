//
//  ViewController.m
//  SwitchCase_objectiveC
//
//  Created by Carlos Santiago Cruz on 6/29/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController
{
    UITapGestureRecognizer *oneViewTapGesture;
    UITapGestureRecognizer *oneImageTapGesture;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    oneViewTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnScreen:)];
    oneViewTapGesture.numberOfTapsRequired = 1;
    self.view.tag = 1;
    [self.view addGestureRecognizer:oneViewTapGesture];
    
    oneImageTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnScreen:)];
    self.imageView.userInteractionEnabled = YES;
    oneImageTapGesture.numberOfTapsRequired = 1;
    self.imageView.tag = 2;
    [self.imageView addGestureRecognizer:oneImageTapGesture];
}

- (void)didTapOnScreen:(UITapGestureRecognizer *)sender
{
    if(sender.view.tag == 1)
    {
        NSLog(@"you tapped on the view container");
    }
    else if(sender.view.tag == 2)
    {
        NSLog(@"you tapped on the image view");
    }
}


@end
