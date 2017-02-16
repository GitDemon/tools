//
//  JOYCommonBt.h
//  SmartHome
//
//  Created by chenjoy on 14-3-22.
//  Copyright (c) 2014年 joy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JOYCommonBt;
@protocol JOYCommonBtDelegate <NSObject>

- (void)btLongPress:(JOYCommonBt *)bt;

@end

@interface JOYCommonBt : UIButton

@property (nonatomic, retain) NSIndexPath *indexPath;
@property (nonatomic, retain) NSNumber *index;
@property (nonatomic, retain) id other;
@property (nonatomic, assign) BOOL bAnimate;
@property (nonatomic, assign) id<JOYCommonBtDelegate> longPressDelegate;

- (void)addLongPressWith:(id<JOYCommonBtDelegate>) delegate;
@end
