#import "VKThemeManager.h"

@interface VKThemeManager()
@property (nonatomic, assign, getter=isFixed) BOOL fixed;
@end

SpecBegin(VKThemeManager)

describe(@"appendThemes:", ^{
  __block NSDictionary *plistThemes = VKSharedThemeManager.database;
  __block NSDictionary *testDefaultThemes = @{@"testColor1":@{
                                                  @"theme1":@"a5a6a5",
                                                  @"theme2":@"f1f1f1"
                                                  },
                                              @"testColor2":@{
                                                  @"theme1":@"bbbbbb",
                                                  @"theme2":@"ffffff"
                                                  }
                                              };
  __block NSDictionary *appendThemes = @{@"testColor1": @{
                                             @"theme1": @"111111",
                                             @"theme2": @"222222",
                                             },
                                         @"testColor3": @{
                                             @"theme1": @"311111",
                                             @"theme2": @"322222",
                                             }
                                         };
  beforeEach(^{
    VKSharedThemeManager.database = testDefaultThemes;
  });
  
  it(@"should append and override", ^{
    [VKSharedThemeManager appendThemes:appendThemes fix:NO];
    expect(VKSharedThemeManager.database).to.equal(@{@"testColor1": @{
                                                         @"theme1": @"111111",
                                                         @"theme2": @"222222"
                                                         },
                                                     @"testColor2":@{
                                                         @"theme1":@"bbbbbb",
                                                         @"theme2":@"ffffff"
                                                         },
                                                     @"testColor3": @{
                                                         @"theme1": @"311111",
                                                         @"theme2": @"322222"
                                                         }
                                                     });
  });
  it(@"should not change after fixed", ^{
    [VKSharedThemeManager appendThemes:nil fix:YES];
    [VKSharedThemeManager appendThemes:appendThemes fix:NO];
    expect(VKSharedThemeManager.database).to.equal(testDefaultThemes);
  });
  
  afterEach(^{
    VKSharedThemeManager.database = plistThemes;
    VKSharedThemeManager.fixed = NO;
  });
});

SpecEnd