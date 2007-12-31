#import "TwitterStatusView.h"

static NSColor *_viewBackgroundColorReply;
static NSColor *_viewHighlightedBackgroundColorReply;
static NSColor *_viewBackgroundColorReplyProbable;
static NSColor *_viewHighlightedBackgroundColorReplyProbable;

@implementation TwitterStatusView

+ (void) initialize {
    _viewBackgroundColorReply = [[NSColor colorWithDeviceHue:0 saturation:0.22 brightness:1 alpha:1] retain];
    _viewHighlightedBackgroundColorReply = [[NSColor colorWithDeviceHue:0 saturation:0.22 brightness:0.7 alpha:1] retain];
    _viewBackgroundColorReplyProbable = [[NSColor colorWithDeviceHue:0 saturation:0.10 brightness:1 alpha:1] retain];
    _viewHighlightedBackgroundColorReplyProbable = [[NSColor colorWithDeviceHue:0 saturation:0.10 brightness:0.7 alpha:1] retain];
}

- (void) setTwitterStatus:(TwitterStatus*)status {
    _status = status;
    [_status retain];
}

- (NSView *)hitTest:(NSPoint)aPoint {
    if (_highlighted) {
        return [super hitTest:aPoint];
    }
    return self;
}

- (void) dealloc {
    [_backgroundColor release];
    [_status release];
    [super dealloc];
}

- (void) highlight {
    _highlighted = TRUE;
    
    switch ([_status replyType]) {
        case MESSAGE_REPLY_TYPE_DIRECT:
        case MESSAGE_REPLY_TYPE_REPLY:
            _backgroundColor = _viewHighlightedBackgroundColorReply;
            break;
        case MESSAGE_REPLY_TYPE_REPLY_PROBABLE:
            _backgroundColor = _viewHighlightedBackgroundColorReplyProbable;
            break;
        case MESSAGE_REPLY_TYPE_NORMAL:
        default:
            break;
    }
    
}

- (void) lowlight {
    _highlighted = FALSE;

    switch ([_status replyType]) {
        case MESSAGE_REPLY_TYPE_DIRECT:
        case MESSAGE_REPLY_TYPE_REPLY:
            _backgroundColor = _viewBackgroundColorReply;
            break;
        case MESSAGE_REPLY_TYPE_REPLY_PROBABLE:
            _backgroundColor = _viewBackgroundColorReplyProbable;
            break;
        case MESSAGE_REPLY_TYPE_NORMAL:
        default:
            break;
    }
}

- (void)drawRect:(NSRect)aRect {
    if (!_backgroundColor) {
        return;
    }
    [_backgroundColor set];
    NSRectFill(aRect);
}

@end