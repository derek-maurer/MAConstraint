//
//  MAConstraint.m
//  Polis
//
//  Created by Derek Maurer on 9/25/14.
//  Copyright (c) 2014 Derek Maurer. All rights reserved.
//

#import "MAConstraint.h"

@implementation MAConstraint

+ (MAConstraint*)heightConstraintOn:(id)view height:(CGFloat)heightValue {
    return [MAConstraint on:view att:Height relatedBy:Equal to:nil att:Height multiplier:1.0 const:heightValue];
}

+ (MAConstraint*)widthConstraintOn:(id)view width:(CGFloat)widthValue {
    return [MAConstraint on:view att:Width relatedBy:Equal to:nil att:Width multiplier:1.0 const:widthValue];
}

+ (MAConstraint*)leftConstraintOn:(id)view withMargin:(CGFloat)margin {
    if ([view isKindOfClass:[UIView class]]) {
        return [MAConstraint on:view att:Leading relatedBy:Equal to:((UIView*)view).superview att:Leading multiplier:1.0 const:margin];
    }

    return nil;
}

+ (MAConstraint*)leftConstraintOn:(id)view {
    return [MAConstraint withSuperViewOn:view att:Left relatedBy:Equal];
}

+ (MAConstraint*)rightConstraintOn:(id)view {
    return [MAConstraint withSuperViewOn:view att:Right relatedBy:Equal];
}

+ (MAConstraint*)rightConstraintOn:(id)view withMargin:(CGFloat)margin {
    if ([view isKindOfClass:[UIView class]]) {
        return [MAConstraint on:view att:Trailing relatedBy:Equal to:((UIView*)view).superview att:Trailing multiplier:1.0 const:margin];
    }
    
    return nil;
}

+ (MAConstraint*)bottomConstraintOn:(id)view{
    return [MAConstraint withSuperViewOn:view att:Bottom relatedBy:Equal];
}

+ (MAConstraint*)bottomConstraintOn:(id)view withMargin:(CGFloat)margin {
    if ([view isKindOfClass:[UIView class]]) {
        return [MAConstraint on:view att:Bottom relatedBy:Equal to:((UIView*)view).superview att:Bottom multiplier:1.0 const:margin];
    }
    
    return nil;
}

+ (MAConstraint*)bottomConstraintOn:(id)view aboveView:(id)view2 {
    if ([view isKindOfClass:[UIView class]]) {
        return [MAConstraint on:view att:Bottom relatedBy:Equal to:view2 att:Top];
    }
    
    return nil;
}

+ (MAConstraint*)topConstraintOn:(id)view {
    return [MAConstraint withSuperViewOn:view att:Top relatedBy:Equal];
}

+ (MAConstraint*)topConstraintOn:(id)view withMargin:(CGFloat)margin {
    if ([view isKindOfClass:[UIView class]]) {
        return [MAConstraint on:view att:Top relatedBy:Equal to:((UIView*)view).superview att:Top multiplier:1.0 const:margin];
    }
    
    return nil;
}

+ (MAConstraint*)topConstraintOn:(id)view belowView:(id)view2 {
    if ([view isKindOfClass:[UIView class]]) {
        return [MAConstraint on:view att:Top relatedBy:Equal to:view2 att:Bottom];
    }
    
    return nil;
}

+ (MAConstraint*)withSuperViewOn:(id)view att:(Attribute)att1 relatedBy:(Relation)relation {
    if ([view isKindOfClass:[UIView class]]) {
        return [MAConstraint on:view att:att1 relatedBy:relation to:((UIView*)view).superview att:att1];
    }
    
    return nil;
}

+ (MAConstraint*)centerX:(id)view inView:(id)inView {
    return [MAConstraint on:view att:CenterX relatedBy:Equal to:inView att:CenterX];
}

+ (MAConstraint*)centerY:(id)view inView:(id)inView {
    return [MAConstraint on:view att:CenterY relatedBy:Equal to:inView att:CenterY];
}

+ (MAConstraint*)on:(id)view1 att:(Attribute)att1 relatedBy:(Relation)relation to:(id)view2 att:(Attribute)att2 {
    return [MAConstraint on:view1 att:att1 relatedBy:relation to:view2 att:att2 multiplier:1.0 const:0.0];
}

+ (MAConstraint*)on:(id)view1 att:(Attribute)att1 relatedBy:(Relation)relation to:(id)view2 att:(Attribute)att2 multiplier:(CGFloat)multiplier const:(CGFloat)constant {
    [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return (MAConstraint*)[NSLayoutConstraint constraintWithItem:view1 attribute:(NSLayoutAttribute)att1 relatedBy:(NSLayoutRelation)relation toItem:view2 attribute:(NSLayoutAttribute)att2 multiplier:multiplier constant:constant];
}

+ (NSArray*)constraintsForFullSizedView:(id)view {
    if ([view isKindOfClass:[UIView class]]) {
        MAConstraint *left = [MAConstraint on:view att:Left relatedBy:Equal to:((UIView*)view).superview att:Left];
        MAConstraint *right = [MAConstraint on:view att:Right relatedBy:Equal to:((UIView*)view).superview att:Right];
        MAConstraint *top = [MAConstraint on:view att:Top relatedBy:Equal to:((UIView*)view).superview att:Top];
        MAConstraint *bottom = [MAConstraint on:view att:Bottom relatedBy:Equal to:((UIView*)view).superview att:Bottom];
        
        return @[left,right,top,bottom];
    }
    
    return nil;
}

@end

/////////////////////////////
/* UIView category */
////////////////////////////

@implementation UIView (Contraint)

- (void)removeConstraintWithIdentifier:(NSString*)tag {
    MAConstraint *con = [self constraintForIdentifier:tag];
    if (con) {
        [self removeConstraint:con];
    }
}

- (MAConstraint*)constraintForIdentifier:(NSString*)tag {
    for (NSLayoutConstraint *constraint in self.constraints) {
        if ([constraint isKindOfClass:[NSLayoutConstraint class]]) {
            if ([constraint.identifier isEqualToString:tag]) return (MAConstraint*)constraint;
        }
    }
    
    return nil;
}

- (void)throughErrorIfNoSuperView {
    if (!self.superview) {
        NSException *exception = [NSException exceptionWithName:@"MAConstraint: No superview" reason:@"The view you're adding a MAConstraint to doesn't have a superview yet. Make sure you add your view to it's superview before adding MAConstraints" userInfo:nil];
        [exception raise];
    }
}

- (void)addConstraintsForFullSizedView {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraints:[MAConstraint constraintsForFullSizedView:self]];
}

- (void)addHeightConstraint:(CGFloat)height {
    [self throughErrorIfNoSuperView];
    [self addConstraint:[MAConstraint heightConstraintOn:self height:height]];
}

- (void)addWidthConstraint:(CGFloat)width {
    [self throughErrorIfNoSuperView];
    [self addConstraint:[MAConstraint widthConstraintOn:self width:width]];
}

- (void)addLeftConstraint {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint leftConstraintOn:self]];
}

- (void)addLeftConstraintWithMargin:(CGFloat)margin {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint leftConstraintOn:self withMargin:margin]];
}

- (void)addRightConstraint {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint rightConstraintOn:self]];
}

- (void)addRightConstraintWithMargin:(CGFloat)margin {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint rightConstraintOn:self withMargin:margin]];
}

- (void)addBottomConstraint {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint bottomConstraintOn:self]];
}

- (void)addBottomConstraintWithMargin:(CGFloat)margin {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint bottomConstraintOn:self withMargin:margin]];
}

- (void)addBottomConstraintAboveView:(id)view {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint bottomConstraintOn:self aboveView:view]];
}

- (void)addTopConstraint {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint topConstraintOn:self]];
}

- (void)addTopConstraintWithMargin:(CGFloat)margin {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint topConstraintOn:self withMargin:margin]];
}

- (void)addTopConstraintBelowView:(id)view {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint topConstraintOn:self belowView:view]];
}

- (void)addCenterXConstraint {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint centerX:self inView:self.superview]];
}

- (void)addCenterYConstraint {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint centerY:self inView:self.superview]];
}

- (void)addConstraintWithAtt:(Attribute)att relatedBy:(Relation)relation on:(id)view att:(Attribute)att2 {
    [self throughErrorIfNoSuperView];
    [self.superview addConstraint:[MAConstraint on:self att:att relatedBy:relation to:self.superview att:att2]];
}

@end