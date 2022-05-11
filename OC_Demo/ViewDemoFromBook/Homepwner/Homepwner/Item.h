//
//  Iterm.h
//  Homepwner
//
//  Created by Goggles on 2022/5/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject
@property (nonatomic,strong) NSString *itemName;
@property (nonatomic,strong) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic,strong) NSDate *dateCreated;
- (instancetype) init;
- (instancetype) initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name valueInDollars :(int) value serialNumber:(NSString *)number;
+ (instancetype) randomItem;
@end

NS_ASSUME_NONNULL_END

