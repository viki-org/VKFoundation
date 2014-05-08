#import "VKUtility.h"

SpecBegin(VKUtility)

describe(@"floatToIntString:", ^{
  it(@"should run correctly", ^{
    expect([VKSharedUtility floatToIntString:0.1f]).to.equal(@"0");
    expect([VKSharedUtility floatToIntString:0.9999999f]).to.equal(@"0");
    expect([VKSharedUtility floatToIntString:1.0f]).to.equal(@"1");
    expect([VKSharedUtility floatToIntString:11111.1f]).to.equal(@"11111");
    expect([VKSharedUtility floatToIntString:11111.9f]).to.equal(@"11111");
    expect([VKSharedUtility floatToIntString:-0.1f]).to.equal(@"0");
    expect([VKSharedUtility floatToIntString:-0.9999999f]).to.equal(@"0");
    expect([VKSharedUtility floatToIntString:-1.0f]).to.equal(@"-1");
    expect([VKSharedUtility floatToIntString:-11111.1f]).to.equal(@"-11111");
    expect([VKSharedUtility floatToIntString:-11111.9f]).to.equal(@"-11111");
  });
});
describe(@"doubleToIntString:", ^{
  it(@"should run correctly", ^{
    expect([VKSharedUtility doubleToIntString:0l]).to.equal(@"0");
    expect([VKSharedUtility doubleToIntString:1l]).to.equal(@"1");
    expect([VKSharedUtility doubleToIntString:2147483647l]).to.equal(@"2147483647");
    expect([VKSharedUtility doubleToIntString:-1l]).to.equal(@"-1");
    expect([VKSharedUtility doubleToIntString:-2147483648l]).to.equal(@"-2147483648");
  });
});
xdescribe(@"readableValueWithBytes:", ^{
});
xdescribe(@"parseURLParams:", ^{
});
xdescribe(@"timeStringFromSecondsValue:", ^{
});

SpecEnd