//
//  GTListItem.h
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 结构化列表数据
@interface GTListItem : NSObject <NSSecureCoding>


@property(nonatomic,readwrite,copy) NSString *category;
@property(nonatomic,readwrite,copy) NSString *uniqueKey;
@property(nonatomic,readwrite,copy) NSString *date;
@property(nonatomic,readwrite,copy) NSString *picUrl;
@property(nonatomic,readwrite,copy) NSString *title;
@property(nonatomic,readwrite,copy) NSString *authorName;
@property(nonatomic,readwrite,copy) NSString *articleUrl;

-(void) dealWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
