#!/usr/bin/env python
# -*- coding: utf-8 -*-
# convert_phastcon_wigfix2tsi.py
# made by Daniel Minseok Kwon
# 2020-01-27 12:17:38
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


class WIG:
    def __init__(self, fname):
        self.f = file_util.gzopen(fname)
        self.fname = fname
        self.lastline = ''

    def load_block(self, spos, epos):
        self.block = {}
        while True:
            if self.lastline != '':
                line = self.lastline
                self.lastline = ''
            else:
                if self.fname.endswith('.gz'):
                    line = self.f.readline().decode('UTF-8')
                else:
                    line = self.f.readline()
            if line[:len('fixedStep')] == "fixedStep":
                arr = line.split(' ')
                arr[-1] = arr[-1].strip()
                self.pos = int(arr[2].replace('start=', ''))
                self.step = int(arr[3].replace('step=', ''))
            elif line.strip() == '':
                break
            else:
                if self.pos > spos and self.pos <= epos:
                    self.block[self.pos] = line.strip()
                if self.pos > epos:
                    self.lastline = line.strip()
                    break
                self.pos += self.step


class GERP:
    def __init__(self, fname):
        self.f = file_util.gzopen(fname)
        self.lastline = ''

    def load_block(self, spos, epos):
        self.block = {}
        while True:
            if self.lastline != '':
                line = self.lastline
                self.lastline = ''
            else:
                line = self.f.readline().decode('UTF-8')

            if line.strip() == '':
                break
            else:
                if line[0] != '#':
                    arr = line.split('\t')
                    arr[-1] = arr[-1].strip()
                    flag_break = False
                    # print(arr)
                    for posi in range(int(arr[1]) + 1, int(arr[2]) + 1):
                        if posi > spos and posi <= epos:
                            self.block[posi] = arr[3]
                        if posi > epos:
                            self.lastline = line.strip()
                            flag_break = True
                            break
                    if flag_break:
                        break


def convert_phastcon_wigfix2tsi(chrom):
    out = tsifile.replace('#CHROM#', chrom)
    print(out)
    fout = open(out, 'w')
    kslist = list(wigfile.keys())
    fout.write('#CHROM\tPOS\tID\t' + '|'.join(kslist) + '\n')
    f = {}
    for k1 in wigfile.keys():
        if k1 == "GERP":
            f[k1] = GERP(wigfile[k1].replace('#CHROM#', chrom))
        else:
            f[k1] = WIG(wigfile[k1].replace('#CHROM#', chrom))

    spos = 1
    chromlen = seq_util.CHROM_LEN['b38d'][chrom]
    while True:
        if spos + block_size > chromlen:
            epos = chromlen
        else:
            epos = spos + block_size

        for k1 in wigfile.keys():
            f[k1].load_block(spos, epos)
        print(spos, epos)
        for posi in range(spos + 1, epos + 1):
            sclist = []
            flagwrite = False
            for k1 in wigfile.keys():
                try:
                    sc = f[k1].block[posi]
                    flagwrite = True
                except KeyError:
                    sc = ''
                sclist.append(sc)

            if flagwrite:
                cont = [chrom]
                cont.append(str(posi))
                cont.append('')
                cont.append('|'.join(sclist))
                fout.write('\t'.join(cont) + '\n')
        if epos == chromlen:
            break
        spos = epos
    fout.close()


def run():
    for chrom in seq_util.MAIN_CHROM_LIST:
        if chrom == 'MT':
            chrom = "M"
        cmd = "python /home/mk446/mutanno/SRC/scripts/conservation/convert_phastcon_wigfix2tsi.py "
        cmd += chrom
        # cmd += " | bgzip -c "
        # cmd += " > " + tsifile + ";"
        # cmd += "tabix -f -p vcf " + tsifile + ';'
        print(cmd)


if __name__ == "__main__":
    import seq_util
    import file_util
    seq_util.load_refseq_info('b38d')
    block_size = 100000
    wigfile = {}
    wigfile['PHASTCONS100'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHASTCONS/PHASTCONS100WAY/hg38/chr#CHROM#.phastCons100way.wigFix.gz"
    wigfile['PHASTCONS30'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHASTCONS/PHASTCONS30WAY/hg38/chr#CHROM#.phastCons30way.wigFix.gz"
    wigfile['PHASTCONS20'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHASTCONS/PHASTCONS20WAY/hg38/chr#CHROM#.phastCons20way.wigFix"
    # wigfile['PHASTCONS20'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHASTCONS/PHASTCONS20WAY/hg38/hg38.phastCons20way.wigFix.gz"
    wigfile['PHYLOP100'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHYLOP/PHYLOP100WAY/hg38/chr#CHROM#.phyloP100way.wigFix.gz"
    wigfile['PHYLOP30'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHYLOP/PHYLOP30WAY/hg38/chr#CHROM#.phyloP30way.wigFix.gz"
    wigfile['PHYLOP20'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHYLOP/PHYLOP20WAY/hg38/chr#CHROM#.phyloP20way.wigFix"
    # wigfile['PHYLOP20'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/PHYLOP/PHYLOP20WAY/hg38/hg38.phyloP20way.wigFix.gz"
    wigfile['GERP'] = "/home/mk446/mutanno/DATASOURCE/CONSERVATION/GERP/hg38/gerp_conservation_scores.homo_sapiens.GRCh38.bw.#CHROM#.wig.gz"
    tsifile = '/home/mk446/mutanno/DATASOURCE/CONSERVATION/conservation_scores.hg38.chr#CHROM#.tsi'
    if len(sys.argv) > 1:
        chrom = sys.argv[1]
        convert_phastcon_wigfix2tsi(chrom)
    else:
        run()
