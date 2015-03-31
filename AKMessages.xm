#import <UIKit/UIKit.h>

@interface UIKeyboardInputMode : NSObject
- (BOOL)isExtensionInputMode;
@end

@interface UIKeyboardInputModeController : NSObject
+ (UIKeyboardInputModeController *)sharedInputModeController;
- (UIKeyboardInputMode *)currentInputMode;
@end

@interface CKTranscriptController : NSObject
- (void)showKeyboardForReply;
@end

static BOOL currentKeyboardIsThirdParty()
{
    return [[[UIKeyboardInputModeController sharedInputModeController] currentInputMode] isExtensionInputMode];
}


%hook CKTranscriptController

- (void)viewDidAppear:(BOOL)arg1 {
    %orig(arg1);
    
    if (currentKeyboardIsThirdParty()) {
        [self showKeyboardForReply];
    }
}


- (void)viewWillAppear:(BOOL)arg1 {
    %orig(arg1);
    
    if (!currentKeyboardIsThirdParty()) {
        [self showKeyboardForReply];
    }
}

%end