import("openfl.filters.ShaderFilter");
var speakers:FlxSprite = null;
var boingy:Bool = false;
var moveCam:Bool = false;
var sunkFocus:Bool = false;
var bfFocus:Bool = false;
var disco:FlxSprite = null;
var uwu:FlxSprite = null;

var ofs1:Int = 0;
var ofs2:Int = 0;

var leakMode:Bool = false;

function create() {

   	FlxG.resizeGame(1024, 768);
    FlxG.resizeWindow(1024, 768);
    PlayState.defaultCamZoom = 1.05;

    bg = new FlxSprite(-302, -162).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/bg'));
    bg.updateHitbox();
    bg.antialiasing = true;
    bg.scrollFactor.set(0, 0);
    bg.active = false;
    PlayState.add(bg);

    floor = new FlxSprite(-981, 574).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/floor'));
    floor.updateHitbox();
    floor.antialiasing = true;
    floor.scrollFactor.set(1, 1);
    floor.active = false;
    PlayState.add(floor);

    speakers = new FlxSprite(-350, 3);
    speakers.frames = Paths.getSparrowAtlas('SUNKEEEEHHHHHHHHH/speakers');
    speakers.animation.addByPrefix('speakers', 'speakers', 24, false);
    speakers.antialiasing = true;
    speakers.visible = true;
    PlayState.add(speakers);

    disco = new FlxSprite(526, -418);
    disco.frames = Paths.getSparrowAtlas('SUNKEEEEHHHHHHHHH/hang');
    disco.animation.addByPrefix('hang', 'hang', 24, true);
    disco.animation.play('hang');
    disco.antialiasing = true;
    disco.visible = true;
    disco.scrollFactor.set(1.3, 1);
    PlayState.add(disco);

    uwu = new FlxSprite(246, 58);
    uwu.frames = Paths.getSparrowAtlas('SUNKEEEEHHHHHHHHH/uwu');
    uwu.animation.addByPrefix('uwu', 'uwu', 24, false);
    uwu.antialiasing = true;
    uwu.animation.play('uwu');
    uwu.alpha = 0;
    uwu.scrollFactor.set(0, 0);
    uwu.cameras = [PlayState.camHUD];
    PlayState.add(uwu);

    funnyHud = new FlxText(60, 700, 999, "i am a number", 44);
    funnyHud.setFormat(Paths.font("HelpMe.ttf"), 70, FlxColor.WHITE);
    funnyHud.cameras = [PlayState.camHUD];

    //funny leak
    yellow = new FlxSprite(-302, -282).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/yellow'));
    yellow.updateHitbox();
    yellow.antialiasing = true;
    yellow.scale.y = 1.3;
    yellow.scrollFactor.set(0, 0);
    yellow.alpha = 0;
    yellow.active = false;
    PlayState.add(yellow);

    blue = new FlxSprite(-302, -282).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/blue'));
    blue.updateHitbox();
    blue.antialiasing = true;
    blue.scale.y = 1.3;
    blue.scrollFactor.set(0, 0);
    blue.alpha = 0;
    blue.active = false;
    PlayState.add(blue);

    dots = new FlxSprite(-349, -289).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/dots'));
    dots.updateHitbox();
    dots.antialiasing = true;
    dots.alpha = 0;
    dots.scrollFactor.set(0, 0);
    dots.active = false;
    PlayState.add(dots);

    srko = new FlxSprite(-63, 523).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/srko'));
    srko.updateHitbox();
    srko.alpha = 0;
    srko.antialiasing = true;
    srko.scrollFactor.set(1, 1);
    srko.active = false;
    PlayState.add(srko);

    ceral = new FlxSprite(565.7, 51.3).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/ceral'));
    ceral.updateHitbox();
    ceral.alpha = 0;
    ceral.antialiasing = true;
    ceral.scrollFactor.set(1, 1);
    ceral.active = false;
    PlayState.add(ceral);

    milk = new FlxSprite(474.85, 47.45).loadGraphic(Paths.image('SUNKEEEEHHHHHHHHH/milk'));
    milk.updateHitbox();
    milk.alpha = 0;
    milk.antialiasing = true;
    milk.scrollFactor.set(1, 1);
    milk.active = false;
    PlayState.add(milk);

    sunkTransition = new FlxSprite(-137, -249);
    sunkTransition.frames = Paths.getSparrowAtlas('SUNKEEEEHHHHHHHHH/sunkTransition');
    sunkTransition.animation.addByPrefix('sunkTransition', 'sunkTransition', 24, false);
    sunkTransition.antialiasing = true;
    sunkTransition.animation.play('sunkTransition');
    sunkTransition.alpha = 0;
    sunkTransition.scrollFactor.set(0, 0);
    sunkTransition.cameras = [PlayState.camHUD];
    // PlayState.add(sunkTransition);

}

function onGuiPopup() {
  PlayState.add(funnyHud);
  PlayState.add(sunkTransition);
  PlayState.timerBG.y -= 100;
  PlayState.timerBar.y -= 100;

  demoTxt = new FlxText(0, 60, 999, '=DEMO BUILD=\n' + 'SOULLES DX COMING SOON!', 44);
  demoTxt.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE);
  demoTxt.alignment = 'center';
  demoTxt.screenCenter(FlxAxes.X);
  demoTxt.cameras = [PlayState.camHUD];
  PlayState.add(demoTxt);

  disclaim = new FlxText(0, -300, 999, '!!MOST FEATURES ARE UNFINISHED!!', 44);
  disclaim.setFormat(Paths.font("vcr.ttf"), 100, FlxColor.RED);
  disclaim.alignment = 'center';
  disclaim.screenCenter(FlxAxes.X);
  disclaim.cameras = [PlayState.camHUD];
  PlayState.add(disclaim);
}

function createPost() {

     PlayState.timerBar.createGradientBar([0xFF222222], [0xFFFF0000, 0xFFFF0000], 1, 90);
     //havent coded in the proper colour switch yet


    for (i in 0...PlayState.cpuStrums.length) {
			  PlayState.cpuStrums.members[i].x -= 42;
				PlayState.cpuStrums.members[i].y = -69;
    }

    for (i in 0...PlayState.playerStrums.length) {

	      	PlayState.playerStrums.members[i].x += 42;
	      	PlayState.playerStrums.members[i].y = -69;
    }

      PlayState.gf.visible = false;
      PlayState.healthBarBG.visible = false;
      PlayState.healthBar.visible = false;
      PlayState.iconP1.visible = false;
			PlayState.iconP2.visible = false;
			PlayState.scoreTxt.visible = false;

			PlayState.boyfriend.x = 949;
			PlayState.boyfriend.y = 137;
			PlayState.dad.x = -108;
			PlayState.dad.y = 226;

      // leakMode = true;
    FlxG.scaleMode.width = 1280;
    FlxG.scaleMode.height = 960;
    FlxG.scaleMode.isWidescreen = false;
    //thx yoshi

}

function update(elapsed:Float) {

  if(moveCam){
    ofs1 = 30;
    ofs2 = 50;
  }

  if (leakMode){
     PlayState.camFollow.setPosition(755, 300);
     PlayState.defaultCamZoom = 0.8;

     milk.alpha = 1;
     ceral.alpha = 1;
     blue.alpha = 1;
     yellow.alpha = 1;
     srko.alpha = 1;
     dots.alpha = 1;
  }

  else{

    milk.alpha = 0;
    ceral.alpha = 0;
    blue.alpha = 0;
    yellow.alpha = 0;
    srko.alpha = 0;
    dots.alpha = 0;

   if (PlayState.section != null && PlayState.section.mustHitSection) {
			PlayState.camFollow.setPosition(900, 300);
			// PlayState.defaultCamZoom = 1;


			switch(PlayState.boyfriend.animation.curAnim.name) {
					case "singLEFT":
							PlayState.camFollow.x = PlayState.camFollow.x - ofs1;
              PlayState.defaultCamZoom = 1.05;
					case "singRIGHT":
							PlayState.camFollow.x = PlayState.camFollow.x + ofs1;
              PlayState.defaultCamZoom = 1.05;
					case "singUP":
							PlayState.camFollow.y = PlayState.camFollow.y - ofs1;
              PlayState.defaultCamZoom = 1.05;
					case "singDOWN":
							PlayState.camFollow.y = PlayState.camFollow.y + ofs1;
              PlayState.defaultCamZoom = 1.05;

              case "singLEFT-alt":
    							PlayState.camFollow.x = PlayState.camFollow.x - ofs2;
                  sick +=0.1;
                  PlayState.defaultCamZoom = 1.07;
    					case "singRIGHT-alt":
    							PlayState.camFollow.x = PlayState.camFollow.x + ofs2;
                  sick += 0.1;
                  PlayState.defaultCamZoom = 1.03;
    					case "singUP-alt":
    							PlayState.camFollow.y = PlayState.camFollow.y - ofs2;
                  sick += 0.1;
                  PlayState.defaultCamZoom = 1;
    					case "singDOWN-alt":
    							PlayState.camFollow.y = PlayState.camFollow.y + ofs2;
                  sick += 0.1;
                  PlayState.defaultCamZoom = 1.09;

                  case "idle":
                      PlayState.defaultCamZoom = 1.05;
		}
	}
		else {
			PlayState.camFollow.setPosition(363, 300);
			// PlayState.defaultCamZoom = 1;

			switch(PlayState.dad.animation.curAnim.name) {
					case "singLEFT" :
							PlayState.camFollow.x = PlayState.camFollow.x - ofs1;
					case "singRIGHT":
							PlayState.camFollow.x = PlayState.camFollow.x + ofs1;
					case "singUP":
							PlayState.camFollow.y = PlayState.camFollow.y - ofs1;
					case "singDOWN":
							PlayState.camFollow.y = PlayState.camFollow.y + ofs1;
              case "singLEFT-alt":
                  PlayState.camFollow.x = PlayState.camFollow.x - ofs1;
              case "singRIGHT-alt":
                  PlayState.camFollow.x = PlayState.camFollow.x + ofs1;
              case "singUP-alt":
                  PlayState.camFollow.y = PlayState.camFollow.y - ofs1;
              case "singDOWN-alt":
                  PlayState.camFollow.y = PlayState.camFollow.y + ofs1;
		}


  }
}

// FlxG.resizeGame(1024, 768);
// FlxG.resizeWindow(1024, 768);

  if (sunkFocus){
    PlayState.camFollow.setPosition(290, 350);
  }

  if (bfFocus){
    PlayState.camFollow.setPosition(1150, 300);
  }

  funnyHud.text = "souls taken: " +  Std.int(PlayState.accuracy * 1);


}

function beatHit(curBeat)
{
    if (curBeat % 1 == 0){
        speakers.animation.play('speakers');
      }

    if (leakMode){
      if (curBeat % 4 == 0){
          dots.x = -523.85;
          blue.y = 10000;
          yellow.y = -282;
          milk.y = 47.45;
          ceral.y -= 10000;
    }
      if (curBeat % 4 == 2){
         dots.x = -349.85;
         blue.y = -282;
         yellow.y = 10000;
         milk.y -= 10000;
         ceral.y = 51.3;
    }

    if (curBeat % 2 == 0){
        milk.angle = 30;
        ceral.angle = -30;
  }
    if (curBeat % 2 == 1){
       milk.angle = 0;
       ceral.angle = 0;
  }

  }


  if (curBeat == 1){
      FlxTween.tween(disclaim, {y: 200}, 1.5, {ease: FlxEase.circOut});
    }

    if (curBeat == 8){
        FlxTween.tween(disclaim, {y: -500}, 1.5, {ease: FlxEase.circIn});
      }

      if (curBeat == 96){
          FlxTween.tween(PlayState.camGame, {zoom: 0.9}, 1.5, {ease: FlxEase.circOut});
          moveCam = false;
          PlayState.camZooming = false;
          PlayState.autoCamZooming = false;
        }

        if (curBeat == 24){
            FlxTween.tween(PlayState.camGame, {zoom: 1.3}, 2, {ease: FlxEase.sineInOut});
            moveCam = false;
            PlayState.camZooming = false;
            PlayState.autoCamZooming = false;
          }

          if (curBeat == 30){
              FlxTween.tween(PlayState.camGame, {zoom: 0.9}, 1, {ease: FlxEase.sineOut});
              moveCam = false;
              PlayState.camZooming = false;
              PlayState.autoCamZooming = false;
            }

            if (curBeat == 33){
                FlxTween.tween(PlayState.camGame, {zoom: 2}, 1, {ease: FlxEase.sineIn});
                sunkFocus = true;
                PlayState.camZooming = false;
                PlayState.autoCamZooming = false;
              }

              if (curBeat == 36){
                  sunkFocus = false;
                  moveCam = true;
                  PlayState.camZooming = true;
                  PlayState.autoCamZooming = true;
                }

        if (curBeat == 100){
            moveCam = true;
            PlayState.camZooming = true;
            PlayState.autoCamZooming = true;
          }

          if (curBeat == 159){
              FlxTween.tween(PlayState.camGame, {zoom: 1.6}, 1.6, {ease: FlxEase.quadInOut});
              moveCam = false;
              bfFocus = true;
              PlayState.camZooming = false;
              PlayState.autoCamZooming = false;
            }

            if (curBeat == 168){
                moveCam = true;
                bfFocus = false;
                PlayState.camZooming = true;
                PlayState.autoCamZooming = true;
              }

    if (curBeat == 224){
        FlxTween.tween(PlayState.camGame, {zoom: 1.5}, 1.2, {ease: FlxEase.circOut});
        moveCam = false;
        PlayState.camZooming = false;
        PlayState.autoCamZooming = false;
      }

      if (curBeat == 221){
        //begin sunk
        sunkTransition.alpha = 1;
        sunkTransition.animation.play('sunkTransition');
        }

    if (curBeat == 226){
      leakMode = true;
    }

    if (curBeat == 228){
      sunkTransition.alpha = 0;
      }

    if (curBeat == 356){
      leakMode = false;
      PlayState.defaultCamZoom = 1.1;
      FlxTween.tween(PlayState.camGame, {zoom: 1.3}, 1.2, {ease: FlxEase.circOut});
      }

      if (curBeat == 414){
        moveCam = true;
        sunkFocus = false;
        PlayState.camZooming = true;
        PlayState.autoCamZooming = true;
        }

    if (boingy){
      PlayState.camGame.zoom += 0.05;
    }
}



function your_func(parameter1:String) {
  FlxTween.tween(uwu, {alpha: 0.7}, 2, {ease: FlxEase.sineInOut});
  uwu.animation.play('uwu', true);
  FlxTween.tween(uwu, {alpha: 0}, 2, {ease: FlxEase.sineInOut, startDelay: 5});
  moveCam = false;
  sunkFocus = true;
  PlayState.camZooming = false;
  PlayState.autoCamZooming = false;
  FlxTween.tween(PlayState.camGame, {zoom: 2}, 7, {ease: FlxEase.quadInOut});
}
