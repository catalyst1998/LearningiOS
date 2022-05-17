//
//  GTListLoader.h
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/12.
//

#import <Foundation/Foundation.h>
@class GTListItem;
@class GTSongItem;
typedef void(^GTListLoaderFinishBlock)(BOOL success,NSArray<GTListItem *> * _Nonnull dataArray);

NS_ASSUME_NONNULL_BEGIN

/// 列表请求
@interface GTListLoader : NSObject

-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
