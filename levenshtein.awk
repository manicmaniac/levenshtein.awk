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
    i = 0
    while (i <= len1) {
        matrix[i, 0] = i
        i++
    }
    j = 0
    while (j <= len2) {
        matrix[0, j] = j
        j++
    }
    i = 1
    while (i <= len1) {
        j = 1
        while (j <= len2) {
            cost = (chars1[i] == chars2[j]) ? 0 : 1
            x = matrix[i-1, j] + 1
            y = matrix[i, j-1] + 1
            z = matrix[i-1, j-1] + cost
            if (x <= y && x <= z) matrix[i, j] = x
            if (y <= x && y <= z) matrix[i, j] = y
            if (z <= x && z <= y) matrix[i, j] = z
            j++
        }
        i++
    }
    return matrix[len1, len2]
}

