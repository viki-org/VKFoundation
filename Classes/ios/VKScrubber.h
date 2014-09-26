#import "VKSlider.h"

@class VKScrubber;

@protocol VKScrubberDelegate <NSObject>
@optional
- (void)scrubberDidBeginScrubbing:(VKScrubber*)scrubber;
- (void)scrubberDidEndScrubbing:(VKScrubber*)scrubber;
- (void)scrubberValueDidChange:(VKScrubber*)scrubber;
@end

@interface VKScrubber : VKSlider

@property (nonatomic, weak) id <VKScrubberDelegate> delegate;

@end


