package backend;

#if android
import android.Tools;
import android.Permissions;
import android.PermissionsList;
import extension.devicelang.DeviceLanguage;
#end
import backend.AndroidDialogsExtend;
	
import lime.app.Application;
import openfl.events.UncaughtErrorEvent;
import openfl.utils.Assets as OpenFlAssets;
import openfl.Lib;
import haxe.CallStack.StackItem;
import haxe.CallStack;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;
#if flash
import flash.system.System;
#else
import lime.system.System;
#end
/**
 * ...
 * @author: Saw (M.A. Jigsaw)
 */

class SUtil
{
	#if android
	private static var aDir:String = null; // android dir
	#end

	public static function getPath():String
	{
		#if android
		if (aDir != null && aDir.length > 0)
			return aDir;
		else
			return aDir = Tools.getExternalStorageDirectory() + '/' + '.' + Application.current.meta.get('file') + '/';
		#else
		return '';
		#end
	}

	public static function doTheCheck()
	{
		#if android
		if (!Permissions.getGrantedPermissions().contains(PermissionsList.READ_EXTERNAL_STORAGE) || !Permissions.getGrantedPermissions().contains(PermissionsList.WRITE_EXTERNAL_STORAGE))
		{
			Permissions.requestPermissions([PermissionsList.READ_EXTERNAL_STORAGE, PermissionsList.WRITE_EXTERNAL_STORAGE]);
			SUtil.applicationAlert('Permissions', "if you acceptd the permissions all good if not expect a crash" + '\n' + 'Press Ok to see what happens');
		}

		if (Permissions.getGrantedPermissions().contains(PermissionsList.READ_EXTERNAL_STORAGE) || Permissions.getGrantedPermissions().contains(PermissionsList.WRITE_EXTERNAL_STORAGE))
		{
			if (!FileSystem.exists(Tools.getExternalStorageDirectory() + '/' + '.' + Application.current.meta.get('file')))
				FileSystem.createDirectory(Tools.getExternalStorageDirectory() + '/' + '.' + Application.current.meta.get('file'));

			if (!FileSystem.exists(SUtil.getPath() + 'assets') && !FileSystem.exists(SUtil.getPath() + 'mods'))
			{
				SUtil.applicationAlert('Uncaught Error :(!', "Whoops, seems you didn't extract the files to the .PsychEngine!\nPlease watch the tutorial by pressing OK.");
                if (DeviceLanguage.getLang() == 'zh') CoolUtil.browserLoad('https://b23.tv/KqRRT8N');
		        else CoolUtil.browserLoad('https://youtu.be/AmoNoYjJgHs?si=LvgXbRRn7eJlwL0w');				
				System.exit(0);
			}
			else
			{
				if (!FileSystem.exists(SUtil.getPath() + 'assets'))
				{
					SUtil.applicationAlert('Uncaught Error :(!', "Whoops, seems you didn't extract the assets folder to the .PsychEngine!\nPlease watch the tutorial by pressing OK.");
					if (DeviceLanguage.getLang() == 'zh') CoolUtil.browserLoad('https://b23.tv/KqRRT8N');
		            else CoolUtil.browserLoad('https://youtu.be/AmoNoYjJgHs?si=LvgXbRRn7eJlwL0w');
					System.exit(0);
				}

				if (!FileSystem.exists(SUtil.getPath() + 'mods'))
				{
					SUtil.applicationAlert('Uncaught Error :(!', "Whoops, seems you didn't extract the mods folder to the .PsychEngine!\nPlease watch the tutorial by pressing OK.");
					if (DeviceLanguage.getLang() == 'zh') CoolUtil.browserLoad('https://b23.tv/KqRRT8N');
		            else CoolUtil.browserLoad('https://youtu.be/AmoNoYjJgHs?si=LvgXbRRn7eJlwL0w');
					System.exit(0);
				}
				
				if (!FileSystem.exists(SUtil.getPath() + 'assets/shared/images/noteSkins') && !FileSystem.exists(SUtil.getPath() + 'assets/shared/images/noteSplashes') && Mods.mergeAllTextsNamed('images/noteSplashes/list.txt', 'shared').length == 0 && Mods.mergeAllTextsNamed('images/noteSkins/list.txt', 'shared').length == 0)//make sure people use 0.71h assets not old shits
				{
				
				    var lang:String = '';
		            if (DeviceLanguage.getLang() == 'zh') 
		            lang = '未检测到noteskin和noteSplashes文件夹\n设置里将不显示这两个选项';
		            else
		            lang = 'noteskin and noteSplashes folders not detected, these options will not appear in Settings.';
		            AndroidDialogsExtend.OpenToast(lang,2);
		
		        
		            /*
					SUtil.applicationAlert('Uncaught Error :(!', "Whoops, seems you didn't update new assets to the .PsychEngine!\n(Not found noteskin or noteSplashes files)\nPlease watch the tutorial by pressing OK.");
					if (DeviceLanguage.getLang() == 'zh') CoolUtil.browserLoad('https://b23.tv/KqRRT8N');
		            else CoolUtil.browserLoad('https://youtu.be/AmoNoYjJgHs?si=LvgXbRRn7eJlwL0w');
				    System.exit(0);
				    */
				}
			}
		}
		#end
	}

	public static function gameCrashCheck()
	{
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
	}

	public static function onCrash(e:UncaughtErrorEvent):Void
	{
		var callStack:Array<StackItem> = CallStack.exceptionStack(true);
		var dateNow:String = Date.now().toString();
		dateNow = StringTools.replace(dateNow, " ", "_");
		dateNow = StringTools.replace(dateNow, ":", "'");

		var path:String = "crash/" + "crash_" + dateNow + ".txt";
		var errMsg:String = "";

		for (stackItem in callStack)
		{
			switch (stackItem)
			{
				case FilePos(s, file, line, column):
					errMsg += file + " (line " + line + ")\n";
				default:
					Sys.println(stackItem);
			}
		}

		errMsg += e.error;

		if (!FileSystem.exists(SUtil.getPath() + "crash"))
		FileSystem.createDirectory(SUtil.getPath() + "crash");

		File.saveContent(SUtil.getPath() + path, errMsg + "\n");

		Sys.println(errMsg);
		Sys.println("Crash dump saved in " + Path.normalize(path));
		Sys.println("Making a simple alert ...");

		SUtil.applicationAlert("Uncaught Error :(!", errMsg);
		System.exit(0);
	}

	private static function applicationAlert(title:String, description:String)
	{
		Application.current.window.alert(description, title);
	}

	#if android
	public static function saveContent(fileName:String = 'file', fileExtension:String = '.json', fileData:String = 'you forgot something to add in your code')
	{
		if (!FileSystem.exists(SUtil.getPath() + 'saves'))
			FileSystem.createDirectory(SUtil.getPath() + 'saves');

		File.saveContent(SUtil.getPath() + 'saves/' + fileName + fileExtension, fileData);
		SUtil.applicationAlert('Done :)!', 'File Saved Successfully!');
	}
    
    public static function AutosaveContent(fileName:String = 'file', fileExtension:String = '.json', fileData:String = 'you forgot something to add in your code')
	{
		if (!FileSystem.exists(SUtil.getPath() + 'saves'))
			FileSystem.createDirectory(SUtil.getPath() + 'saves');

		File.saveContent(SUtil.getPath() + 'saves/' + fileName + fileExtension, fileData);
		//SUtil.applicationAlert('Done :)!', 'File Saved Successfully!');
	}
	
	public static function saveClipboard(fileData:String = 'you forgot something to add in your code')
	{
		openfl.system.System.setClipboard(fileData);
		SUtil.applicationAlert('Done :)!', 'Data Saved to Clipboard Successfully!');
	}

	public static function copyContent(copyPath:String, savePath:String)
	{
		if (!FileSystem.exists(savePath))
			File.saveBytes(savePath, OpenFlAssets.getBytes(copyPath));
	}
	#end
} 
