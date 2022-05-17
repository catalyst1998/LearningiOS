//
//  GTSongItem.h
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTSongItem : NSObject

//@property(nonatomic,readwrite,copy) NSString *songID;
@property(nonatomic,readwrite,copy) NSString *name;
//@property(nonatomic,readwrite,copy) NSString *mark;
@property(nonatomic,readwrite,copy) NSString *artist;
@property(nonatomic,readwrite,copy) NSString *picUrl;

//@property(nonatomic,readwrite,copy) NSString *title;
//@property(nonatomic,readwrite,copy) NSString *authorName;
//@property(nonatomic,readwrite,copy) NSString *articleUrl;

-(void) dealWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
