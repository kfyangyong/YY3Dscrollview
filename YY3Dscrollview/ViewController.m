//
//  ViewController.m
//  YY3Dscrollview
//
//  Created by Apple on 2017/4/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "TY3DCollectionViewCell.h"
#import "UIScrollView+TY3DView.h"

#define kw_2  [UIScreen mainScreen].bounds.size.width / 2
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic) CGFloat angleRatio;
@property (nonatomic) CGFloat rotationX;
@property (nonatomic) CGFloat rotationY;
@property (nonatomic) CGFloat rotationZ;
@property (nonatomic) CGFloat translateX;
@property (nonatomic) CGFloat translateY;

@property (nonatomic, assign) NSInteger oldItem;

@end

@implementation ViewController

static NSString *identifier = @"TY3DCollectionViewCell";
static int tagValue = 200;

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"image1.jpeg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpeg",@"image6.jpg",@"image7.jpeg",@"image8.jpeg",@"image9.jpeg",@"image10.jpg"];
    }
    return _dataArr;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        // 定义大小
        layout.itemSize = CGSizeMake(kw_2, self.view.bounds.size.width - 60);
        // 设置最小行间距
        layout.minimumLineSpacing = 0;
        // 设置垂直间距
        layout.minimumInteritemSpacing = 2;
        // 设置滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.tag = tagValue;
        _collectionView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([TY3DCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview: self.collectionView];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TY3DCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:self.dataArr[indexPath.item]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.bounds.size.width/4, 200);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(self.view.bounds.size.width/4, 200);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.tag != tagValue) {
        return;
    }

    int n = scrollView.contentOffset.x / self.view.bounds.size.width * 2;
    CGFloat offsetX = scrollView.contentOffset.x - kw_2 * n;
    if (offsetX > kw_2 / 2) {
        self.collectionView.contentOffset = CGPointMake(kw_2 * (n + 1), 0);
    }else{
        self.collectionView.contentOffset = CGPointMake(kw_2 * n, 0);
    }
    NSLog(@"偏移量 %d == %f",n,self.collectionView.contentOffset.x);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.tag != tagValue) {
        return;
    }
    
    int n = scrollView.contentOffset.x / self.view.bounds.size.width * 2;
    CGFloat offsetX = scrollView.contentOffset.x - kw_2 * n;
    if (offsetX > kw_2/2 ) {
        self.collectionView.contentOffset = CGPointMake(kw_2 * (n + 1), 0);
    }else{
        self.collectionView.contentOffset = CGPointMake(kw_2 * n, 0);
    }
   NSLog(@"偏移量 %d == %f",n,self.collectionView.contentOffset.x);
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item > self.oldItem) { //向左
       
    }else{  //向右
        
    }
    self.oldItem = indexPath.item;
    
    NSLog(@" 当前 item == %ld",(long)indexPath.item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
