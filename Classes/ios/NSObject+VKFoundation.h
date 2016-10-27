//
//  Created by Viki.
//  Copyright (c) 2014 Viki Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 notification that gets sent when an exception is raised in -valueForKeyPathWithNilCheck:
 */
extern NSString * const VKFoundationValueForKeyPathWithNilCheckExceptionNotification;

@interface NSObject (VKFoundation)

- (id)preferredValueForKey:(NSString*)key languageCode:(NSString*)languageCode;
- (id)valueForKeyPathWithNilCheck:(NSString *)keyPath;

@end

void RUN_ON_UI_THREAD(dispatch_block_t block);

NS_ASSUME_NONNULL_END
