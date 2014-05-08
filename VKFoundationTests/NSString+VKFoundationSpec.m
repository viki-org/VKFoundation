#import "NSString+VKFoundation.h"

SpecBegin(NSString_VKFoundation)

describe(@"stripHtml", ^{
  it(@"should strip HTML", ^{
    expect([@"it has <b>HTML</b> part" stripHtml]).to.equal(@"it has HTML part");
    expect([@"it doesn't have HTML part" stripHtml]).to.equal(@"it doesn't have HTML part");
  });
});

describe(@"substringWithMinLength", ^{
  it(@"should strip HTML", ^{
    expect([@"01234567890" substringWithMinLength:10]).to.equal(@"0123456789");
    expect([@"0123456789" substringWithMinLength:10]).to.equal(@"0123456789");
    expect([@"0123456789" substringWithMinLength:9]).to.equal(@"012345678");
    expect([@"0123456789" substringWithMinLength:0]).to.equal(@"");
    expect([@"0123456789" substringWithMinLength:1]).to.equal(@"0");
  });
});

describe(@"isEmpty", ^{
  it(@"should return YES if string is 0 length or all whitespace", ^{
    expect([@"1" isEmpty]).to.equal(NO);
    expect([@"" isEmpty]).to.equal(YES);
    expect([@" " isEmpty]).to.equal(YES);
    expect([@" \n" isEmpty]).to.equal(YES);
  });
});

SpecEnd