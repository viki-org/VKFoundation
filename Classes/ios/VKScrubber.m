#import "VKScrubber.h"

@interface VKScrubber ()
@property (nonatomic, strong) UIImageView *scrubberGlow;
@end

@implementation VKScrubber

@synthesize delegate = _delegate;

- (void) initialize {

  [self setMaximumTrackImage:[[UIImage imageNamed:@"v3_scrubber_track_min_4_4.png"]
      resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)]
      forState:UIControlStateNormal];
  [self setMinimumTrackImage:[[UIImage imageNamed:@"v3_scrubber_track_max_4_4.png"]
      resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)]
      forState:UIControlStateNormal];
  [self setThumbImage:[UIImage imageNamed:@"v3_scrubber_thumb.png"]
      forState:UIControlStateNormal];
  
  [self addTarget:self action:@selector(scrubbingDidBegin) forControlEvents:UIControlEventTouchDown];
  [self addTarget:self action:@selector(scrubbingDidEnd) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside|UIControlEventTouchCancel];
  [self addTarget:self action:@selector(scrubberValueChanged) forControlEvents:UIControlEventValueChanged];
  
  self.exclusiveTouch = YES;
}

- (void)scrubbingDidBegin {
  [self.delegate scrubberDidBeginScrubbing:self];
}

- (void)scrubbingDidEnd {
  [self.delegate scrubberDidEndScrubbing:self];
}

- (void)scrubberValueChanged {
  [self.delegate scrubberValueDidChange:self];
}

- (void)setValue:(float)value animated:(BOOL)animated {
  [super setValue:value animated:animated];
  [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
