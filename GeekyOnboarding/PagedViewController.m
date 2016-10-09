//
//  PagedViewController.m
//  GeekyOnboarding
//
//  Created by Abhijeet Mishra on 05/10/16.
//  Copyright © 2016 Abhijeet Mishra. All rights reserved.
//

#import "PagedViewController.h"
#import "IFTTTAnimator.h"
#import "IFTTTAlphaAnimation.h"
#import "IFTTTLayerStrokeEndAnimation.h"
#import "IFTTTHideAnimation.h"
#import "IFTTTPathPositionAnimation.h"
#import "IFTTTConstraintMultiplierAnimation.h"
#import "IFTTTRotationAnimation.h"
#import "IFTTTScaleAnimation.h"
#import <Masonry/Masonry.h>


@interface PagedViewController ()

@property (nonatomic) UIImageView* amzonImageView;
@property (nonatomic) UIImageView* ciscoImageView;
@property (nonatomic) UIImageView* facebookImageView;
@property (nonatomic) UIImageView* googleImageView;
@property (nonatomic) UIImageView* microsoftImageView;
@property (nonatomic) UIImageView* oracleImageView;
@property (nonatomic) UIImageView* yahooImageView;

@property (nonatomic) UIImageView* arrowListPrimary;
@property (nonatomic) UIImageView* arrowListSecondary;
@property (nonatomic) UIImageView* arrowInfoTickListImageView;
@property (nonatomic) UIImageView* arrowInforLoginImageView;

@property (nonatomic) UIImageView* primaryListImageView;
@property (nonatomic) UIImageView* secondaryListImageView;
@property (nonatomic) UIImageView* tickListImageView;
@property (nonatomic) UIImageView* loginOnboardingImageView;

@property (nonatomic) UIView* dashedLineView;

@property (nonatomic) UILabel* primaryListLabel;

@property (nonatomic, strong) CAShapeLayer *dashedLineLayer;
@property (nonatomic) UIImageView* arrowImageView;

@property (nonatomic, strong) IFTTTPathPositionAnimation *arrowFlyingAnimation;

@end

@implementation PagedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureViews];
    [self configureAnimations];
}

- (void) configureViews {
  
    self.primaryListImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"primary_list"]];
    self.secondaryListImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"secondary_list"]];
    self.tickListImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tick_list"]];
    self.loginOnboardingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_onboarding"]];
    
    self.amzonImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"amazon"]];
    self.ciscoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cisco"]];
    self.facebookImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"facebook"]];
     self.googleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"google"]];
     self.microsoftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"microsoft"]];
     self.oracleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"oracle"]];
     self.yahooImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yahoo"]];
    
    self.arrowListPrimary = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_info_primary"]];
    self.arrowListSecondary = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_info_secondary"]];
    self.arrowInfoTickListImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_info_tick_list"]];
    self.arrowInforLoginImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_info_login"]];
    
    self.dashedLineView = [UIView new];
    
    self.arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    
    self.primaryListImageView.contentMode = self.amzonImageView.contentMode = self.ciscoImageView.contentMode = self.facebookImageView.contentMode = self.googleImageView.contentMode = self.microsoftImageView.contentMode = self.oracleImageView.contentMode = self.yahooImageView.contentMode = self.secondaryListImageView.contentMode = self.arrowListPrimary.contentMode = self.secondaryListImageView.contentMode = self.tickListImageView.contentMode = self.arrowImageView.contentMode = self.arrowInfoTickListImageView.contentMode = self.loginOnboardingImageView.contentMode = self.arrowInforLoginImageView.contentMode = UIViewContentModeScaleAspectFit;
  
    [self.contentView addSubview:self.ciscoImageView];
    [self.contentView addSubview:self.primaryListImageView];
    [self.contentView addSubview:self.amzonImageView];
    [self.contentView addSubview:self.facebookImageView];
    [self.contentView addSubview:self.googleImageView];
    [self.contentView addSubview:self.microsoftImageView];
    [self.contentView addSubview:self.oracleImageView];
    [self.contentView addSubview:self.yahooImageView];
    [self.contentView addSubview:self.secondaryListImageView];
    [self.contentView addSubview:self.arrowListPrimary];
    [self.contentView addSubview:self.arrowListSecondary];
    [self.contentView addSubview:self.tickListImageView];
    [self.contentView addSubview:self.dashedLineView];
    [self.contentView addSubview:self.arrowImageView];
    [self.contentView addSubview:self.arrowInfoTickListImageView];
    [self.contentView addSubview:self.loginOnboardingImageView];
    [self.contentView addSubview:self.arrowInforLoginImageView];
}

- (void) configureAnimations {
    [self configurePrimaryListView];
    [self configureAmazonImageView];
    [self configureCiscoImageView];
    [self configureFacebookImageView];
    [self configureGoogleImageView];
    [self configureMicrosoftImageView];
    [self configureOracleImageView];
    [self configureYahooImageView];
    [self configureSecondaryListImageView];
    [self configureArrowListPrimaryImageView];
    [self configureArrowListSecondaryImageView];
    [self configureTickListImageView];
    [self configureDashedLineView];
    [self configureArrowInfoTickListImageView];
    [self configureLoginOnboardingImageView];
    [self configureArrowInfoLoginImageView];
    [self animateCurrentFrame];
}

- (void) configurePrimaryListView {
    [self keepView:self.primaryListImageView onPages:@[@(0),@(-2)] atTimes:@[@(0),@(1)]];
    [self.primaryListImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.width.lessThanOrEqualTo(self.scrollView);
        make.width.equalTo(self.scrollView).multipliedBy(0.5).with.priorityHigh();
    }];
}

- (void) configureAmazonImageView {
    [self keepView:self.amzonImageView onPages:@[@(0.38),@(1)] atTimes:@[@(0),@(1)]];
    
    [self.amzonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.primaryListImageView.mas_centerY);
    }];
    
    IFTTTHideAnimation *amazonHideAnimation = [IFTTTHideAnimation animationWithView:self.secondaryListImageView hideAt:0.9];
    [self.animator addAnimation:amazonHideAnimation];
    
    //shrink the secondary list into the background between pages 0 and 1
    IFTTTScaleAnimation *secondaryListScaleAnimation = [IFTTTScaleAnimation animationWithView:self.amzonImageView];
    [secondaryListScaleAnimation addKeyframeForTime:0 scale:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [secondaryListScaleAnimation addKeyframeForTime:0.8 scale:0.7];
    [self.animator addAnimation:secondaryListScaleAnimation];

}

- (void) configureCiscoImageView {
    [self keepView:self.ciscoImageView onPages:@[@(-0.36)] atTimes:@[@(0)]];
    
    [self.ciscoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.primaryListImageView.mas_top).offset(100);
    }];
}

- (void) configureFacebookImageView {
    [self keepView:self.facebookImageView onPages:@[@(0.26),@(-1)] atTimes:@[@(0),@(1)]];
    
    [self.facebookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.primaryListImageView.mas_top).offset(100);
    }];
}

- (void) configureGoogleImageView {
    [self keepView:self.googleImageView onPages:@[@(0.34),@(-1)] atTimes:@[@(0),@(1)]];
    
    [self.googleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.primaryListImageView.mas_bottom).offset(-80);
    }];
}

- (void) configureMicrosoftImageView {
    [self keepView:self.microsoftImageView onPages:@[@(-0.36)] atTimes:@[@(0)]];
    
    [self.microsoftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.primaryListImageView.mas_centerY).offset(-4);
    }];
}

- (void) configureOracleImageView {
    [self keepView:self.oracleImageView onPages:@[@(-0.32)] atTimes:@[@(0)]];
    
    [self.oracleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.primaryListImageView.mas_bottom).offset(-60);
    }];
}

- (void) configureYahooImageView {
    [self keepView:self.yahooImageView onPages:@[@(-0.15),@(-1)] atTimes:@[@(0),@(1)]];
    
    [self.yahooImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.primaryListImageView.mas_top).offset(24);
    }];
}

- (void) configureSecondaryListImageView {
    [self keepView:self.secondaryListImageView onPages:@[@(1)] atTimes:@[@(1)]];
    
    [self.secondaryListImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.width.lessThanOrEqualTo(self.scrollView);
        make.width.equalTo(self.scrollView).multipliedBy(0.5).with.priorityHigh();
    }];
    
    IFTTTHideAnimation *secondaryListHideAnimation = [IFTTTHideAnimation animationWithView:self.secondaryListImageView hideAt:0];
    [self.animator addAnimation:secondaryListHideAnimation];

    IFTTTHideAnimation *secondaryListShowAnimation = [IFTTTHideAnimation animationWithView:self.secondaryListImageView showAt:0.9];
    [self.animator addAnimation:secondaryListShowAnimation];
    
    // grow the secondary list into the background between pages 0 and 1
    IFTTTScaleAnimation *secondaryListScaleAnimation = [IFTTTScaleAnimation animationWithView:self.secondaryListImageView];
    [secondaryListScaleAnimation addKeyframeForTime:0 scale:0.1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [secondaryListScaleAnimation addKeyframeForTime:1 scale:1];
    [self.animator addAnimation:secondaryListScaleAnimation];
}

- (void) configureArrowListPrimaryImageView {
    [self keepView:self.arrowListPrimary onPages:@[@(0)] atTimes:@[@(0)]];
    
    [self.arrowListPrimary mas_makeConstraints:^(MASConstraintMaker *make) {
   //     make.top.equalTo(self.contentView.mas_bottom).offset(-32);
    }];
    NSLayoutConstraint *arrowListPrimaryVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.arrowListPrimary
                                                                              attribute:NSLayoutAttributeCenterY
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.contentView
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1.f constant:0.f];
    [self.contentView addConstraint:arrowListPrimaryVerticalConstraint];
   
    // move arrow up between pages 0 and 1
    IFTTTConstraintMultiplierAnimation *arrowListPrimaryVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                constraint:arrowListPrimaryVerticalConstraint
                                                                                                                 attribute:IFTTTLayoutAttributeHeight
                                                                                                             referenceView:self.primaryListImageView];
    [arrowListPrimaryVerticalAnimation addKeyframeForTime:0 multiplier:-0.28];
    [arrowListPrimaryVerticalAnimation addKeyframeForTime:1 multiplier:0.64f];
    [self.animator addAnimation:arrowListPrimaryVerticalAnimation];
  
    // Rotate arrow 100 degrees counterclockwise between pages 0 and 1
    IFTTTRotationAnimation *arrowListPrimaryRotationAnimation = [IFTTTRotationAnimation animationWithView:self.arrowListPrimary];
    [arrowListPrimaryRotationAnimation addKeyframeForTime:0 rotation:0];
    [arrowListPrimaryRotationAnimation addKeyframeForTime:1 rotation:000];
    [self.animator addAnimation:arrowListPrimaryRotationAnimation];
    

}

- (void) configureArrowListSecondaryImageView {
    [self keepView:self.arrowListSecondary onPages:@[@(1.2)] atTimes:@[@(1)]];
    
    [self.arrowListSecondary mas_makeConstraints:^(MASConstraintMaker *make) {
        //     make.top.equalTo(self.contentView.mas_bottom).offset(-32);
    }];
    NSLayoutConstraint *arrowListSecondaryVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.arrowListSecondary
                                                                              attribute:NSLayoutAttributeCenterY
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.contentView
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1.f constant:0.f];
    [self.contentView addConstraint:arrowListSecondaryVerticalConstraint];
    
    // move JAZZ up between pages 0 and 1
    IFTTTConstraintMultiplierAnimation *arrowListSecondaryVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                constraint:arrowListSecondaryVerticalConstraint
                                                                                                                 attribute:IFTTTLayoutAttributeHeight
                                                                                                             referenceView:self.primaryListImageView];
    [arrowListSecondaryVerticalAnimation addKeyframeForTime:0 multiplier:0.64f];
    [arrowListSecondaryVerticalAnimation addKeyframeForTime:1 multiplier:-0.28];
    [arrowListSecondaryVerticalAnimation addKeyframeForTime:2 multiplier:0.64f];
    [self.animator addAnimation:arrowListSecondaryVerticalAnimation];
    
    // Rotate Jazz 100 degrees counterclockwise between pages 0 and 1
    IFTTTRotationAnimation *arrowListSecondaryRotationAnimation = [IFTTTRotationAnimation animationWithView:self.arrowListSecondary];
    [arrowListSecondaryRotationAnimation addKeyframeForTime:0 rotation:0];
    [arrowListSecondaryRotationAnimation addKeyframeForTime:1 rotation:000];
    [self.animator addAnimation:arrowListSecondaryRotationAnimation];
}

- (void) configureTickListImageView {
    [self keepView:self.tickListImageView onPages:@[@(2.2)] atTimes:@[@(2)]];
    
    [self.tickListImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.width.lessThanOrEqualTo(self.scrollView);
        make.width.equalTo(self.scrollView).multipliedBy(0.5).with.priorityHigh();
    }];
}

- (void) configureDashedLineView {
    // Set up the view that contains the airplane view and its dashed line path view
    self.dashedLineLayer = [self dashedLineLayer];
    [self.dashedLineView.layer addSublayer:self.dashedLineLayer];
    
    self.dashedLineView.backgroundColor = [UIColor yellowColor];
    
    [self.dashedLineView addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.dashedLineView.mas_centerY);
        make.right.equalTo(self.dashedLineView.mas_centerX);
    }];
    
    [self.dashedLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.scrollView).offset(55);
        make.width.and.height.equalTo(self.arrowImageView);
    }];
    
    // Keep the left edge of the planePathView at the center of pages 1 and 2
    [self keepView:self.dashedLineView onPages:@[@(1.5)] atTimes:@[@(1)] withAttribute:IFTTTHorizontalPositionAttributeLeft];
    
    // Fly the plane along the path
    self.arrowFlyingAnimation = [IFTTTPathPositionAnimation animationWithView:self.arrowImageView path:self.dashedLineLayer.path];
    [self.arrowFlyingAnimation addKeyframeForTime:1 animationProgress:0];
    [self.arrowFlyingAnimation addKeyframeForTime:2 animationProgress:1];
    [self.animator addAnimation:self.arrowFlyingAnimation];
    
    //hide the dashes upon completion
    IFTTTHideAnimation *dashLinenHideAnimation = [IFTTTHideAnimation animationWithView:self.dashedLineView hideAt:1.9];
    [self.animator addAnimation:dashLinenHideAnimation];
    
    // Change the stroke end of the dashed line airplane path to match the plane's current position
    IFTTTLayerStrokeEndAnimation *planePathAnimation = [IFTTTLayerStrokeEndAnimation animationWithLayer:self.dashedLineLayer];
    [planePathAnimation addKeyframeForTime:1 strokeEnd:0];
    [planePathAnimation addKeyframeForTime:2 strokeEnd:1];
    [self.animator addAnimation:planePathAnimation];
    
    // Fade the plane path view in after page 1 and fade it out again after page 2.5
    IFTTTAlphaAnimation *planeAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.dashedLineView];
    [planeAlphaAnimation addKeyframeForTime:1.06f alpha:0];
    [planeAlphaAnimation addKeyframeForTime:1.08f alpha:1];
    [planeAlphaAnimation addKeyframeForTime:2.5f alpha:1];
    [planeAlphaAnimation addKeyframeForTime:3.f alpha:0];
    [self.animator addAnimation:planeAlphaAnimation];
}

- (CGPathRef)dashedLinePath
{
    // Create a bezier path for the airplane to fly along
    UIBezierPath *airplanePath = [UIBezierPath bezierPath];
    
    [airplanePath moveToPoint: CGPointMake(84, -420)];
    [airplanePath addLineToPoint: CGPointMake(360, -420)];
    return airplanePath.CGPath;
}


- (CAShapeLayer *)dashedLineLayer
{
    // Create a shape layer to draw the airplane's path
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self dashedLinePath];
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [UIColor colorWithRed:0 green:194.0/255.0 blue:109.0/255.0 alpha:1.0].CGColor;
    shapeLayer.lineDashPattern = @[@(20), @(20)];
    shapeLayer.lineWidth = 4;
    shapeLayer.miterLimit = 4;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    
    return shapeLayer;
}

- (void) configureArrowInfoTickListImageView {
    [self keepView:self.arrowInfoTickListImageView onPages:@[@(1.7)] atTimes:@[@(2)]];
    
    NSLayoutConstraint *arrowListPrimaryVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.arrowInfoTickListImageView
                                                                                          attribute:NSLayoutAttributeCenterY
                                                                                          relatedBy:NSLayoutRelationEqual
                                                                                             toItem:self.contentView
                                                                                          attribute:NSLayoutAttributeBottom
                                                                                         multiplier:1.f constant:0.f];
    [self.contentView addConstraint:arrowListPrimaryVerticalConstraint];
    
    // move arrow up between pages 0 and 1
    IFTTTConstraintMultiplierAnimation *arrowListPrimaryVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                            constraint:arrowListPrimaryVerticalConstraint
                                                                                                                             attribute:IFTTTLayoutAttributeHeight
                                                                                                                         referenceView:self.tickListImageView];
    [arrowListPrimaryVerticalAnimation addKeyframeForTime:1 multiplier:0.64f];
    [arrowListPrimaryVerticalAnimation addKeyframeForTime:2 multiplier:-0.68];
    [arrowListPrimaryVerticalAnimation addKeyframeForTime:3 multiplier:0.64f];
    [self.animator addAnimation:arrowListPrimaryVerticalAnimation];
    
    // Rotate arrow 100 degrees counterclockwise between pages 0 and 1
    IFTTTRotationAnimation *arrowListPrimaryRotationAnimation = [IFTTTRotationAnimation animationWithView:self.arrowInfoTickListImageView];
    [arrowListPrimaryRotationAnimation addKeyframeForTime:0 rotation:0];
    [arrowListPrimaryRotationAnimation addKeyframeForTime:1 rotation:000];
    [self.animator addAnimation:arrowListPrimaryRotationAnimation];
}

- (void) configureLoginOnboardingImageView {
    [self keepView:self.loginOnboardingImageView onPages:@[@(3)] atTimes:@[@(3)]];
    [self.loginOnboardingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.width.lessThanOrEqualTo(self.scrollView);
        make.width.equalTo(self.scrollView).multipliedBy(0.5).with.priorityHigh();
    }];
}

- (void) configureArrowInfoLoginImageView {
    [self keepView:self.arrowInforLoginImageView onPages:@[@(3)] atTimes:@[@(3)]];
    
    NSLayoutConstraint *arrowListSecondaryVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.arrowInforLoginImageView
                                                                                            attribute:NSLayoutAttributeCenterY
                                                                                            relatedBy:NSLayoutRelationEqual
                                                                                               toItem:self.contentView
                                                                                            attribute:NSLayoutAttributeBottom
                                                                                           multiplier:1.f constant:0.f];
    [self.contentView addConstraint:arrowListSecondaryVerticalConstraint];
    
    // move JAZZ up between pages 0 and 1
    IFTTTConstraintMultiplierAnimation *arrowListSecondaryVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                              constraint:arrowListSecondaryVerticalConstraint
                                                                                                                               attribute:IFTTTLayoutAttributeHeight
                                                                                                                           referenceView:self.primaryListImageView];
    [arrowListSecondaryVerticalAnimation addKeyframeForTime:2 multiplier:0.64f];
    [arrowListSecondaryVerticalAnimation addKeyframeForTime:3 multiplier:-0.24];
    [arrowListSecondaryVerticalAnimation addKeyframeForTime:4 multiplier:0.64f];
    [self.animator addAnimation:arrowListSecondaryVerticalAnimation];
    
    // Rotate Jazz 100 degrees counterclockwise between pages 0 and 1
    IFTTTRotationAnimation *arrowListSecondaryRotationAnimation = [IFTTTRotationAnimation animationWithView:self.arrowListSecondary];
    [arrowListSecondaryRotationAnimation addKeyframeForTime:0 rotation:0];
    [arrowListSecondaryRotationAnimation addKeyframeForTime:1 rotation:000];
    [self.animator addAnimation:arrowListSecondaryRotationAnimation];
}

- (NSUInteger)numberOfPages
{
    // Tell the scroll view how many pages it should have
    return 4;
}
#pragma mark - iOS8+ Resizing

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
       // [self scaleAirplanePathToSize:size];
    } completion:nil];
}

#pragma mark - iOS7 Orientation Change Resizing

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGSize newPageSize;
    
    if ((UIInterfaceOrientationIsLandscape(self.interfaceOrientation)
         && UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
        || (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)
            && UIInterfaceOrientationIsLandscape(toInterfaceOrientation))) {
            
            newPageSize = CGSizeMake(CGRectGetHeight(self.scrollView.frame), CGRectGetWidth(self.scrollView.frame));
        } else {
            newPageSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        }
    
    [UIView animateWithDuration:duration animations:^{
       // [self scaleAirplanePathToSize:newPageSize];
    } completion:nil];
}


- (void)animateCurrentFrame
{
    [self.animator animate:self.pageOffset];
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

@end
