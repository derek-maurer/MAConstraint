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

typedef NS_OPTIONS(NSInteger, Constraint) {
    ConstraintLeft = 1 << 0,
    ConstraintRight = 1 << 1,
    ConstraintTop = 1 << 2,
    ConstraintBottom = 1 << 3,
    ConstraintCenterX = 1 << 4,
    ConstraintCenterY = 1 << 5,
    ConstraintFullSize = 1 << 6,
    ConstraintFullWidth = 1 << 7,
    ConstraintFullHeight = 1 << 8,
    ConstraintHalfWidth = 1 << 9,
    ConstraintHalfHeight = 1 << 10
};

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

@interface UIView (MAContraint)

- (void)addMAConstraint:(Constraint)constraint;

- (void)addConstraintsForFullSizedView;
- (void)addFullWidthConstraint;
- (void)addFullHeightConstraint;

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

- (void)addConstraintWithAtt:(Attribute)att relatedBy:(Relation)relation on:(id)view att:(Attribute)att2;

- (void)removeConstraintWithIdentifier:(NSString*)tag;
- (MAConstraint*)constraintForIdentifier:(NSString*)tag;

@end
