/* See LICENSE file for copyright and license details. */
/* vim: expandtab
 */
/* Default settings; can be overrided by command line. */

static Bool topbar = True;                  /* -b  option; if False, dmenu appears at bottom */
static const char *font = "-*-gohufont-medium-r-*-*-11-*-*-*-*-*-iso10646-*";             /* -fn option; default X11 font or font set      */
static const char *prompt = NULL;           /* -p  option; prompt to the elft of input field */
static const char *normbgcolor = "#1D1F21"; /* -nb option; normal background                 */
static const char *normfgcolor = "#707880"; /* -nf option; normal foreground                 */
static const char *selbgcolor  = "#A54242"; /* -sb option; selected background               */
static const char *selfgcolor  = "#C5C8C6"; /* -sf option; selected foreground               */
static const char *outbgcolor  = "#00ffff";
static const char *outfgcolor  = "#000000";
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

