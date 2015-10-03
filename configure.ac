#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([levenshtein], [0.1.1], [rito.0305@gmail.com])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE

# Checks for programs.
AC_PROG_AWK
AS_IF([test -z "AWK"],
      [AC_MSG_ERROR([error: awk is not found])])
AC_SUBST([AWK])

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
                 bin/Makefile
                 share/Makefile
                 tests/Makefile])
AC_OUTPUT([bin/levenshtein share/levenshtein.awk])
