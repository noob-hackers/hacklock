/*
9-dot pattern lock
V1.05
©2011-2015 - Steffest

This is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
it comes WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

History
    2011/04/11: initial version
    2011/04/12: small bugfix: @PiRho_be dragging outside the pattern lock and releasing won't end the pattern: added document.onmouseup event
    2013/10/20: some restructuring, support for IE mobile
    2013/10/21: less DOM querying - only calculate gridsize once each touch sequence
    2013/11/25: added clear method (to allow multiple patterns when autoSubmit is false)
    2015/04/02: added reset button
*/

var patternLock = (function () {
	
    // Parameters-------------------

    var autoInit = true;
    var autoSubmit = true;
    var showResetButton = true; // only applicable if autoSubmit is set to false or there's no submit button in the form;


    // Code-------------------------

    var isdrawing = false;
    var from = "";
    var to = "";
    var inputbox;
    var startbutton = 0;

    var gridsize = false;
    var buttons = []; // array to hold the 9 buttons
    var lines = []; // array to hold the connecting lines

    var resets = []; // array to hold the reset buttons

    var init = function(){

        if (autoInit){
            var canAutosubmit = false;
            var pw = document.getElementsByTagName("input");
            for (var i=0;i<pw.length;i++){
                if(pw[i].className == 'patternlock'){
                    generate(pw[i]);
                }
                if((pw[i].type=='submit') && (autoSubmit)){
                    pw[i].style.display = 'none';
                    canAutosubmit = true;
                }
            }

            if (showResetButton && !canAutosubmit){
                // show reset buttons
                autoSubmit = false;
                for (var r=0;r<resets.length;r++){
                    resets[r].style.display = "block";
                }
            }

        }
    };

    var generate= function(el){
        inputbox = el;
        el.style.display = 'none';
        var pel = el.parentNode;

        // main container
        var patternTag = document.createElement("div");
        patternTag.className = "patternlockcontainer";


        // horizontal lines
        var linesTag = document.createElement("div");
        linesTag.className = "patternlocklineshorizontalcontainer boxsizingcontentbox";
        var elid=["12","23","45","56","78","89"];
        for (var i=0;i<6;i++){
            var lineTag = document.createElement("div");
            lineTag.className = "patternlocklinehorizontal boxsizingcontentbox";
            lineTag.id = "line" + elid[i];
            lines.push(lineTag);
            linesTag.appendChild(lineTag);
        }
        patternTag.appendChild(linesTag);

        // vertical lines
        linesTag = document.createElement("div");
        linesTag.className = "patternlocklinesverticalcontainer boxsizingcontentbox";
        elid=["14","25","36","47","58","69"];
        for (var i=0;i<6;i++){
            var lineTag = document.createElement("div");
            lineTag.className = "patternlocklinevertical boxsizingcontentbox";
            lineTag.id = "line" + elid[i];
            lines.push(lineTag);
            linesTag.appendChild(lineTag);
        }
        patternTag.appendChild(linesTag);

        // diagonal lines
        linesTag = document.createElement("div");
        linesTag.className = "patternlocklinesdiagonalcontainer boxsizingcontentbox";
        elid=["24","35","57","68"];
        for (var i=0;i<4;i++){
            var lineTag = document.createElement("div");
            lineTag.className = "patternlocklinediagonalforward boxsizingcontentbox";
            lineTag.id = "line" + elid[i];
            lines.push(lineTag);
            linesTag.appendChild(lineTag);
        }
        patternTag.appendChild(linesTag);

        linesTag = document.createElement("div");
        elid=["15","26","48","59"];
        linesTag.className = "patternlocklinesdiagonalcontainer boxsizingcontentbox";
        for (var i=0;i<4;i++){
            var lineTag = document.createElement("div");
            lineTag.className = "patternlocklinediagonalbackwards boxsizingcontentbox";
            lineTag.id = "line" + elid[i];
            lines.push(lineTag);
            linesTag.appendChild(lineTag);
        }
        patternTag.appendChild(linesTag);


        // the 9 buttons
        var buttonsTag = document.createElement("div");
        buttonsTag.className = "patternlockbuttoncontainer";
        for (var i=1;i<10;i++){
            var buttonTag = document.createElement("div");
            buttonTag.className = "patternlockbutton";
            buttonTag.id = "patternlockbutton" + i;

            // attach events

            if (window.navigator.msPointerEnabled) {
                // MS pointer model
                buttonTag.onpointerdown = buttonTag.onmspointerdown = function(e){
                    e.preventDefault();
                    buttonTouchStart(this)
                };
                buttonTag.onpointermove = buttonTag.onmspointermove = function(e){
                    e.preventDefault();
                    processTouchMove(parseInt(e.pageX),parseInt(e.pageY));

                };
                buttonTag.onpointerup = buttonTag.onmspointerup = function(){
                    buttonTouchEnd(this);
                };
                //event.clientX, event.clientY

            }
            else {
                // mouse / touch model
                buttonTag.onmousedown = function(e){
                    if (e && e.preventDefault){
                       e.preventDefault();
                    }
                    buttonTouchStart(this)
                };
                buttonTag.ontouchstart = function(e){
                    if (!e) e = window.event;
                    e.preventDefault();
                    buttonTouchStart(this)
                };
                buttonTag.onmouseover = function(){buttonTouchOver(this)};
                buttonTag.ontouchmove = buttonTouchMove;
                buttonTag.onmouseup = function(){buttonTouchEnd(this)};
                buttonTag.ontouchend = function(){buttonTouchEnd()};
            }

            buttons.push(buttonTag);
            buttonsTag.appendChild(buttonTag);
        }
        patternTag.appendChild(buttonsTag);

        // stupid preloader for the hover images
        var imgTag = document.createElement("div");
        imgTag.style.display = 'none';
        imgTag.className = "patternlockbutton touched";
        patternTag.appendChild(imgTag);

        imgTag = document.createElement("div");
        imgTag.style.display = 'none';
        imgTag.className = "patternlockbutton touched multiple";
        patternTag.appendChild(imgTag);


        pel.appendChild(patternTag);

        if (showResetButton){
            var reset = document.createElement("div");
            reset.className = "patternreset";
            reset.style.display = "none";
            reset.innerHTML = "(reset)";
            reset.onclick = function(){
                clear();
            };
            resets.push(reset);
            pel.appendChild(reset);
        }
    };

    var buttonTouchStart = function(b){
        isdrawing = true;
        if (inputbox.value != "") clear();
        b.className = "patternlockbutton touched";
        from = "";
        to = b.id.split("patternlockbutton").join("");
        inputbox.value = to;
        startbutton = to;
        return false;
    };

    var buttonTouchOver = function(b){
        if (isdrawing){
            var thisbutton = b.id.split("patternlockbutton").join("");

            if(thisbutton != to){ // touching the same button twice in a row is not allowed (should it ?)

                var cn = b.className;
                if(cn.indexOf('touched')<0){
                    b.className = "patternlockbutton touched"
                }else{
                    b.className = "patternlockbutton touched multiple"
                }

                from = to;
                to = thisbutton;

                //update input value
                inputbox.value += to;

                // display line between 2 buttons
                var thisline = document.getElementById("line" + from + to);
                if (to <  from){
                    thisline = document.getElementById("line" + to + from);
                }
                if (thisline){
                    thisline.style.visibility = 'visible';
                }
            }
        }
        return(false)
    };

    var buttonTouchMove = function(e){
        if(e.touches.length == 1){
            var touch = e.touches[0];
            processTouchMove(parseInt(touch.pageX),parseInt(touch.pageY));
        }
    };

    var processTouchMove = function(x,y){
        // find position relative to first button
        if (!gridsize){
            buttons[0].pos = findPos(buttons[0]);
            buttons[1].pos = findPos(buttons[1]);
            gridsize = parseInt(buttons[1].pos.left) - parseInt(buttons[0].pos.left);
        }

        var cox = x - parseInt(buttons[0].pos.left);
        var coy = y - parseInt(buttons[0].pos.top);

        // on what button are we over now?
        // grid 3x3 to sequential nummber
        var buttonnr = Math.min(2,Math.max(0,Math.floor(cox/gridsize))) + (Math.min(2,Math.max(0,Math.floor(coy/gridsize)))*3) + 1;

        if (buttonnr != to){
            // only trigger if the touch is near the middle of the button
            // otherwise diagonal moves are impossible
            var distancex = (cox % gridsize);
            var distancey = (coy % gridsize);
            if ((distancex< (gridsize/2)) && (distancey < (gridsize/2))){
                // we're over a new button
                var newButton = buttons[buttonnr-1];
                buttonTouchOver(newButton);
            }
        }
    };

    var buttonTouchEnd = function(){
        if (isdrawing){
            isdrawing = false;
            gridsize = false; // set to false so on the next touch it's recalculated as the layout could have been changed
            if (autoSubmit){
                var doSubmit = true;
                if (document.forms[0].onsubmit){ doSubmit = document.forms[0].onsubmit() }
                if(doSubmit){
                    document.forms[0].submit();
                }
            }
        }
        return(false)

    };

    // clears the patternlock;
    var clear = function(){
        var i,len;
        for (i= 0, len=buttons.length; i<len; i++){
            buttons[i].className = "patternlockbutton";
        }
        for (i= 0, len=lines.length; i<len; i++){
            lines[i].style.visibility = 'hidden';
        }
        inputbox.value = "";
    };

    // helper function to find the absolute position of an element
    function findPos(obj) {
        var curleft = curtop = 0;
        if (obj.offsetParent) {
            do {
                curleft += obj.offsetLeft;
                curtop += obj.offsetTop;
            } while (obj = obj.offsetParent);
        }
        return {left: curleft,top: curtop};
    }

    var attach = function(target, functionref, tasktype){
        tasktype=(window.addEventListener)? tasktype : "on"+tasktype;
        if (target.addEventListener)
            target.addEventListener(tasktype, functionref, false)
        else if (target.attachEvent)
            target.attachEvent(tasktype, functionref)
    };

    attach(window, function(){init()}, "load") ;
    attach(document, function(){buttonTouchEnd()}, "mouseup") ;

    return{
        init: init,
        generate: generate,
        clear: clear
    }


}());

