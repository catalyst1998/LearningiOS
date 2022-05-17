//
//  GTListLoader.m
//  ViewDemo_52
//
//  Created by Goggles on 2022/5/12.
//

#import "GTListLoader.h"
#import "AFNetWorking.h"
#import "GTListItem.h"
#import "GTSongItem.h"

@implementation GTListLoader
/*
   网络请求方法
 */
//
- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    //先从本地去数据
    NSArray<GTListItem *> *listdata = [self _readDataFromLocal];
    if(listdata){
        finishBlock(YES,listdata);
    }
    

	//再利用系统的NSURLSession发送网络请求
//    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";

	NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";

	NSURL *listURL = [NSURL URLWithString:urlString];

//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];

	NSURLSession *session = [NSURLSession sharedSession];
    
//    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:listRequest];

    __weak typeof(self) wself = self;
    NSURLSessionDataTask *dataTsk2 = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(wself) strongSelf = wself;
                                             NSError *jsonError;
                                             id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"");
        
#warning 类型检查
                                             NSArray *dataArray = [(NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"] objectForKey:@"data"];
        
                                             NSMutableArray *listItemArray = [[NSMutableArray alloc] init];

                                             for (NSDictionary *info in dataArray) {
                             GTListItem *listItem = [[GTListItem alloc] init];
                             [listItem dealWithDictionary:info];
                             [listItemArray addObject:listItem];
                         }
        
        [strongSelf _archiveListDataWithArray:listItemArray.copy];

                                             //放到主线程
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                    if(finishBlock) {
                                        finishBlock(error == nil,listItemArray.copy);
                                    }
                                });

                     }];

	[dataTsk2 resume];

	NSLog(@"");

	/*
	   AFNetworking使用
	 */

//    [[AFHTTPSessionManager manager] GET:@"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json"
//    parameters:nil
//    headers:nil
//    progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"");
//    }
//    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    }
//    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
}


#pragma mark - private methods

/// 读取本地数据，通过NSKeyedUnarchiver反编码数据
-(NSArray<GTListItem *> *)_readDataFromLocal{
    //获取cache文件夹的路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];

    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSData *readListData = [fileManager contentsAtPath:listDataPath];

    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class],nil] fromData:readListData error:nil];

    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count]>0){
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    return nil;
}


/// 将网络请求的数据，通过NSKeyedArchiver方式将数据编码后保存到本地
/// @param array 数据
-(void)_archiveListDataWithArray:(NSArray <GTListItem *> *) array{
    //获取cache文件夹的路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //利用文件管理器在在cache下建一个GTData文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatDirError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatDirError];
    
    //GTData下创建一个叫做list的文件，利用文件管理器保存从网络请求回来的，经过NSKeyedArchiver编码过的二进制数据
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];

    NSData *listData =  [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
//    //读取数据，并且进行反序列化
//    NSData *readListData = [fileManager contentsAtPath:listDataPath];
//
//   id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class],nil] fromData:readListData error:nil];
//
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//
//    NSData *test = [[NSUserDefaults standardUserDefaults] stringForKey:@"listData"];
//
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class],nil] fromData:test error:nil];
//
    
//    查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
//    //删除文件
//    if(fileExist){
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
    //在文件中追加数据
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData: [@"edhs" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [fileHandle synchronizeFile];
//    [fileHandle closeFile];
    
    NSLog(@"");
    
}


@end
