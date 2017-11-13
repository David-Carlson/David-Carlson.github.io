void setup() {
  size(400, 400);
}
// Used to only draw on changed temperatures
var keepLastFrame = false;

// Encapsulates the slider, which stores a value between the min/max allowed.
var Slider = function (){
    // Positioning data
    this.leftX = 40;
    this.rightX = 366;
    this.topY = 20;
    this.botY = 46;
    this.sliderPos = (this.leftX+this.rightX)/2;
    // Change of values and stored value
    this.minVal = 10;
    this.maxVal = 7000;
    this.value = (this.maxVal+this.minVal)/2;
    this.percent = 50;
    this.draw = function(tempColor) {
        stroke(250, 250, 250);
        strokeWeight(2);
        var y = (this.topY + this.botY)/2;
        line(this.leftX,y, this.rightX, y);

        fill(tempColor);
        ellipse(this.sliderPos, y, 15, 15);

        fill(255, 255, 255);
        text(this.minVal + " Kelvin", this.leftX-1, this.botY+10);
        text(this.maxVal + " Kelvin", this.rightX-61, this.botY +10);
        text("Temperature: " + this.value.toPrecision(4) + " degrees Kelvin", this.leftX + 76, this.topY);
    };
    // Calculates the temperature based on the percent through sliding
    this.calculateValue = function() {
        this.percent = (this.sliderPos - this.leftX)/(this.rightX - this.leftX);
        this.value = (1 - this.percent) * this.minVal + this.percent * this.maxVal;
    };

    // Checks if the slider was pressed. If so, gets temperature and returns true
    this.sliderClicked = function() {
        if(mouseX > this.leftX && mouseX < this.rightX && mouseY > this.topY && mouseY < this.botY) {
            this.sliderPos = mouseX;
            this.calculateValue();
            return true;
        }
        else {
            return false;
        }
    };
};
var slider = new Slider();
//////////////////////////////////////////////////////////////////////////////

// This lists the sensitivy of the CIE X tristimulus value
// as wavelength increases. It is integrated against the power of any given wavelength to find X. X and Z represent the color of the spectrum.
var CIE_xbar = [ 0.000129900000, 0.000232100000,
                0.000414900000, 0.000741600000, 0.001368000000, 0.002236000000,
                0.004243000000, 0.007650000000, 0.014310000000, 0.023190000000,
                0.043510000000, 0.077630000000, 0.134380000000, 0.214770000000,
                0.283900000000, 0.328500000000, 0.348280000000, 0.348060000000,
                0.336200000000, 0.318700000000, 0.290800000000, 0.251100000000,
                0.195360000000, 0.142100000000, 0.095640000000, 0.057950010000,
                0.032010000000, 0.014700000000, 0.004900000000, 0.002400000000,
                0.009300000000, 0.029100000000, 0.063270000000, 0.109600000000,
                0.165500000000, 0.225749900000, 0.290400000000, 0.359700000000,
                0.433449900000, 0.512050100000, 0.594500000000, 0.678400000000,
                0.762100000000, 0.842500000000, 0.916300000000, 0.978600000000,
                1.026300000000, 1.056700000000, 1.062200000000, 1.045600000000,
                1.002600000000, 0.938400000000, 0.854449900000, 0.751400000000,
                0.642400000000, 0.541900000000, 0.447900000000, 0.360800000000,
                0.283500000000, 0.218700000000, 0.164900000000, 0.121200000000,
                0.087400000000, 0.063600000000, 0.046770000000, 0.032900000000,
                0.022700000000, 0.015840000000, 0.011359160000, 0.008110916000,
                0.005790346000, 0.004106457000, 0.002899327000, 0.002049190000,
                0.001439971000, 0.000999949300, 0.000690078600, 0.000476021300,
                0.000332301100, 0.000234826100, 0.000166150500, 0.000117413000,
                0.000083075270, 0.000058706520, 0.000041509940, 0.000029353260,
                0.000020673830, 0.000014559770, 0.000010253980, 0.000007221456,
                0.000005085868, 0.000003581652, 0.000002522525, 0.000001776509,
                0.000001251141];

// This lists the sensitivy of the CIE Y tristimulus value
// as wavelength increases. It is integrated against the power of any given wavelength to find Y. Y represents luminosity of a spectrum
var CIE_ybar = [ 0.000003917000, 0.000006965000,
                0.000012390000, 0.000022020000, 0.000039000000, 0.000064000000,
                0.000120000000, 0.000217000000, 0.000396000000, 0.000640000000,
                0.001210000000, 0.002180000000, 0.004000000000, 0.007300000000,
                0.011600000000, 0.016840000000, 0.023000000000, 0.029800000000,
                0.038000000000, 0.048000000000, 0.060000000000, 0.073900000000,
                0.090980000000, 0.112600000000, 0.139020000000, 0.169300000000,
                0.208020000000, 0.258600000000, 0.323000000000, 0.407300000000,
                0.503000000000, 0.608200000000, 0.710000000000, 0.793200000000,
                0.862000000000, 0.914850100000, 0.954000000000, 0.980300000000,
                0.994950100000, 1.000000000000, 0.995000000000, 0.978600000000,
                0.952000000000, 0.915400000000, 0.870000000000, 0.816300000000,
                0.757000000000, 0.694900000000, 0.631000000000, 0.566800000000,
                0.503000000000, 0.441200000000, 0.381000000000, 0.321000000000,
                0.265000000000, 0.217000000000, 0.175000000000, 0.138200000000,
                0.107000000000, 0.081600000000, 0.061000000000, 0.044580000000,
                0.032000000000, 0.023200000000, 0.017000000000, 0.011920000000,
                0.008210000000, 0.005723000000, 0.004102000000, 0.002929000000,
                0.002091000000, 0.001484000000, 0.001047000000, 0.000740000000,
                0.000520000000, 0.000361100000, 0.000249200000, 0.000171900000,
                0.000120000000, 0.000084800000, 0.000060000000, 0.000042400000,
                0.000030000000, 0.000021200000, 0.000014990000, 0.000010600000,
                0.000007465700, 0.000005257800, 0.000003702900, 0.000002607800,
                0.000001836600, 0.000001293400, 0.000000910930, 0.000000641530,
                0.000000451810];
// This lists the sensitivy of the CIE Z tristimulus value
// as wavelength increases. It is integrated against the power of any given wavelength to find X. X and Z represent the color of the spectrum.
var CIE_zbar = [ 0.000606100000, 0.001086000000,
                0.001946000000, 0.003486000000, 0.006450001000, 0.010549990000,
                0.020050010000, 0.036210000000, 0.067850010000, 0.110200000000,
                0.207400000000, 0.371300000000, 0.645600000000, 1.039050100000,
                1.385600000000, 1.622960000000, 1.747060000000, 1.782600000000,
                1.772110000000, 1.744100000000, 1.669200000000, 1.528100000000,
                1.287640000000, 1.041900000000, 0.812950100000, 0.616200000000,
                0.465180000000, 0.353300000000, 0.272000000000, 0.212300000000,
                0.158200000000, 0.111700000000, 0.078249990000, 0.057250010000,
                0.042160000000, 0.029840000000, 0.020300000000, 0.013400000000,
                0.008749999000, 0.005749999000, 0.003900000000, 0.002749999000,
                0.002100000000, 0.001800000000, 0.001650001000, 0.001400000000,
                0.001100000000, 0.001000000000, 0.000800000000, 0.000600000000,
                0.000340000000, 0.000240000000, 0.000190000000, 0.000100000000,
                0.000049999990, 0.000030000000, 0.000020000000, 0.000010000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000, 0.000000000000, 0.000000000000, 0.000000000000,
                0.000000000000];

// Helper function to test my program.
var printColor = function (name, color){
    println(name + ": " + red(color) + " " + green(color)+ " " + blue(color));
};
// This scales the luminance to roughly mimic actual brightness without extreme
// gamma correction. Below min temp it scales to black, above max temp it scales
// to max brightness without affecting hue. Between those values it uses a parabola
// to find a scale value from 0-1
var parabolicScale = function(temp, min, max) {
    if(temp < min) {
        return 0;
    }
    else if(temp > max) {
        return 1;
    }
    else {
        // Values found using wolfram Alpha
        var A = 4.8902e-7;var B = -0.000753;var C = 0.2899;
        return A*pow(temp,2) + B*temp + C;
    }
};


// Turns a spectrum of electromagnetic radiation into scaled RGB values
var Spectrum = function() {
    // The bounds of visible light
    this.wavelengthMin = 360;
    this.wavelengthMax = 860;
    // deltaWavelength, used in integration
    this.wavelengthStep = (this.wavelengthMax-this.wavelengthMin) / CIE_xbar.length;
    this.tempColor = color(0,0,0);

    // A coordinate matrix to convert from xyz to RGB
    this.rx = 0.41847;
    this.ry = -0.151866;
    this.rz = -0.082825;
    this.gx = -0.091169;
    this.gy = 0.25243;
    this.gz = 0.015708;
    this.bx = 0.0009209;
    this.by = -0.002549;
    this.bz = 0.1786;

    // Calculates Planck's Radiation law:
    // Given a wavelength and temperature, returns
    // the power emitted due to black body radiation
    this.getIntensity = function(lambda, temp) {

        // Wavelength
        var waveL = lambda * 1e-9;
        // Planck constant
        var H = 6.626070e-34;
        // Speed of light
        var C = 299792458;
        // Boltzmann constant
        var K = 1.380648e-23;
        // Euler number
        var E = 2.71828182845;
        // Absolute temperature
        var T = temp;
        // Constant1 = 2*PI*H*C^2
        var C1 = 3.74183e-16;
        // Constant2 = H*C/K
        var C2 = 1.4388e-2;

        return ((C1 * pow(waveL, -5.0)) / (exp(C2 / ( waveL* temp)) - 1.0));
    };

    // Given a temperature, this sums the power at a wavelength
    // with the X,Y,Z response at that wavelength (given above in arrays).
    // This integration finds a color in CIE form
    this.toXYZ = function(temp) {
        var X = 0; var Y = 0; var Z = 0;
        for (var i = 0, w = this.wavelengthMin; i < CIE_xbar.length; i++, w += this.wavelengthStep) {
            var I = this.getIntensity(w, temp);
            X += I * CIE_xbar[i];
            Y += I * CIE_ybar[i];
            Z += I * CIE_zbar[i];
        }
        // Normaly would multiply by wavelengthStep. Unneccessary since I scale
        // the luminance later
        return new PVector(X, Y, Z);
    };

    // This converts into RGB coordinates, then scales the values for display.
    // Above 2200 K the color is as bright as possible. Below 770 K it is black.
    this.toRGB = function(xyz, temp) {
        //println("B4 xyz: " + XYZ.x + " " + XYZ.y + " " + XYZ.z);

        var r = this.rx*xyz.x + this.ry*xyz.y + this.rz*xyz.z;
        var g = this.gx*xyz.x + this.gy*xyz.y + this.gz*xyz.z;
        var b = this.bx*xyz.x + this.by*xyz.y + this.bz*xyz.z;

        var maxVal = max(r, max(g, b));
        // This makes the largest value exactly 255, others scaled accordingly
        var scale = 255 / maxVal;
        // This limits the scale such that at low temperatures I get a black-body
        // 770 Kelvin is about where the radiation is visible.
        // 2200 Kelvin is where I arbitrarily stop brightening the color.
        var percent = parabolicScale(temp,770,2200);
        return color(r*scale*percent,g*scale*percent,b*scale*percent);
    };
    // Converts spectrum into XYZ, XYZ into xyz chromaticity coordinates (scaled).
    // then converts into a manually scaled RGB color
    this.getColor = function(temp) {
        var XYZ = this.toXYZ(temp);
        var length = XYZ.x + XYZ.y + XYZ.z;

        var xyz = new PVector(XYZ.x/length, XYZ.y/length, XYZ.z/length);
        //println("printColor " + temp);
        this.tempColor =  this.toRGB(xyz, temp);
        return this.tempColor;
    };
};
var spectrum = new Spectrum();
//////////////////////////////////////////////////////////////////////////////

// Draws the hot bar programmatically
var drawBar = function() {
    stroke(8, 8, 8);
    strokeWeight(1);
    // Coordinates of top left point of bar
    var xpos = 66; var ypos = 320
    ;
    // dimensions of bar
    var width = 247; var height = 16;
    // Difference between top left point and the top left of the rect within the bar
    // AKA the perception of angle to the bar.
    var xdiff = 28; var ydiff = 9;
    // Make the bar the color corresponding to its temp
    fill(spectrum.tempColor);

    rect(xpos + xdiff, ypos+ydiff, width, height);
    quad(xpos, ypos, xpos+width, ypos, xpos+width+xdiff, ypos+ydiff,xpos+xdiff, ypos+ydiff);
    quad(xpos, ypos, xpos+xdiff, ypos+ydiff, xpos+xdiff, ypos+ydiff+height, xpos, ypos+height);
};
///////////////////////////////////////////////////////////////////////////////////

// Draws the power of each wavelength for a given temperature
var Graph = function() {
    this.pos = new PVector(66, 272);
    this.width = 283; this.height = 162;
    // Used to scale graph bounds
    this.maxLambda = 3000; this.maxPower = 10e12;
    // Accounts for graph accuracy.
    this.stepTotal = 33; this.stepSize = this.maxLambda / this.stepTotal;
    this.convertRange = function(val, max, newMax) {
        return val/max * newMax;
    };

    this.draw = function() {
        // Draw the Spectral power function
        stroke(spectrum.tempColor);
        strokeWeight(2);
        var temp = slider.value;
        var skippedLine = false;
        for (var i = 0, w = 10; i < this.stepTotal; i++, w += this.stepSize) {

            var I = spectrum.getIntensity(w, temp);
            var I2 = spectrum.getIntensity(w+this.stepSize, temp);
            if (I > this.maxPower*2 || I2 > this.maxPower*2) {
                if (skippedLine) {
                    continue;
                }
                else {
                    skippedLine = true;
                }
            }

            var x1 = this.pos.x + this.convertRange(i, this.stepTotal, this.width);
            var y1 = this.pos.y - this.convertRange(I, this.maxPower, this.height);


            var x2 = this.pos.x + this.convertRange(i+1, this.stepTotal, this.width);
            var y2 = this.pos.y - this.convertRange(I2, this.maxPower, this.height);

            line(x1,y1, x2, y2);
        }
        // Draw the Axes' labels
        strokeWeight(2);
        fill(255, 255, 255);
        text("Wavelength λ - (nm)", this.pos.x + 81, this.pos.y+22);
        text(this.maxLambda + " nm", this.pos.x + 241, this.pos.y+22);
        pushMatrix();
        rotate(-90);
        text("Spectral Radiance", -this.pos.y+30, 43);
        popMatrix();
        text(this.maxPower.toPrecision(1), this.pos.x +-45, this.pos.y -this.height+8);
        // Draw the visible wavelength lines
        strokeWeight(1);
        stroke(191, 0, 255);
        var visibleX1 = this.convertRange(spectrum.wavelengthMin, 3000,this.width);
        var visibleX2 = this.convertRange(spectrum.wavelengthMax, 3000,this.width);
        line(this.pos.x+visibleX1, this.pos.y, this.pos.x+visibleX1, this.pos.y-this.height);
        stroke(255, 0, 0);
        line(this.pos.x+visibleX2, this.pos.y, this.pos.x+visibleX2, this.pos.y-this.height);
        fill(13, 255, 243);
        text("Visible range", this.pos.x+24, this.pos.y-this.height+-5);

        // Draw Axes
        stroke(255, 255, 255);
        strokeWeight(4);
        line(this.pos.x, this.pos.y, this.pos.x, this.pos.y-this.height);
        line(this.pos.x, this.pos.y, this.pos.x+this.width, this.pos.y);
    };
};
var graph = new Graph();
////////////////////////////////////////////////////////////////////////////////

draw = function() {
    if(!keepLastFrame) {
        var clr = spectrum.getColor(slider.value);
        background(81, 107, 135);
        slider.draw(spectrum.tempColor);
        drawBar();
        graph.draw();
        keepLastFrame = true;
    }
};

mouseDragged = function()
{
    if (slider.sliderClicked())
    {
        keepLastFrame = false;
    }
};
