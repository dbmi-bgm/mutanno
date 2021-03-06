#!/usr/bin/env python
# -*- coding: utf-8 -*-
# mk_makedata.py
# made by Daniel Minseok Kwon
# 2020-01-29 10:17:57
#########################
import sys
import os
SVRNAME = os.uname()[1]
if "MBI" in SVRNAME.upper():
    sys_path = "/Users/pcaso/bin/python_lib"
elif SVRNAME == "T7":
    sys_path = "/ms1/bin/python_lib"
else:
    sys_path = "/home/mk446/bin/python_lib"
sys.path.append(sys_path)

def zero_format(i, size):
    # 00001000 format
    s1 = "{:0>" + str(size) + "d}"
    return s1.format(i)



def mk_makedata():
    pos = 1
    k = 0
    flag = True
    while flag:
        k += 1
        epos = pos + bsize - 1
        if epos >= seq_util.CHROM_LEN['b38d']['1']:
            epos = seq_util.CHROM_LEN['b38d']['1']
            flag = False
        cmd = "mutanno makedata -ds /home/mk446/mutanno/SRC/tests/datastructure_v0.3.0_mvp.json"
        cmd += " -out " + path + zero_format(k, 5) + '.tsi'
        cmd += " -vartype SNP"
        cmd += " -blocksize 10000"
        cmd += " -region 1:" + str(pos) + "-" + str(epos)
        print(cmd)
        pos = epos - 1


if __name__ == "__main__":
    import proc_util
    import file_util
    import seq_util
    seq_util.load_refseq_info('b38d')
    bsize = 100000
    path = "/home/mk446/mutanno/DATASOURCE/MUTANOANNOT/mvp_datasource_v0.3_test_tmp/"
    mk_makedata()
