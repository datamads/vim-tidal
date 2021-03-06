(
// configure the sound server: here you could add hardware specific options
// see http://doc.sccode.org/Classes/ServerOptions.html

// increase this if you need to load more samples
// s.options.numBuffers = 1024 * 64; 
s.options.numBuffers = 1024 * 128; 

// increase this if you get "alloc failed" messages
s.options.memSize = 8192 * 128; 

// increase this if you are getting drop outs and the message "too many nodes"
s.options.maxNodes = 1024 * 64; 

// Sample rate
s.options.sampleRate= 44100;

// OUTPUT CHANNELS GO  HERE
s.options.numOutputBusChannels = 2; 
s.recSampleFormat = "int24";

// set this to your hardware input channel size, if necessary
s.options.numInputBusChannels = 2; 

//boot the server and start SuperDirt
s.waitForBoot {
 ~dirt = SuperDirt(2, s); // OUTPUT CHANNELS GO HERE ALSO DO NOT FORGET
 ~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)
 s.sync; // wait for samples to be read
 ~dirt.start(57120, [0, 0]);   // start listening on port 57120, create two orbits, each sending audio to channel 0. You can direct sounds to the orbits from tidal e.g. by: `# orbit "0 1 1"
}
)
