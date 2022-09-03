function onPlayerHit(direction:Int) {
    if (note.isSustainNote && StringTools.startsWith(PlayState.boyfriend.getAnimName(), "sing")) {
        PlayState.boyfriend.playAnim(PlayState.boyfriend.getAnimName());
        return;
    }
    var suffix = "";
    if (Math.abs(note.strumTime - Conductor.songPosition) < PlayState.ratings[0].maxDiff)
        suffix = "-alt";
    switch(direction) {
        case 0:
            PlayState.boyfriend.playAnim("singLEFT" + suffix, true);
        case 1:
            PlayState.boyfriend.playAnim("singDOWN" + suffix, true);
        case 2:
            PlayState.boyfriend.playAnim("singUP" + suffix, true);
        case 3:
            PlayState.boyfriend.playAnim("singRIGHT" + suffix, true);
    }
}

function onOpponentHit(direction:Int) {
    var chance:Int = 10;
    var suffix = "";
    chance = FlxG.random.int(1, 10);
    if (chance > 5)
        suffix = "-alt";
    switch(direction) {
        case 0:
            PlayState.dad.playAnim("singLEFT" + suffix, true);
        case 1:
            PlayState.dad.playAnim("singDOWN" + suffix, true);
        case 2:
            PlayState.dad.playAnim("singUP" + suffix, true);
        case 3:
            PlayState.dad.playAnim("singRIGHT" + suffix, true);
    }
}
