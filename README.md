# levenshtein.awk

An Awk library to measure the difference between 2 words.

## Compatibility

Any of POSIX Awk families.

includes:

- awk (one true Awk)
- nawk
- gawk
- igawk
- tawk

## Usage

### `gawk` or `igawk`

Add this line in the top of your Awk program.

    @include "levenshtein.awk"

### other `awk` families

Execute with `-f` option.

    awk -f levenshtein_distance -f your_Awk_program

### API

    levenshtein_distance(str1, str2)

- parameter `str1` is the string to compare.
- parameter `str2` is the other string to compare with `str1`.
- returns the cost to replace `str1` into `str2`.

## Install

### `git`

    git clone https://github.com/manicmaniac/levenshtein.awk

### `wget`

    wget https://raw.githubusercontent.com/manicmaniac/levenshtein.awk/master/levenshtein.awk

### `curl`

    curl https://raw.githubusercontent.com/manicmaniac/levenshtein.awk/master/levenshtein.awk > levenshtein.awk

Optional:

If you use `gawk`, you can set `$AWKPATH` environment variable.

    AWKPATH="path/to/levenshtein.awk:$AWKPATH"

See [gawk's manual](https://www.gnu.org/software/gawk/manual/html_node/Include-Files.html) for more information.

## Testing

Before testing, you should install submodules.

    git submodule init
    git submodule update

Then run test.

    ./tests/test-runner.sh

## License

See [LICENSE.txt](LICENSE.txt).

