# MAConstraint
This project makes it super easy to use AutoLayout. The syntax for AutoLayout is insanely long and this project shortens that syntax by quite a bit.

###CocoaPods
```
pod "MAConstraint"
```

##Usage
```Objective-C
//Example 1
UIView *view = [[UIView alloc] init];
[view setBackgroundColor:[UIColor redColor]];
[self.view addSubview:view];
[view addLeftConstraint]; //Pin the view to the left of it's parent
[view addRightConstraint]; //Pin the view to the right of it's parent
[view addHeightConstraint:50.0]; //Set the view's height to 50
[view addCenterYConstraint]; //Center the view in it's parent

//Example 2
UIView *view2 = [[UIView alloc] init];
[view2 setBackgroundColor:[UIColor blueColor]];
[self.view addSubview:view2];
[view2 addConstraintsForFullSizedView]; //Make the view full size within it's parent

//Example 3
UIView *view3 = [[UIView alloc] init];
[view3 setBackgroundColor:[UIColor yellowColor]];
[self.view addSubview:view3];
[view3 addRightConstraint];
[view3 addTopConstraint];
[view3 addBottomConstraint];
[self.view addConstraint:[Constraint on:view3 att:Left relatedBy:Equal to:self.view att:Left multiplier:1.0 const:30]]; //30 from the left

```