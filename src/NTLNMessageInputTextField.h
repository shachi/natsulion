#import <Cocoa/Cocoa.h>

enum NTLNMessageInputTextFieldLengthState {
    NTLN_LENGTH_STATE_NORMAL,
    NTLN_LENGTH_STATE_WARNING,
    NTLN_LENGTH_STATE_MAXIMUM
};

@protocol NTLNMessageInputTextFieldCallback
- (void) messageInputTextFieldResized:(float)heightDelta;
- (void) messageInputTextFieldChanged:(int)length state:(enum NTLNMessageInputTextFieldLengthState)state;
@end

@interface NTLNMessageInputTextField : NSTextField {
    NSObject<NTLNMessageInputTextFieldCallback> *_callback;
    float _defaultHeight;
    NSColor *_backgroundColor;
	NSColor *_textColor;
    BOOL _frameSizeInternalChanging;
    int _warningLength;
    int _maxLength;
    enum NTLNMessageInputTextFieldLengthState _lengthState;
    NSCompositingOperation _backgroundCompositePolicy;
    BOOL _firstResponder;
}

- (void) setLengthForWarning:(int)warning max:(int)max;
- (void) setCallback:(NSObject<NTLNMessageInputTextFieldCallback>*)callback;
- (void) updateState;
- (void) focusAndLocateCursorEnd;

// TODO: this assumes that reply is specified in a message like Twitter.
- (void) addReplyTo:(NSString*)username;

@end
