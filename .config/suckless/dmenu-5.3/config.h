/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;
static int min_width = 500;
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Victor Mono:size=11"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*                  fg         bg       */
    [SchemeNorm] = { "#AFA099", "#1C1917" },    /* Normal items - using col_gray3 for fg, col_gray1 for bg */
    [SchemeSel]  = { "#B4BDC3", "#1C1917" },    /* Selected item - using col_tag_active for fg, col_gray1 for bg */
    [SchemeOut]  = { "#B4BDC3", "#1C1917" },    /* Output - matching normal items */
    [SchemeBorder] = { "#AFA099", NULL },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 5;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
static unsigned int border_width = 1;
