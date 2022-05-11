//
//  ItemStore.m
//  Homepwner
//
//  Created by Goggles on 2022/5/10.
//

#import "ItemStore.h"
#import "Item.h"
@interface ItemStore ()
@property (nonatomic) NSMutableArray* privateItems;
@end
@implementation ItemStore
+ (instancetype)sharedStore{
    static ItemStore *shareStoer = nil;
    if(!shareStoer){
        shareStoer = [[ItemStore alloc] initPrivate];
    }
    return shareStoer;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:@"singleton" reason:@"use initPrivate" userInfo:nil];
    return nil;
}

-(instancetype)initPrivate{
    self  = [super init];
    if(self){
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems{
    return self.privateItems;
}

- (Item *)createItem{
    Item* newItem = [Item randomItem];
    [self.privateItems addObject:newItem];
    return newItem;
    }

@end
