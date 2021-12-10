# https://www.hackerrank.com/challenges/new-year-chaos/problem

require 'set'

# solution O(n)
def minimumBribes(q)
  gaps = Set.new
  expected = 1
  total_bribes = 0

  q.each_with_index do |sticker, position|
    gaps.delete sticker
    if sticker == expected
      expected = gaps.min || position + 2
      next
    end
    
    shift = sticker - 1 - position
    if shift > 2
      puts 'Too chaotic'
      return
    end

    # adding gap
    if shift > gaps.size
      from = sticker - 1
      while gaps.size < shift
        gaps.add from
        from -= 1
      end
    elsif !shift.positive?
      shift = gaps.size
    end

    total_bribes += shift
  end

  puts total_bribes
end


def minimumBribes_wrong4(q)
  total_bribes = 0
  expected = 1
  shift = 0
  max_seen = 0

  q.each_with_index do |sticker, position|
    max_seen = sticker if sticker > max_seen
    initial_position = sticker - 1
    if initial_position == position
      expected += 1
      shift = 0
      next
    end

    bribes = initial_position - position
    if bribes > 2
      puts 'Too chaotic'
      return
    elsif bribes.positive?
      total_bribes += bribes
      shift = bribes
    end

    next if max_seen == sticker

    if sticker == expected
      expected = position + (3 - shift)
      shift -= 1
    else
      shift = 1
      total_bribes += 1
    end
  end

  puts total_bribes
end

def minimumBribes_wrong3(q)
  total_bribes = 0
  shifts = 0

  q.each_with_index do |sticker, position|
    initial_position = sticker - 1
    relative_position = initial_position + shifts
    bribes = relative_position - position
    if bribes > 2
      puts 'Too chaotic'
      return
    end
    total_bribes += bribes
    
    if initial_position == position
      shifts = 0
    elsif relative_position > position
      shifts += 1
    end
  end

  puts total_bribes
end


def minimumBribes_wrong2(q)
  seen = Set.new
  total_bribes = 0
  gap = 0
  expected = 1

  q.each_with_index do |sticker, position|
    seen.add(sticker)
    initial_position = sticker - 1
    if (initial_position - position) > 2
      puts 'Too chaotic'
      return
    end

    if sticker == expected
      gap = 0
      loop do 
        expected += 1
        break if (seen.size < expected) || !seen.include?(expected)
      end
      next
    end

    # check if bribed
    [sticker - 1, sticker - 2].each do |previous|
      next if previous <= 0
      gap += 1 unless gap == 2 || seen.include?(previous)
    end

    total_bribes += gap
  end

  puts total_bribes
end

# sticker: 1 - n (position in queue)
# each person: 2 bribes
# logic: if a number is found earlier than expected, that means
#   that number has bribed another number in front
#   the index difference is the number of bribes
# WRONG
def minimumBribes_wrong(q)
  total_bribes = 0
  q.each_with_index do |sticker, position|
    initial_position = sticker - 1
    next if initial_position <= position
    bribes = initial_position - position
    if bribes > 2
      puts 'Too chaotic'
      return
    end

    total_bribes += bribes
  end

  puts total_bribes
end


def position_check_old(q)
  bribes = 0;
  shifts = 0;
  expected = 1
  q.each_with_index do |sticker, position|
    if sticker == expected
      expected = position + 2 - shifts
      shifts = 0
      next
    end

    initial_position = sticker - 1
    relative_position = position - initial_position

    if relative_position.negative?
      bribes += relative_position.abs
      shifts += 1
    elsif relative_position.positive?
      shifts -= 1 if shifts.positive?
      bribes += 1
      #p [sticker, position, :|, relative_position, :|, shifts, bribes]
    end
  end
  p bribes
end

def position_check(q)
  seen = Set.new
  bribes = 0;
  shifts = 0;
  expected = 1
  q.each_with_index do |sticker, position|
    seen.add sticker
    if sticker == expected
      expected = position + 2 - shifts
      shifts = 0
      next
    end

    initial_position = sticker - 1
    relative_position = position - initial_position

    if relative_position.negative?
      bribes += relative_position.abs
      shifts += 1
    elsif relative_position.positive?
      shifts -= 1 if shifts.positive?
      bribes += 1
      #p [sticker, position, :|, relative_position, :|, shifts, bribes]
    end
  end
  p bribes
end

def search_missing(q)
  bribes = 0
  expected = 1
  q.each_with_index do |sticker, position|
    next if sticker < expected

    initial_position = sticker - 1
    relative_position = initial_position - position
    if relative_position > 2
      puts 'Too chaotic'
      return
    elsif relative_position > 0
      bribes += relative_position
    end

    if sticker == expected
      expected += 1
      next
    end
    
    expected = sticker + 1
    next if relative_position == 1
    
    # checking if the skipped pair has an internal bribe
    i = position + 1
    while i < q.size
      break if q[i] == (sticker - 2)
      if q[i] == (sticker - 1)
        bribes += 1 
        break
      end
      i += 1
    end
  end

  bribes
end

# SOLUTION, but too slow. this is a O(n^2)
def bribes_by_seen(q)
  seen = Set.new
  total_bribes = 0

  q.each do |sticker|
    current_bribes = 0
    start = sticker - 1
    while start.positive?
      current_bribes += 1 unless seen.include? start
      start -= 1
    end
    if current_bribes > 2
      puts 'Too chaotic'
      return
    end
    total_bribes += current_bribes
    seen.add sticker
  end

  puts total_bribes
end

# FINAL SOLUTION, O(n)
def bribes_by_seen_with_expected(q)
  gaps = Set.new
  expected = 1
  total_bribes = 0

  q.each_with_index do |sticker, position|
    gaps.delete sticker
    if sticker == expected
      expected = gaps.min || position + 2
      next
    end
    
    # adding gap
    shift = sticker - 1 - position
    if shift > 2
      puts 'Too chaotic'
      return
    end

    if shift > gaps.size
      from = sticker - 1
      while gaps.size < shift
        gaps.add from
        from -= 1
      end
    elsif !shift.positive?
      shift = gaps.size
    end

    total_bribes += shift
  end

  puts total_bribes
end


def _check_relative(q)
  q.each_with_index.map do |sticker, position|
    [position, sticker, position - (sticker - 1)]
  end
end
# test area

# expected 0
input_base = 1, 2, 3, 4, 5, 6

# expected 3
input = 2, 1, 5, 3, 4

# expected 7
input2 = 1, 2, 5, 3, 7, 8, 6, 4, 9

# expected 4
input3 = 1, 2, 5, 3, 4, 7, 8, 6

input3a = 1, 2, 5, 4, 3, 7, 8, 6

# expected 67
input4 = 2, 1, 3, 4, 6, 5, 7, 10, 9, 8, 11, 14, 15, 12, 13, 17, 16, 20, 18, 19, 22, 23, 21, 24, 27, 26, 25, 29, 28, 32, 30, 34, 31, 33, 35, 37, 36, 39, 38, 42, 43, 41, 40, 44, 47, 45, 46, 48, 50, 51, 49, 52, 55, 54, 53, 56, 57, 59, 60, 58, 63, 61, 64, 62, 65, 66, 68, 67, 69, 70, 73, 71, 75, 76, 74, 77, 72, 78, 79, 81, 80, 84, 82, 85, 86, 88, 83, 87, 89, 91, 90, 92, 95, 96, 93, 94, 98, 99, 101, 100, 97, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 900, 901, 902, 903, 904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 947, 948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991

# expected 9
input5 = 2, 1, 3, 4, 6, 5, 7, 10, 9, 8, 11, 14, 15, 12, 13

#expected 7
input6 = 2, 1, 4, 3, 7, 5, 6, 8, 10, 9, 13, 11, 12

# expected 66
input7 = 2,3,1,5,7,4,6,9,10,8,12,11,15,13,14,18,19,17,16,21,20,23,24,22,26,25,28,27,31,29,30,32,34,35,36,33,38,37,39,40,42,41,45,44,43,46,48,47,49,52,51,50,54,56,53,57,55,58,60,62,59,63,64,66,61,67,65,68,70,71,69,72,73,74,77,75,76,79,78,82,80,81,83,86,85,84,87,88,89,91,93,92,90,94,97,98,95,99,96,101,100,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,974,975,976,977,978,979,980,981,982

# minimumBribes(input5)


bribes_by_seen_with_expected(input_base)
bribes_by_seen_with_expected(input)
bribes_by_seen_with_expected(input2)
bribes_by_seen_with_expected(input3)
bribes_by_seen_with_expected(input3a)
bribes_by_seen_with_expected(input4)
bribes_by_seen_with_expected(input5)
bribes_by_seen_with_expected(input6)
bribes_by_seen_with_expected(input7)

# position_check(input_base)
# position_check(input)
# position_check(input2)
# position_check(input3)
# position_check(input3a)
# position_check(input6)
# position_check(input5)
# position_check(input4)


#p _check_relative(input4)



