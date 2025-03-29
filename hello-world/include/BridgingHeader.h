#include <3ds.h>
#include <stdio.h>

static inline void gspWaitForVBlankWrapper(void) {
    gspWaitForVBlank();
}
