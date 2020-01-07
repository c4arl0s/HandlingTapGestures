# HandlingTapGestures

Use brief taps on the screen to implement button-like interactions with your content.

Ways to attach a gesture recognizer:

- Programatically, calling the addGestureRecognizer(_:) method of your view
- In interface builder. 

![IMG_0025 2](https://user-images.githubusercontent.com/24994818/71920300-118dc280-314c-11ea-95c5-0802bdf50868.PNG)

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

``` objective-c
//
//  AppDelegate.m
//  SwitchCase_objectiveC
//
//  Created by Carlos Santiago Cruz on 6/29/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
{
    ViewController *viewController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
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
    UITapGestureRecognizer *oneTapViewGesture;
    UITapGestureRecognizer *oneTapImageGesture;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    oneTapViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnScreen:)];
    oneTapViewGesture.numberOfTapsRequired = 1;
    self.view.tag = 1;
    [self.view addGestureRecognizer:oneTapViewGesture];
    
    oneTapImageGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapOnScreen:)];
    self.imageView.userInteractionEnabled = YES;
    oneTapImageGesture.numberOfTapsRequired = 1;
    self.imageView.tag = 2;
    [self.imageView addGestureRecognizer:oneTapImageGesture];
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
```

``` console
2019-07-06 21:09:58.972797-0500 SwitchCase_objectiveC[9956:1764589] you tapped on the image view
2019-07-06 21:10:00.000794-0500 SwitchCase_objectiveC[9956:1764589] you tapped on the view container
```








