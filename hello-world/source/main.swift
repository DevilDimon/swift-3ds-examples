@main
struct App {
    static func main() {
        gfxInitDefault()

        // Initialize console on top screen. Using NULL as the second argument tells the console library to use the internal console structure as current one
        consoleInit(GFX_TOP, nil)

        // Move the cursor to row 15 and column 19 and then prints "Hello Swift!"
        // To move the cursor you have to print "\u{1B}[r;cH", where r and c are respectively
        // the row and column where you want your cursor to move
        // The top screen has 30 rows and 50 columns
        // The bottom screen has 30 rows and 40 columns
        print("\u{1B}[16;20HHello Swift!")

        print("\u{1B}[30;16HPress Start to exit.")

        // Main loop
        while aptMainLoop() {
            // Scan all the inputs. This should be done once for each frame
            hidScanInput()

            // hidKeysDown returns information about which buttons have been just pressed (and they weren't in the previous frame)
            let kDown = hidKeysDown()

            if kDown & KEY_START != 0 {
                break // break in order to return to hbmenu
            }

            // Flush and swap framebuffers
            gfxFlushBuffers()
            gfxSwapBuffers()

            // Wait for VBlank
            // Can't use the function above because C interop doesn't support func macros
            // https://forums.swift.org/t/unavailable-function-like-macros-not-supported/73366
            // So I use the manual inline wrapper around it
            gspWaitForVBlankWrapper()
        }

        gfxExit()
    }
}
