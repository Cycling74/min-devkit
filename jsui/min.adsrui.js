// Timothy Place
// Cycling '74

autowatch = 1;

inlets = 10;
outlets = 10;

var INITIAL = 0;
var PEAK = 1;
var SUSTAIN = 2;
var END = 3;
var ATTACK = 4;
var ATTACK_SLOPE = 5;
var DECAY = 6;
var DECAY_SLOPE = 7;
var RELEASE = 8;
var RELEASE_SLOPE = 9;

setinletassist(INITIAL, "Initial");
setinletassist(PEAK, "Peak");
setinletassist(SUSTAIN, "Sustain");
setinletassist(END, "End");
setinletassist(ATTACK, "Attack");
setinletassist(ATTACK_SLOPE, "Attack Slope");
setinletassist(DECAY, "Decay");
setinletassist(DECAY_SLOPE, "Decay Slope");
setinletassist(RELEASE, "Release");
setinletassist(RELEASE_SLOPE, "Release Slope");

setoutletassist(INITIAL, "Initial");
setoutletassist(PEAK, "Peak");
setoutletassist(SUSTAIN, "Sustain");
setoutletassist(END, "End");
setoutletassist(ATTACK, "Attack");
setoutletassist(ATTACK_SLOPE, "Attack Slope");
setoutletassist(DECAY, "Decay");
setoutletassist(DECAY_SLOPE, "Decay Slope");
setoutletassist(RELEASE, "Release");
setoutletassist(RELEASE_SLOPE, "Release Slope");

var initial = 0.0;
var peak = 1.0;
var sustain = 1.0;
var end = 0.0;
var attack = 0.0; // ms
var attack_slope = 0.0; // %
var attack_exp = 1.0;
var decay = 600.0; // ms
var decay_slope = 100.0; // %
var decay_exp = 1.0;
var release = 50.0 // ms
var release_slope = 100.0; // %
var release_exp = 1.0;


function bang() {
	refresh();
}


function calc_slope(v) {
    var slope = v / 100.0;
    var exp;
    
    if (slope > 0)
        exp = 1.0 + slope * 5.0;
    else if (slope < 0)
        exp = 1.0 + (-slope) * 5.0;
    else
        exp = 1.0;
    
    return exp;
}


function msg_float(v) {
	if (inlet == 0)
        initial = v;
    else if (inlet == 1)
        peak = v;
    else if (inlet == 2)
        sustain = v;
    else if (inlet == 3)
        end = v;
    else if (inlet == 4)
        attack = v;
    else if (inlet == 5) {
        attack_slope = v / 100.0;
        attack_exp = calc_slope(v);
    }
    else if (inlet == 6)
        decay = v;
    else if (inlet == 7) {
        decay_slope = v / 100.0;
        decay_exp = calc_slope(v);
    }
    else if (inlet == 8)
        release = v;
    else if (inlet == 9) {
        release_slope = v / 100.0;
        release_exp = calc_slope(v);
    }
	bang();
}


mgraphics.init();				// initialize mgraphics
mgraphics.relative_coords = 0;	// coordinate system: x, y, width height
mgraphics.autofill = 0;			// we want to fill the paths ourself


var background_color = [ 0.12, 0.12, 0.12];
var box_color = [ 1.0, 0.66, 0.08];
var line_color = [ 0.35, 0.8, 1.0 ];
var margin_top = 8; // margins for the points at the ends of the lines
var margin_right = 7;
var margin_bottom = 7;
var margin_left = 8;
var box_size = 5;



// 57 = the width available for the domain of the attack
// 57 = the width available for the domain of the decay

function paint() {
    var bg_width = this.box.rect[2] - this.box.rect[0];
    var bg_height = this.box.rect[3] - this.box.rect[1];
    var width = bg_width - margin_left - margin_right;
    var height = bg_height - margin_top - margin_bottom;
    var top = margin_top;
    var left = margin_left;
    var bottom = top + height;
    var right = left + width;
    var segment_width = 57;
 
    with (mgraphics) {
        set_source_rgb(background_color);
		rectangle(0, 0, bg_width, bg_height);
		fill();
        
        
        
        // INITIAL
        
        var initial_x = left + 0.5;
        var initial_y = height + (initial * -height) + top + 0.5;
        post ("initial ", initial_x, initial_y);
        post();
        
        
        // PEAK
         
        var peak_x = initial_x + (Math.pow(attack / 20000, 0.125) * segment_width);
        var peak_y = height + (peak * -height) + top + 0.5;
        post ("peak ", peak_x, peak_y);
        post();
        
        
        // DECAY
        
        var decay_x = peak_x + (Math.pow((decay-1.0) / 59999, 0.125) * segment_width);
        var decay_y = height + (sustain * -height) + top + 0.5;
        post ("decay ", decay_x, decay_y);
        post();
  
  
        // SUSTAIN
        
        var sustain_x = decay_x;
        var sustain_y = decay_y;
        post ("sustain ", sustain_x, sustain_y);
        post();
        
        
        // RELEASE
        
        var release_x = right-segment_width + 0.5;
        var release_y = sustain_y;
        post ("release ", release_x, release_y);
        post();
        
  
        // END
        
        var end_x = (right - segment_width) + (Math.pow((release-1.0) / 59999, 0.125) * segment_width) + 0.5;
        var end_y = height + (end * -height) + top + 0.5;
        post ("end ", end_x, end_y);
        post();
        
        
        
        
        set_source_rgb(line_color);
        set_line_width(1.5);
        
        
        
        move_to(initial_x, initial_y);
        

        var steps = peak_x - initial_x;     
        for (var i=0; i<=steps; ++i) {
            var x = initial_x+i;
            var y;
            
            if (attack_slope > 0.0) {
                y = 1.0 - Math.pow(Math.abs((i/steps) - 1.0), attack_exp);
                y = (peak_y-initial_y)*y + bottom;
            }
            else {
                y = Math.pow(i/steps, attack_exp);
                y = (peak_y-initial_y)*y + bottom;
            }

            line_to(x, y);
            stroke();
            move_to(x, y);
        }



        steps = decay_x - peak_x;
        for (var i=0; i<=steps; ++i) {
            var x = peak_x+i;
            var y;
        
            if (decay_slope > 0.0) {
                y = 1.0 - Math.pow(Math.abs((i/steps) - 1.0), decay_exp);
                y = (decay_y-peak_y)*y + top;
            }
            else {
                y = Math.pow(i/steps, decay_exp);
                y = (decay_y-peak_y)*y + top;
            }
            
            line_to(x, y);
            stroke();
            move_to(x, y);
        }

        
        move_to(decay_x, decay_y);
        line_to(release_x, release_y);
        stroke();

        move_to(sustain_x, sustain_y);
        line_to(release_x, release_y);
        stroke();

        
        move_to(release_x, release_y);
        steps = end_x - release_x;
        for (var i=0; i<=steps; ++i) {
            var x = release_x+i;
            var y;

            if (release_slope > 0.0) {
                y = 1.0 - Math.pow(Math.abs((i/steps) - 1.0), release_exp);
                y = (end_y-release_y)*y + sustain_y;
            }
            else {
                y = Math.pow(i/steps, release_exp);
                y = (end_y-release_y)*y + sustain_y;
            }
   
            line_to(x, y);
            stroke();
            move_to(x, y);
        }
        
        
        set_source_rgb(box_color);
        rectangle(initial_x-3, initial_y-3, 5, 5);
        stroke();

        set_source_rgb(box_color);
        rectangle(peak_x-3, peak_y-3, 5, 5);
        stroke();

        set_source_rgb(box_color);
        rectangle(decay_x-3, decay_y-3, 5, 5);
        stroke();

        set_source_rgb(box_color);
        rectangle(end_x-3, end_y-3, 5, 5);
        stroke();
        
        
    }
}





/*

draw();

function draw()
{
	var theta;
	var width = box.rect[2] - box.rect[0];
	
	with (sketch) {
		shapeslice(180,1);
		// erase background
		glclearcolor(vbrgb[0],vbrgb[1],vbrgb[2],vbrgb[3]);
		glclear();			
		moveto(0,0);
		// fill bgcircle
		glcolor(vrgb2);
		circle(0.8);
		// draw arc outline
		glcolor(0,0,0,1);
		circle(0.8,-90-val*360,-90);						
		// fill arc			
		glcolor(vfrgb);
		circle(0.7,-90-val*360,-90);						
		// draw rest of outline
		if (width<=32)
			gllinewidth(1);
		else
			gllinewidth(2);
		glcolor(0,0,0,1);
		moveto(0,0);
		lineto(0,-0.8);
		moveto(0,0);
		theta = (0.75-val)*2*Math.PI;
		lineto(0.8*Math.cos(theta),0.8*Math.sin(theta));
	}
}






// all mouse events are of the form: 
// onevent <x>, <y>, <button down>, <cmd(PC ctrl)>, <shift>, <capslock>, <option>, <ctrl(PC rbutton)>
// if you don't care about the additonal modifiers args, you can simply leave them out.
// one potentially confusing thing is that mouse events are in absolute screen coordinates, 
// with (0,0) as left top, and (width,height) as right, bottom, while drawing 
// coordinates are in relative world coordinates, with (0,0) as the center, +1 top, -1 bottom,
// and x coordinates using a uniform scale based on the y coordinates. to convert between screen 
// and world coordinates, use sketch.screentoworld(x,y) and sketch.worldtoscreen(x,y,z).

function onclick(x,y,but,cmd,shift,capslock,option,ctrl) {
	// cache mouse position for tracking delta movements
	last_x = x;
	last_y = y;
}
onclick.local = 1; //private. could be left public to permit "synthetic" events


function ondrag(x,y,but,cmd,shift,capslock,option,ctrl) {
	var f,dy;
	
	// calculate delta movements
	dy = y - last_y;
	if (shift) { 
		// fine tune if shift key is down
		f = val - dy*0.001; 
	} else {
		f = val - dy*0.01;
	}
	msg_float(f); //set new value with clipping + refresh
	// cache mouse position for tracking delta movements
	last_x = x;
	last_y = y;
}
ondrag.local = 1; //private. could be left public to permit "synthetic" events


function ondblclick(x,y,but,cmd,shift,capslock,option,ctrl) {
	last_x = x;
	last_y = y;
	msg_float(0); // reset dial?
}
ondblclick.local = 1; //private. could be left public to permit "synthetic" events


//function forcesize(w,h) {
//	if (w!=h) {
//		h = w;
//		box.size(w,h);
//	}
//}
//forcesize.local = 1; //private


function onresize(w,h) {
	forcesize(w,h);
	draw();
	refresh();
}
onresize.local = 1; //private

*/