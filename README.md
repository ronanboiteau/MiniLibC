# MiniLibC

A shared library that contains libc functions recoded in x86-64 Assembly.

## Requirements

 - [A Linux distribution](https://en.wikipedia.org/wiki/Linux_distribution)
 - [Make](https://www.gnu.org/software/make/)
 - [GCC](https://gcc.gnu.org/)

## Get started

### Compile the library

Navigate to the root of the repository from your Terminal and run `make` to build the `libasm.so` shared library.

### Use MiniLibC

 - ***Make sure you compile your project with GCC's* `-fno-builtin` *option.*** otherwise GCC will replace some libc functions by its own builtins that you won't be able to override.
 - Use these commands to override the libc functions used in your program by the MiniLibC functions:
   ```sh
   LD_LIBRARY_PATH=$(pwd)
   LD_PRELOAD=/path/to/libasm.so ./your_executable
   ```

## Functions

Here is a list of the prototypes of the libc functions recoded in `libasm.so`:

```cpp
void	*memcpy(void *dest, const void *src, size_t n);
void	*memmove(void *dest, const void *src, size_t n);
void	*memset(void *s, int c, size_t n);
char	*rindex(const char *s, int c);
int	strcasecmp(const char *s1, const char *s2);
char	*strchr(const char *s, int c);
int	strcmp(const char *s1, const char *s2);
size_t	strcspn(const char *s, const char *reject);
size_t	strlen(const char *s);
int	strncmp(const char *s1, const char *s2, size_t n);
char	*strpbrk(const char *s, const char *accept);
```

