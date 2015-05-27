//
//  NGCache.h
//  SurfTumblr
//
//  Created by Le Ngoc Giang on 5/27/15.
//
//

#import <Foundation/Foundation.h>

typedef void (^NGCacheQueryCompletedBlock)(NSData *data);

@interface NGCache : NSObject

+ (instancetype)sharedInstance;
- (void)storeImageData:(NSData *)imageData forKey:(NSString *)key;
- (void)queryImageForKey:(NSString *)key done:(NGCacheQueryCompletedBlock)doneBlock;
@end
