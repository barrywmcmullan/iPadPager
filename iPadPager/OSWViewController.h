//
//  OSWViewController.h
//  iPadPager
//
//  Created by Barry W. McMullan on 2013-07-19.
//  Copyright (c) 2013 Orsa Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OSWViewController : UIViewController

@property (copy, nonatomic) NSArray *xibContents;

@property (nonatomic, strong) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic, strong) IBOutlet UIScrollView *pagingScrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControll;
@property (nonatomic, strong) IBOutlet UIView *portraitPageView;

- (IBAction)pageControllerChanged:(UIPageControl *)sender;

@end
