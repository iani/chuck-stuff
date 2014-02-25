// adsr!
// - ianiz

// global noise source 
Noise n;

// sweep shred
fun void note()
{
    //set up the audio chain
    SinOsc s => ADSR e => dac;
    // set a, d, s, and r
    e.set( 10::ms, 8::ms, .5, 500::ms );
    // set gain
    Math.random2(400, 2000) => s.freq;
    Math.random2f(0.01, 0.25) => s.gain;
    e.keyOn();
    18::ms => now;
    e.keyOff();
    500::ms => now;
}

// time loop
while( true )
{ 
    spork ~ note();
    Math.random2(1, 2) * 100::ms => now;
}