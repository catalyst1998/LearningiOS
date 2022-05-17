//
//  GTListItem.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/13.
//

#import "GTListItem.h"


@implementation GTListItem

#pragma mark - NSSecureCoding

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.category = [aDecoder decodeObjectForKey:@"catagory"];
        
        self.uniqueKey = [aDecoder decodeObjectForKey:@"uniqueKey"];

        self.date = [aDecoder decodeObjectForKey:@"date"];

        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];

        self.title = [aDecoder decodeObjectForKey:@"title"];

        self.authorName = [aDecoder decodeObjectForKey:@"authorName"];
        
        self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.category forKey:@"category"];
    
    [aCoder encodeObject:self.uniqueKey forKey:@"uniqueKey"];

    [aCoder encodeObject:self.date forKey:@"date"];

    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];

    [aCoder encodeObject:self.title forKey:@"title"];

    [aCoder encodeObject:self.authorName forKey:@"authorName"];

    [aCoder encodeObject:self.articleUrl forKey:@"articleUrl"];

}

+ (BOOL)supportsSecureCoding{
    return YES;
}


#pragma mark - public method

- (void)dealWithDictionary:(NSDictionary *)dictionary {
    
#warning 类型是否匹配

	self.category = [dictionary objectForKey:@"category"];
	self.uniqueKey = [dictionary objectForKey:@"uniqueKey"];
	self.date = [dictionary objectForKey:@"date"];
//	self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.picUrl = @"http://p1.music.126.net/W1kczDCB4-r-uNAznD1ljg==/108851651165850.jpg";
	self.title = [dictionary objectForKey:@"title"];
	self.authorName = [dictionary objectForKey:@"author_name"];
	self.articleUrl = [dictionary objectForKey:@"url"];
}
@end
