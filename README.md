# Embedded Swift on 3DS examples

This repo demonstrates how Embedded Swift can be used as a language for writing 3DS Homebrew.

It is not intended to be a full-featured Swift wrapper of [libctru](https://libctru.devkitpro.org/index.html), it's just a few examples to show that Swift can compile and run on 3DS.

# Building 
The following assumes you're running macOS 15. Linux/Windows should be similar.

* Set up your 3DS Homebrew environment as if you did that without Swift. Install devkitPro and the 3DS package. The instructions (slightly outdated, use zshrc instead of bashrc) can be found on [GBAtemp Wiki](https://wiki.gbatemp.net/wiki/3DS_Homebrew_Development). Make sure that you can succeffully compile and run a program for 3DS before proceeding further.
* Install the latest Swift development snapshot. I used [Swiftly](https://github.com/swiftlang/swiftly), but you can download the snapshot and set it up in env manually. Using Swiftly (the repo already has the correct version file):
 
```
 swiftly install
 hash -r
```

* Make sure that your zsh environment point to the version of Swift that ends with dev:

```
> swift -version
Apple Swift version 6.2-dev (LLVM 6f817b270d9dadc, Swift d36b06747a54689)
Target: arm64-apple-macosx15.0
Build config: +assertions
```

* Navigate to the folder with an example and execute `make`. The new `*.3dsx` file should appear, which is the program executable Swift on 3DS!
* You can also try the Xcode project – open the project and Build. It is not tested to work outside my machine.


# Running

Launch the resulting 3dsx file in your favourite emulator or transfer to device. When using the real device, put it into the 3ds/ folder of the SD card and run with Homebrew Launcher.

# Acknowledgements

I navigated the dark corners of makefile syntax using [@finnvoor's](https://github.com/finnvoor) work in [swift-switch-examples](https://github.com/finnvoor/swift-switch-examples). The example itself is courtesy of [libctru](https://github.com/devkitPro/libctru).
