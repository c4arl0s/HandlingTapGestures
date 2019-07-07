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
- Type the selector method

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

# Remember to self.imageView.userInteractionEnabled = YES;

```console
2019-07-06 20:27:58.054297-0500 SwitchCase_objectiveC[9467:1717929] you tapped the image
```

![Screen Shot 2019-07-06 at 8 28 32 PM](https://user-images.githubusercontent.com/24994818/60762818-4c902b80-a02d-11e9-9fc2-1d29e920cfab.png)

# What to do if you want to detect which view you tapped.

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
```

``` console
2019-07-06 21:09:58.972797-0500 SwitchCase_objectiveC[9956:1764589] you tapped on the image view
2019-07-06 21:10:00.000794-0500 SwitchCase_objectiveC[9956:1764589] you tapped on the view container
```








