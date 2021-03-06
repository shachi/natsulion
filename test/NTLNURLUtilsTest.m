#import "NTLNURLUtilsTest.h"
#import "NTLNURLUtils.h"

@implementation NTLNURLUtilsTest

- (void) testURL1 {
    NSString *INPUT = @"hello http://www.physalis.net world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByURL:INPUT];
    STAssertEquals([results count], (NSUInteger)3, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"http://www.physalis.net", nil);
    STAssertEqualObjects([results objectAtIndex:2], @" world", @"[%@]", nil);
}

- (void) testURL2 {
    NSString *INPUT = @"hello http://www.physalis.net abc http://www.yahoo.co.jp world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByURL:INPUT];
    STAssertEquals([results count], (NSUInteger)5, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"http://www.physalis.net", nil);
    STAssertEqualObjects([results objectAtIndex:2], @" abc ", nil);
    STAssertEqualObjects([results objectAtIndex:3], @"http://www.yahoo.co.jp", nil);
    STAssertEqualObjects([results objectAtIndex:4], @" world", nil);
}

- (void) testStartsWithURL {
    NSString *INPUT = @"http://www.physalis.net world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByURL:INPUT];
    STAssertEquals([results count], (NSUInteger)2, nil);
    STAssertEqualObjects([results objectAtIndex:0], @"http://www.physalis.net", nil);
    STAssertEqualObjects([results objectAtIndex:1], @" world", nil);
}

- (void) testEndsWithURL {
    NSString *INPUT = @"hello http://www.physalis.net";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByURL:INPUT];
    STAssertEquals([results count], (NSUInteger)2, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"http://www.physalis.net", nil);
}

- (void) testSign {
    NSString *INPUT = @"hello http://www.physalis.net/ss?wicket:interface=:152:leftPanel:leftPanel-3:tag:22:link::ILinkListener world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByURL:INPUT];
    STAssertEquals([results count], (NSUInteger)3, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"http://www.physalis.net/ss?wicket:interface=:152:leftPanel:leftPanel-3:tag:22:link::ILinkListener", nil);
    STAssertEqualObjects([results objectAtIndex:2], @" world", @"[%@]", nil);
}

- (void) testJapaneseCharacters {
    NSString *INPUT = @"hello http://www.physalis.net同じエントリのコメント欄 world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByURL:INPUT];
    STAssertEquals([results count], (NSUInteger)3, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"http://www.physalis.net", nil);
    STAssertEqualObjects([results objectAtIndex:2], @"同じエントリのコメント欄 world", @"[%@]", nil);
}

- (void) testID0 {
    NSString *INPUT = @"hello @ world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByID:INPUT];
    STAssertEquals([results count], (NSUInteger)3, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"@", nil);
    STAssertEqualObjects([results objectAtIndex:2], @" world", @"[%@]", nil);
}

- (void) testID1 {
    NSString *INPUT = @"hello @akr world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByID:INPUT];
    STAssertEquals([results count], (NSUInteger)3, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"@akr", nil);
    STAssertEqualObjects([results objectAtIndex:2], @" world", @"[%@]", nil);
}

- (void) testAll1 {
    NSString *INPUT = @"hello http://www.yahoo.com@akr world";
    NTLNURLUtils *utils = [[NTLNURLUtils alloc] init];
    NSArray *results = [utils tokenizeByAll:INPUT];
    STAssertEquals([results count], (NSUInteger)4, nil);
    STAssertEqualObjects((NSString*)[results objectAtIndex:0], @"hello ", nil);
    STAssertEqualObjects([results objectAtIndex:1], @"http://www.yahoo.com", nil);
    STAssertEqualObjects([results objectAtIndex:2], @"@akr", nil);
    STAssertEqualObjects([results objectAtIndex:3], @" world", @"[%@]", nil);
}

- (void) testIsWhiteSpace1 {
    STAssertTrue([[NTLNURLUtils utils] isWhiteSpace:@" "], nil);
    STAssertTrue([[NTLNURLUtils utils] isWhiteSpace:@"  "], nil);
    STAssertTrue([[NTLNURLUtils utils] isWhiteSpace:@""], nil);
    STAssertTrue([[NTLNURLUtils utils] isWhiteSpace:nil], nil);
    STAssertFalse([[NTLNURLUtils utils] isWhiteSpace:@"a"], nil);
    STAssertFalse([[NTLNURLUtils utils] isWhiteSpace:@"a "], nil);
    STAssertFalse([[NTLNURLUtils utils] isWhiteSpace:@" a"], nil);
    STAssertFalse([[NTLNURLUtils utils] isWhiteSpace:@" a "], nil);
}
@end
