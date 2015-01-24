# MAConstraint
This project makes it super easy to use AutoLayout. The syntax for AutoLayout is insanely long and this project shortens that syntax by quite a bit.

###CocoaPods
```
pod "MAConstraint"
```

##Usage
####Objective-C
```Objective-C
//Example 1
UIView *view = [[UIView alloc] init];
[view setBackgroundColor:[UIColor redColor]];
[self.view addSubview:view];
[view addMAConstraint:ConstraintCenterY | ConstraintCenterX | ConstraintFullHeight | ConstraintHalfWidth];

//Example 1
UIView *view = [[UIView alloc] init];
[view setBackgroundColor:[UIColor redColor]];
[self.view addSubview:view];
[view addLeftConstraint]; //Pin the view to the left of it's parent
[view addRightConstraint]; //Pin the view to the right of it's parent
[view addHeightConstraint:50.0]; //Set the view's height to 50
[view addCenterYConstraint]; //Center the view in it's parent

//Example 2
UIView *view = [[UIView alloc] init];
[view setBackgroundColor:[UIColor blueColor]];
[self.view addSubview:view];
[view addConstraintsForFullSizedView]; //Make the view full size within it's parent

//Example 3
UIView *view = [[UIView alloc] init];
[view setBackgroundColor:[UIColor yellowColor]];
[self.view addSubview:view];
[view addRightConstraint];
[view addTopConstraint];
[view addBottomConstraint];
[self.view addConstraint:[Constraint on:view att:Left relatedBy:Equal to:self.view att:Left multiplier:1.0 const:30]]; //30 from the left
```

####Swift
The Swift syntax is pretty much the same as Objective-C, but it can be even shorter.
```
let someView = UIView()
someView.backgroundColor = UIColor.yellowColor()
view.addSubview(someView)
someView.addMAConstraint(.CenterX | .CenterY | .HalfWidth | .FullHeight)
```