#ifndef __PL_RC_FILE__
#define __PL_RC_FILE__

#undef FILE
#define FILE ts_pl_rc_file

#undef fclose
#define fclose rc_file_close

#undef ftell
#define ftell rc_file_tell

#undef fopen
#define fopen rc_file_open

#undef fprintf
#define fprintf rc_file_printf

#undef fwrite
#define fwrite rc_file_write

#undef getc
#define getc rc_file_getc

typedef struct s_pl_rc_file ts_pl_rc_file;

int rc_file_close(ts_pl_rc_file * file);
int rc_file_getc(ts_pl_rc_file * stream);
ts_pl_rc_file * rc_file_open(const char * name, const char * mode);
void rc_file_printf(ts_pl_rc_file * file, const char * fmt, ...);
long rc_file_tell(ts_pl_rc_file * stream);
size_t rc_file_write(const void *restrict ptr, size_t size, size_t nitems, ts_pl_rc_file *restrict stream);

#endif


