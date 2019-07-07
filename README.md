# HandlingTapGestures

Use brief taps on the screen to implement button-like interactions with your content.

Ways to attach a gesture recognizer:

- Programatically, calling the addGestureRecognizer(_:) method of your view
- In interface builder. 

### A UITapGestureRecognizer object provides event handling capabilities similar to those of a button—it detects a tap in its view and reports that tap to your action method.

### Tap gestures are discrete, so your action method is called only when the tap gesture is recognized successfully.

### You can configure a tap gesture recognizer to require any number of taps—for example, single taps or double taps—before your action method is called.

- Create an instance of the recognizer
- Add it to the view that will receive the touch events.

``` objective-c
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
    UITapGestureRecognizer *oneTapGesture;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    oneTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    oneTapGesture.numberOfTapsRequired = 1;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:oneTapGesture];
}

- (void)imageTapped:(UITapGestureRecognizer *)sender
{
    NSLog(@"you tapped the image");
    self.imageView.backgroundColor = [UIColor blackColor];
}


@end
```

### Remember to self.imageView.userInteractionEnabled = YES;

```console
2019-07-06 20:27:58.054297-0500 SwitchCase_objectiveC[9467:1717929] you tapped the image
```

![Screen Shot 2019-07-06 at 8 28 32 PM](https://user-images.githubusercontent.com/24994818/60762818-4c902b80-a02d-11e9-9fc2-1d29e920cfab.png)



