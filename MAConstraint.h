//
//  MAConstraint.h
//
//  Created by Derek Maurer on 9/25/14.
//  Copyright (c) 2014 Derek Maurer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Left  = 1,
    Right ,
    Top ,
    Bottom ,
    Leading ,
    Trailing ,
    Width ,
    Height ,
    CenterX ,
    CenterY ,
    Baseline ,
    None  = 0
} Attribute;

typedef enum : NSUInteger {
    LessThanOrEqual  = -1,
    Equal  = 0,
    ThanOrEqual  = 1,
} Relation;

@interface MAConstraint : NSLayoutConstraint

@property (nonatomic, strong) NSString *tag;

+ (NSArray*)constraintsForFullSizedView:(id)view;

+ (MAConstraint*)heightConstraintOn:(id)view height:(CGFloat)height;
+ (MAConstraint*)widthConstraintOn:(id)view width:(CGFloat)width;

+ (MAConstraint*)leftConstraintOn:(id)view; //relation view is superview
+ (MAConstraint*)leftConstraintOn:(id)view withMargin:(CGFloat)margin;

+ (MAConstraint*)rightConstraintOn:(id)view; //relation view is superview
+ (MAConstraint*)rightConstraintOn:(id)view withMargin:(CGFloat)margin;

+ (MAConstraint*)bottomConstraintOn:(id)view; //relation view is superview
+ (MAConstraint*)bottomConstraintOn:(id)view withMargin:(CGFloat)margin;
+ (MAConstraint*)bottomConstraintOn:(id)view aboveView:(id)view2;

+ (MAConstraint*)topConstraintOn:(id)view; //relation view is superview
+ (MAConstraint*)topConstraintOn:(id)view withMargin:(CGFloat)margin;
+ (MAConstraint*)topConstraintOn:(id)view belowView:(id)view2;

+ (MAConstraint*)centerX:(id)view inView:(id)inView;
+ (MAConstraint*)centerY:(id)view inView:(id)inView;

+ (MAConstraint*)withSuperViewOn:(id)view att:(Attribute)att1 relatedBy:(Relation)relation; //relation view is superview

+ (MAConstraint*)on:(id)view1 att:(Attribute)att1 relatedBy:(Relation)relation to:(id)view2 att:(Attribute)att2;

+ (MAConstraint*)on:(id)view1 att:(Attribute)att1 relatedBy:(Relation)relation to:(id)view2 att:(Attribute)att2 multiplier:(CGFloat)multiplier const:(CGFloat)constant;

@end

@interface UIView (Contraint)

- (void)removeConstraintWithTag:(NSString*)tag;
- (MAConstraint*)constraintForTag:(NSString*)tag;

- (void)addConstraintsForFullSizedView;

- (void)addHeightConstraint:(CGFloat)height;
- (void)addWidthConstraint:(CGFloat)width;

- (void)addLeftConstraint;
- (void)addLeftConstraintWithMargin:(CGFloat)margin;

- (void)addRightConstraint;
- (void)addRightConstraintWithMargin:(CGFloat)margin;

- (void)addBottomConstraint;
- (void)addBottomConstraintWithMargin:(CGFloat)margin;
- (void)addBottomConstraintAboveView:(id)view;

- (void)addTopConstraint;
- (void)addTopConstraintWithMargin:(CGFloat)margin;
- (void)addTopConstraintBelowView:(id)view;

- (void)addCenterXConstraint;
- (void)addCenterYConstraint;

@end
