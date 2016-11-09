//
//  Created by Viki.
//  Copyright (c) 2014 Viki Inc. All rights reserved.
//

#import "NSObject+VKFoundation.h"
#import "VKFoundationLib.h"

@implementation NSObject (VKFoundation)

- (id)preferredValueForKey:(NSString*)key languageCode:(NSString*)languageCode {
  id defaultValue = [self valueForKeyPathWithNilCheck:[NSString stringWithFormat:@"%@.%@", key, @"en"]];
  id preferredValue = nil;
  if ([languageCode isEqualToString:@"en"]) {
    preferredValue = defaultValue;
  } else {
    preferredValue = [self valueForKeyPathWithNilCheck:[NSString stringWithFormat:@"%@.%@", key, languageCode]];
    if (preferredValue) {
      if ([preferredValue isKindOfClass:[NSString class]]) {
        NSString* preferredString = (NSString*)preferredValue;
        if ([preferredString length] == 0) {
          preferredValue = defaultValue;
        }
      }
    } else {
      preferredValue = defaultValue;
    }
  }
  return preferredValue;
}

- (id)valueForKeyPathWithNilCheck:(NSString *)keyPath {
  if (![keyPath isKindOfClass:[NSString class]]) {
    return nil;
  }
  
  @try {
    // Guard against crash if one of the keyPath descendant is not a key value coding-compliant.
    // e.g. key is @"aps.alert.body", but dictionary is @{@"aps": @{@"alert": @"yey crash"} }
    if ([self respondsToSelector:@selector(valueForKeyPath:)]) {
      return NILIFNULL([self valueForKeyPath:keyPath]);
    } else return nil;
  } @catch (NSException *exception) {
    [[NSNotificationCenter defaultCenter] postNotificationName:VKFoundationValueForKeyPathWithNilCheckExceptionNotification object:self userInfo:@{@"key_path": keyPath, @"exception": exception}];
    return nil;
  }
}

@end

void RUN_ON_UI_THREAD(dispatch_block_t block) {
  dispatch_async(dispatch_get_main_queue(), block);
}
