//
//  GuidePageViewController.m
//  GuidePage
//
//  Created by sarah on 15/12/15.
//  Copyright © 2015年 william. All rights reserved.
//

#import "GuidePageViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGTH [UIScreen mainScreen].bounds.size.height
@interface GuidePageViewController ()<UIScrollViewDelegate>
{
    NSArray *m_pictureArr;
    UIViewController *m_mainController;
    UIImageView *m_guideImageView;
    UIScrollView *m_guideScrollView;
    UIPageControl *m_guidePageController;
}

@end

@implementation GuidePageViewController

-(instancetype)initWithPicArr:(NSArray *)picArr andRootVC:(UIViewController *)controller{
    if (self = [super init]) {
        m_pictureArr = picArr;
        m_mainController = controller;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setScrollView];
    [self setImageView];
    [self setPageController];

}
//设置scrollView
-(void)setScrollView{
    m_guideScrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    m_guideScrollView.contentSize = CGSizeMake(WIDTH * m_pictureArr.count, HEIGTH);
    m_guideScrollView.pagingEnabled = YES;
    m_guideScrollView.showsHorizontalScrollIndicator = NO;
    m_guideScrollView.showsVerticalScrollIndicator = NO;
    m_guideScrollView.alwaysBounceVertical = NO;
    m_guideScrollView.alwaysBounceHorizontal = NO;
    m_guideScrollView.bounces = NO;
    m_guideScrollView.delegate = self;
    [self.view addSubview:m_guideScrollView];
}

//设置ImageView
-(void)setImageView{
    for (int i = 0; i < m_pictureArr.count; i++)
    {
        m_guideImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:m_pictureArr[i]]];
        m_guideImageView.userInteractionEnabled = YES;
        m_guideImageView.frame = CGRectMake(i * WIDTH, 0, WIDTH, HEIGTH);
        [m_guideScrollView addSubview:m_guideImageView];
        if (i == m_pictureArr.count - 1)
        {
            UIButton *myButton = [UIButton buttonWithType:UIButtonTypeSystem];
            myButton.frame = CGRectMake(WIDTH - 120,HEIGTH - 50, 100, 40) ;
            myButton.backgroundColor = [UIColor whiteColor];
            [myButton setTitle:@"立即使用" forState:UIControlStateNormal];
            [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            myButton.layer.cornerRadius = 10;
            [myButton addTarget:self action:@selector(skips:) forControlEvents:UIControlEventTouchUpInside];
            [m_guideImageView addSubview:myButton];
        }
    }
}

-(void)skips:(UIButton *)sender{
    NSLog(@"按钮被点击");
    [self presentViewController:m_mainController animated:NO completion:nil];
}

//设置pageController
-(void)setPageController{
    m_guidePageController = [[UIPageControl alloc]initWithFrame:CGRectMake((WIDTH - 50) / 2, HEIGTH - 50, 50, 20)];
    m_guidePageController.numberOfPages = m_pictureArr.count;
    m_guidePageController.currentPage = 0;
    [self.view addSubview:m_guidePageController];
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int index = fabs(scrollView.contentOffset.x / WIDTH);
    m_guidePageController.currentPage = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
