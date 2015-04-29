#!/usr/bin/awk -f

# calculate levenshtein distance
#
# @param str1  string to compare
# @param str2  the other string to compare
# @returns     levenshtein distance as integer
#
function levenshtein_distance(str1, str2,    len1, len2, chars1, chars2, i, j, matrix, cost, x, y, z) {
    len1 = length(str1)
    len2 = length(str2)
    if (len1 == 0) return len2
    if (len2 == 0) return len1
    if (str1 == str2) return 0
    split(str1, chars1, "")
    split(str2, chars2, "")
    for (i = 0; i <= len1; i++) {
        matrix[i, 0] = i
    }
    for (j = 0; j <= len2; j++) {
        matrix[0, j] = j
    }
    for (i = 1; i <= len1; i++) {
        for (j = 1; j <= len2; j++) {
            cost = (chars1[i] == chars2[j]) ? 0 : 1
            x = matrix[i-1, j] + 1
            y = matrix[i, j-1] + 1
            z = matrix[i-1, j-1] + cost
            if (x <= y && x <= z) matrix[i, j] = x
            if (y <= x && y <= z) matrix[i, j] = y
            if (z <= x && z <= y) matrix[i, j] = z
        }
    }
    return matrix[len1, len2]
}

