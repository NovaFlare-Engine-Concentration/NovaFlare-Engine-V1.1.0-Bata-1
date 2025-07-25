package android;

import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
//import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import android.flixel.FlxButton;

class FlxVirtualPad extends FlxSpriteGroup {
	//Actions
	public var buttonA:FlxButton;
	public var buttonB:FlxButton;
	public var buttonC:FlxButton;
	public var buttonD:FlxButton;
	public var buttonE:FlxButton;
	public var buttonF:FlxButton;
	public var buttonG:FlxButton;
	public var buttonV:FlxButton;
	public var buttonX:FlxButton;
	public var buttonY:FlxButton;
	public var buttonZ:FlxButton;
	

	//DPad
	public var buttonLeft:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;
	public var buttonDown:FlxButton;

	//PAD DUO MODE
	public var buttonLeft2:FlxButton;
	public var buttonUp2:FlxButton;
	public var buttonRight2:FlxButton;
	public var buttonDown2:FlxButton;
    
    public var buttonCELeft:FlxButton;
	public var buttonCEUp:FlxButton;
	public var buttonCERight:FlxButton;
	public var buttonCEDown:FlxButton;
	public var buttonCEG:FlxButton;
	
	public var buttonCEUp_M:FlxButton;
	public var buttonCEDown_M:FlxButton;
	
	public var dPad:FlxSpriteGroup;
	public var actions:FlxSpriteGroup;

	public var orgAlpha:Float = 0.75;
	public var orgAntialiasing:Bool = true;

	public function new(?DPad:FlxDPadMode, ?Action:FlxActionMode, ?alphaAlt:Float = 0.75, ?antialiasingAlt:Bool = true) {
		super();

		orgAntialiasing = antialiasingAlt;
		orgAlpha = ClientPrefs.data.VirtualPadAlpha;

		dPad = new FlxSpriteGroup();
		dPad.scrollFactor.set();

		actions = new FlxSpriteGroup();
		actions.scrollFactor.set();

		buttonA = new FlxButton(0, 0);
		buttonB = new FlxButton(0, 0);
		buttonC = new FlxButton(0, 0);
		buttonD = new FlxButton(0, 0);
		buttonE = new FlxButton(0, 0);
		buttonF = new FlxButton(0, 0);
		buttonG = new FlxButton(0, 0);
		buttonV = new FlxButton(0, 0);
		buttonX = new FlxButton(0, 0);
		buttonY = new FlxButton(0, 0);
		buttonZ = new FlxButton(0, 0);

		buttonLeft = new FlxButton(0, 0);
		buttonUp = new FlxButton(0, 0);
		buttonRight = new FlxButton(0, 0);
		buttonDown = new FlxButton(0, 0);

		buttonLeft2 = new FlxButton(0, 0);
		buttonUp2 = new FlxButton(0, 0);
		buttonRight2 = new FlxButton(0, 0);
		buttonDown2 = new FlxButton(0, 0);
        
        buttonCELeft = new FlxButton(0, 0);
		buttonCEUp = new FlxButton(0, 0);
		buttonCERight = new FlxButton(0, 0);
		buttonCEDown = new FlxButton(0, 0);
		buttonCEG = new FlxButton(0, 0);
		
		buttonCEUp_M = new FlxButton(0, 0);
		buttonCEDown_M = new FlxButton(0, 0);
		
		switch (DPad){
			case UP_DOWN:
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
			case LEFT_RIGHT:
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "right", 0xFF0000)));
			case UP_LEFT_RIGHT:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 81 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "right", 0xFF0000)));
			case FULL:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 81 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, 44 * 3, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
			case RIGHT_FULL:
				dPad.add(add(buttonUp = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
			case DUO:
				dPad.add(add(buttonUp = createButton(42 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 66 - 81 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(82 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown = createButton(42 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonUp2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonLeft2 = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight2 = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 127, "right", 0xFF0000)));
				dPad.add(add(buttonDown2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
			case CHART_EDITOR:
			    //orgAlpha = 0.75;
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft = createButton(42 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "right", 0xFF0000)));								
			case MenuCharacterEditor:
			    //orgAlpha = 0.75;
				dPad.add(add(buttonUp = createButton(220, FlxG.height - 85 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(220, FlxG.height - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft = createButton(220 + 42 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(220 + 42 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "right", 0xFF0000)));	
			case DialogueCharacterEditor:
			    //orgAlpha = 0.75;
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft = createButton(42 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "right", 0xFF0000)));					
				dPad.add(add(buttonUp2 = createButton(0 * 3, FlxG.height - 165 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown2 = createButton(0 * 3, FlxG.height - 125 * 3, 44 * 3, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft2 = createButton(42 * 3, FlxG.height - 165 * 3, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight2 = createButton(42 * 3, FlxG.height - 125 * 3, 44 * 3, 127, "right", 0xFF0000)));				
			case MainMenuState:
				dPad.add(add(buttonUp = createButton(FlxG.width - 44 * 3, FlxG.height - 165 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 127, "down", 0x00FFFF)));		
            case NoteSplashDebugState:
			    //orgAlpha = 0.75;
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft = createButton(42 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "right", 0xFF0000)));					
				dPad.add(add(buttonUp2 = createButton(84 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonDown2 = createButton(84 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "down", 0x00FFFF)));
				dPad.add(add(buttonLeft2 = createButton(126 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "left", 0xFF00FF)));
				dPad.add(add(buttonRight2 = createButton(126 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "right", 0xFF0000)));					
			case NONE:
		}

		switch (Action){
			case A:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));
			case B:
				actions.add(add(buttonB = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));
			case D:
				actions.add(add(buttonD = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 127, "d", 0x0078FF)));						
			case A_B:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));
			case A_B_C:
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));				
			case A_B_E:
				actions.add(add(buttonE = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "e", 0xFF7D00)));   
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));
 			case A_B_X_Y:
				actions.add(add(buttonY = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "y", 0x4A35B9)));
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "x", 0x99062D)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));	 			               
			case A_B_C_X_Y:		
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "y", 0x4A35B9)));
				actions.add(add(buttonX = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "x", 0x99062D)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));				
			case A_B_C_X_Y_Z:
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "x", 0x99062D)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "z", 0xCCB98E)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));	
			case FULL:
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "v", 0x49A9B2)));            
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "x", 0x99062D)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "z", 0xCCB98E)));
				actions.add(add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "d", 0x0078FF)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));
				
			case controlExtend:
				actions.add(add(buttonF = createButton(FlxG.width * 0.5 - 44 * 3, FlxG.height * 0.5 - 127 * 0.5, 44 * 3, 127, "f", 0xFF0000)));
				actions.add(add(buttonG = createButton(FlxG.width * 0.5, FlxG.height * 0.5 - 127 * 0.5, 44 * 3, 127, "g", 0xFFFF00)));	
				
			case CHART_EDITOR:			    
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "v", 0x49A9B2)));            
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "x", 0x99062D)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 127, "z", 0xCCB98E)));
				actions.add(add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "d", 0x0078FF)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));				
				
				dPad.add(add(buttonCEUp = createButton(FlxG.width - (44 + 42 * 4) * 3, FlxG.height - 85 * 3, 44 * 3, 127, "up", 0x00FF00)));
				dPad.add(add(buttonCEDown = createButton(FlxG.width - (44 + 42 * 4) * 3, FlxG.height - 45 * 3, 44 * 3, 127, "down", 0x00FFFF)));		
				dPad.add(add(buttonCEG = createButton(FlxG.width - (44 + 42 * 1) * 3, 25, 44 * 3, 127, "g", 0x00FF00)));
			case MenuCharacterEditor:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3 - 350, FlxG.height - 45 * 3, 44 * 3, 127, "a", 0xFF0000)));
				actions.add(add(buttonB = createButton(FlxG.width - 44 * 3 - 350, FlxG.height - 85 * 3, 44 * 3, 127, "b", 0xFFCB00)));	
			case DialogueCharacterEditor:
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "x", 0x99062D)));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "z", 0xCCB98E)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "a", 0xFF0000)));	
			case NoteSplashDebugState:
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "v", 0x49A9B2)));            
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "x", 0x99062D)));
				//actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "y", 0x4A35B9)));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3 - 460, 44 * 3, 127, "z", 0xCCB98E)));
				actions.add(add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "d", 0x0078FF)));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "c", 0x44FF00)));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "b", 0xFFCB00)));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3 - 460, 44 * 3, 127, "a", 0xFF0000)));	
			case NOTESTATE:
			    actions.add(add(buttonE = createButton(42 * 3, FlxG.height - 125 * 3, 44 * 3, 127, "e", 0xFF7D00)));
				actions.add(add(buttonC = createButton(0, FlxG.height - 125 * 3, 44 * 3, 127, "c", 0x44FF00)));  
				actions.add(add(buttonB = createButton(0, FlxG.height - 165 * 3, 44 * 3, 127, "b", 0xFFCB00)));					
			case NONE:
		}
	}

	public function createButton(x:Float, y:Float, width:Int, height:Int, frames:String, ColorS:Int):FlxButton {
		var button = new FlxButton(x, y);
		button.frames = FlxTileFrames.fromFrame(getFrames().getByName(frames), FlxPoint.get(width, height));
		button.resetSizeFromFrame();
		button.solid = false;
		button.immovable = true;
		button.scrollFactor.set();
		button.alpha = orgAlpha;
		button.color = ColorS;
		button.antialiasing = orgAntialiasing;
		#if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end
		return button;
	}

	public static function getFrames():FlxAtlasFrames {
		return Paths.getPackerAtlas('androidcontrols/virtualpad');
	}

	override public function destroy():Void {
		super.destroy();

		dPad = FlxDestroyUtil.destroy(dPad);
		actions = FlxDestroyUtil.destroy(actions);

		dPad = null;
		actions = null;

		buttonA = null;
		buttonB = null;
		buttonC = null;
		buttonD = null;
		buttonE = null;
        buttonF = null;
		buttonG = null;
		
		buttonV = null;	
		buttonX = null;	
		buttonY = null;
		buttonZ	= null;	

		buttonLeft = null;
		buttonUp = null;
		buttonDown = null;
		buttonRight = null;

		buttonLeft2 = null;
		buttonUp2 = null;
		buttonDown2 = null;
		buttonRight2 = null;
		
		buttonCELeft = null;
		buttonCEUp = null;
		buttonCEDown = null;
		buttonCERight = null;
		buttonCEG = null;
		
		buttonCEUp_M = null;
		buttonCEDown_M = null;
	}
}

enum FlxDPadMode {
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	FULL;
	RIGHT_FULL;
	DUO;
	CHART_EDITOR;
	MenuCharacterEditor;
	DialogueCharacterEditor;
	NoteSplashDebugState;
	MainMenuState;
	NONE;
}

enum FlxActionMode {
	A;
	B;
	D;
	A_B;
	A_B_C;
	A_B_E;
	A_B_X_Y;	
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	controlExtend;
	FULL;
	CHART_EDITOR;
	MenuCharacterEditor;
	DialogueCharacterEditor;
	NoteSplashDebugState;
	NOTESTATE;
	NONE;
}
