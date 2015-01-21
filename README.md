# MAConstraint
This project makes it super easy to use AutoLayout. The syntax for AutoLayout is insanely long and this project shortens that syntax by quite a bit.

###CocoaPods
pod "MAConstraint"


##Usage
```
UIView *view = [[UIView alloc] init];
[view setBackgroundColor:[UIColor redColor]];
[self.view addSubview:view];
[view addLeftConstraint]; //Pin the view to the left of it's parent
[view addRightConstraint]; //Pin the view to the right of it's parent
[view addHeightConstraint:50.0]; //Set the view's height to 50
[view addCenterYConstraint]; //Center the view in it's parent
```