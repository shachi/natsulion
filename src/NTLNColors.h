#import <Cocoa/Cocoa.h>

#define NTLN_COLORS_LIGHT_SCHEME_DEFAULT_ALPHA 0.8f
#define NTLN_COLORS_DARK_SCHEME_DEFAULT_ALPHA 0.6f

@interface NTLNColors : NSObject {
    NSColor *_colorForLink;
    NSColor *_colorForHighlightedLink;
    NSColor *_colorForText;
    NSColor *_colorForHighlightedText;
    NSColor *_colorForSubText;
    NSColor *_colorForSubText2;
    
    NSColor *_colorForReply;
    NSColor *_colorForHighlightedReply;
    NSColor *_colorForProbableReply;
    NSColor *_colorForHighlightedProbableReply;
    NSColor *_colorForHighlightedBackground;
    NSColor *_colorForBackground;
    NSColor *_colorForWarning;
    NSColor *_colorForError;
	
	NSColor *_colorForInputText;
	NSColor *_colorForInputTextBackground;
	
    NSArray *_controlAlternatingRowBackgroundColors;
}
+ (id) instance;
- (void) notifyConfigurationChange;
#pragma mark Foreground Color
- (NSColor*) colorForLink;
- (NSColor*) colorForHighlightedLink;
- (NSColor*) colorForText;
- (NSColor*) colorForHighlightedText;
- (NSColor*) colorForSubText;
- (NSColor*) colorForSubText2;
- (NSColor*) colorForInputText;

#pragma mark Background Color
- (NSColor*) colorForReply;
- (NSColor*) colorForHighlightedReply;
- (NSColor*) colorForProbableReply;
- (NSColor*) colorForHighlightedProbableReply;
- (NSColor*) colorForHighlightedBackground;
- (NSColor*) colorForBackground;
- (NSColor*) colorForWarning;
- (NSColor*) colorForError;
- (NSColor*) colorForInputTextBackground;

- (NSArray*) controlAlternatingRowBackgroundColors;
@end
