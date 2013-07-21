//
//  OSWViewController.m
//  iPadPager
//
//  Created by Barry W. McMullan on 2013-07-19.
//  Copyright (c) 2013 Orsa Software Inc. All rights reserved.
//

#import "OSWViewController.h"

@interface OSWViewController ()

@end

@implementation OSWViewController

@synthesize mainScrollView = _mainScrollView;
@synthesize pagingScrollView = _pagingScrollView;
@synthesize pageControll = _pageControll;
@synthesize xibContents = _xibContents;
@synthesize portraitPageView = _portraitPageView;

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
    //  This is your last KEY update
    
}

#pragma mark -

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    //  Load the Xib file that holds the view we will insert (add) to the 'pagingScrollView'
    
    NSLog(@"Loaded the CalculationViews-568 Xib");
    _xibContents = [[NSBundle mainBundle] loadNibNamed:@"PortriatPageView" owner:self options:nil];
    
    //  Now add the 'portraitePageView' (that was loaded with the Xib) as a subview of
    //  the 'pagingScrollView' and set its' 'contentSize' to the size of the
    //  'portraitPageView's frame
    
    [self.pagingScrollView addSubview:_portraitPageView];
    self.pagingScrollView.contentSize = _portraitPageView.frame.size;
    
}

#pragma mark -

- (IBAction)pageControllerChanged:(UIPageControl *)sender;
{
    
    //  Our PageController changed, so we need to set the contentOffSet of the
    //  'pagingScrollView' accordingly.
    
    //  First get the 'currentPage' from the UIPageControl
    
    NSInteger page = sender.currentPage;
    
    //  Now create the 'point' we will use to set the ScrollView's 'contentOffSet'.
    //  We do this by using CGPointMake and setting the 'x' value to be the 'width'
    //  of our 'pagingScrollView' times the page number (which will be 0 or 1).

    CGPoint point = CGPointMake(self.pagingScrollView.frame.size.width * page, 0);
    
    //  Now set the 'contentOffSet' and animate it
    
    [self.pagingScrollView setContentOffset:point animated:YES];
    
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  
    //  This methd could be triggered by a scroll from either our 'mainScrollView' or
    //  our 'pagingScrollView', so lets first test to see if it's the 'pagingScrollView'
    //  and if so, determine the position of the content within it and set our page
    //  Controller accordingly

    if (scrollView == _pagingScrollView)
    {
        
        //  Our ScrollView scrolled, so lets determine the position
        //  of the content within it and set our page Controller accordingly
        
        CGFloat pageWidth = self.pagingScrollView.frame.size.width;
        
        NSInteger page = (NSInteger)floor((self.pagingScrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
        
        // Update the page control
        self.pageControll.currentPage = page;
        
    }
    
    
}

@end
