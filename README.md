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
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    oneTap.numberOfTapsRequired = 1;
    [self.imageView addGestureRecognizer:oneTap];
}
```

``` objective-c
-(void)imageTapped:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"you tapped on imageView");
}
```



