@interface CKTranscriptController : NSObject

- (void)showKeyboardForReply;

@end

%hook CKTranscriptController

- (void)viewDidAppear:(BOOL)arg1 {
    %orig(arg1);
    
    [self showKeyboardForReply];
}

%end