//
//  GTSongLoader.h
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/13.
//

#import <Foundation/Foundation.h>

@class GTSongItem;

typedef void(^GTSongLoaderFinishBlock)(BOOL success,NSArray<GTSongItem *> * _Nonnull dataArray);
NS_ASSUME_NONNULL_BEGIN

@interface GTSongLoader : NSObject

-(void) loadSongDataWithFinishBlock:(GTSongLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
