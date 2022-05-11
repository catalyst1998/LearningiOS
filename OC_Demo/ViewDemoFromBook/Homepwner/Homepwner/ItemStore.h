//
//  ItemStore.h
//  Homepwner
//
//  Created by Goggles on 2022/5/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Item;
@interface ItemStore : NSObject
@property (nonatomic,readwrite)NSArray *allItems;

+ (instancetype) sharedStore;

- (Item *)createItem;
@end

NS_ASSUME_NONNULL_END
