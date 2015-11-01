#ifndef __PL_EXTERN_H__
#define __PL_EXTERN_H__

typedef struct s_pl_rc_file ts_pl_rc_file;
typedef struct stat ts_pl_rc_stat;

int             pl_rc_file_cntl(ts_pl_rc_file * fildes, int cmd, ...);
int             pl_rc_file_close(ts_pl_rc_file * file);
int             pl_rc_file_getc(ts_pl_rc_file * stream);
ts_pl_rc_file * pl_rc_file_open(const char * name, const char * mode);
void            pl_rc_file_printf(ts_pl_rc_file * file, const char * fmt, ...);
int             pl_rc_file_read(ts_pl_rc_file * fildes, void *buf, int nbyte);
int             pl_rc_file_remove(const char *path);
int             pl_rc_file_rename(const char *old, const char *new);
int             pl_rc_file_seek(ts_pl_rc_file * fildes, int offset, int whence);
int             pl_rc_file_stat(ts_pl_rc_file * fildes, ts_pl_rc_stat *buf);
long            pl_rc_file_tell(ts_pl_rc_file * stream);
int             pl_rc_file_write(const void *restrict ptr, int size, int nitems, ts_pl_rc_file *restrict stream);

#endif
