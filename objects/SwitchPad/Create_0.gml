/// @description Initialize switchpad.

mPadId = 0; // should be set from obj_menu

enum eState
{	Init
,	Running
,	Cleanup
};

mState = eState.Init;
mHasInit = false;
mType = switch_controller_handheld;
mJoyCons = [ false, false ];
mColour = c_white;

mXTimer = 0;
mYTimer = 0;