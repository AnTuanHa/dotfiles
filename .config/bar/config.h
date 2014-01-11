/* The height of the bar (in pixels) */
#define BAR_HEIGHT  18
/* The width of the bar. Set to -1 to fit screen */
#define BAR_WIDTH   -1
/* Offset from the left. Set to 0 to have no effect */
#define BAR_OFFSET 0
/* Choose between an underline or an overline */
#define BAR_UNDERLINE 1
/* The thickness of the underline (in pixels). Set to 0 to disable. */
#define BAR_UNDERLINE_HEIGHT 2
/* Default bar position, overwritten by '-b' switch */
#define BAR_BOTTOM 0
/* The fonts used for the bar, comma separated. Only the first 2 will be used. */
// #define BAR_FONT       "-*-terminus-medium-r-normal-*-12-*-*-*-c-*-*-1","fixed"
#define BAR_FONT "-*-tewi-medium-*-*-*-*-*-*-*-*-*-*-*", "fixed"
/* Some fonts don't set the right width for some chars, pheex it */
#define BAR_FONT_FALLBACK_WIDTH 6
/* Define the opacity of the bar (requires a compositor such as compton) */
#define BAR_OPACITY 1.0 /* 0 is invisible, 1 is opaque */
/* Color palette */
#define BACKGROUND 0x1d1f21
#define FOREGROUND 0xc5c8c6
#define COLOR0 0x282a2e
#define COLOR1 0xcc6666
#define COLOR2 0xf0c674
#define COLOR3 0xde935f
#define COLOR4 0x81a2be
#define COLOR5 0xb294bb
#define COLOR6 0x8abeb7
#define COLOR7 0x707880
#define COLOR8 0x373b41
#define COLOR9 0xb5bd68
