# python mutanno.py annot -vcf ./tests/test1.vcf -out ./tests/test1.annot.vcf -ds datastructure_v0.2.5_mvp.json
# tabixgz ./tests/test1.annot.vcf
# cp ./tests/test1.annot.vcf.gz ../TESTDATA/CGAP_PLATFORM_TESTSET/mutanno_v0.2.5_test1.annot.vcf.gz
# python mutanno.py convert -vcf ./tests/test1.annot.vcf -out ./tests/test1.annot.txt -outformat tab
# cat test1.annot.vcf
# colhead test1.annot.txt
# cat ./tests/test1.annot.txt | grep PUBMED
# cat ./tests/test1.annot.txt | grep Consequence
# cat ./tests/test1.annot.txt | grep DOMAINS
# cat ./tests/test1.annot.txt | grep CLNDN
# cat ./tests/test1.annot.txt | grep CLNDNINCL
# python mutanno.py annot -vcf test_trio.vcf -out test_trio.annot.vcf -ds datastructure_gnomadonly.json
# python mutanno.py annot -vcf test_trio_JC50.vcf -out test_trio_JC50.annot.vcf -ds datastructure_gnomadonly.json



### make_dbnsfp_transcript
# python mutanno.py preprocess -make_dbnsfp_transcript -infile /home/mk446/bio/mutanno/DATASOURCE/VARIANTDB/dbNSFP/hg38/dbNSFP4.0a_variant.chr1.gz -out /home/mk446/bio/mutanno/DATASOURCE/VARIANTDB/dbNSFP/hg38/dbNSFP4.0a_transcript.chr1.gz -ds datastructure_v0.2.5_mvp.json


### make a single data source file
# python mutanno.py makedata -out datasource_microannot_v1.0.vcf -ds datastructure_microannot_v1.0.json


# python mutanno.py annot -vcf /home/mk446/bio/DATA/AshkenazimTrio/hg38/TRIO.x60/Trio.hs38d1.60x.1.GVCF.mnvindel.vqsr.vcf.gz -out ./test_trio_all.annot.vcf -ds datastructure_microannot_v1.0.json
# python mutanno.py annot -vcf /home/mk446/bio/DATA/AshkenazimTrio/hg38/TRIO.x60/Trio.hs38d1.60x.1.GVCF.mnvindel.vqsr.vcf.gz -out ./test_trio_all.annot2.vcf -ds datastructure_gnomadonly_v3.json

#################################
# Test precalculation
#################################
# python mutanno.py precal -run_vep \
#     -out ../PRECALVEP \
#     -fasta /n/data1/hms/dbmi/park/SOFTWARE/REFERENCE/GRCh38d1/GRCh38_full_analysis_set_plus_decoy_hla.fa \
#     -vepcache /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/nonindexed_vep_cache/homo_sapiens_merged \
#     -vep /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/ensembl-vep-release-98/vep \
#     -cache_version 98

# python mutanno.py precal -check_vep_result \
#     -vcf /n/data1/hms/dbmi/park/daniel/BiO/Research/mutanno/PRECALVEP/chr1/0/chr1_10001_11000.vcf \
#     -vep_result t.txt
    # -vep_result /n/data1/hms/dbmi/park/daniel/BiO/Research/mutanno/PRECALVEP/chr1/0/chr1_10001_11000.vcf.vep.txt




#################################
# Test convert
#################################
# mutanno convert -in /home/mk446/bio/mutanno/DATASOURCE/SPLICING/SpliceAI/hg38/spliceai_scores.raw.snv.hg38.vcf.gz -ds /home/mk446/bio/mutanno/SRC/datastructure/spliceai.20191004.hg38.json -out /home/mk446/bio/mutanno/DATASOURCE/SPLICING/SpliceAI/hg38/spliceai.20191004.hg38 -chromsplit
# mutanno convert -in /home/mk446/bio/mutanno/DATASOURCE/VARIANTDB/CLINVAR/hg38/clinvar_20200106.vcf.gz -ds /home/mk446/bio/mutanno/SRC/datastructure/clinvar.hg38.json -out /home/mk446/bio/mutanno/DATASOURCE/VARIANTDB/CLINVAR/hg38/clinvar.20200106.hg38


#################################
# make data for microannotation
#################################
mutanno makedata -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_microannot_v0.2.json \
    -out /home/mk446/bio/mutanno/DATASOURCE/MICROANNOT/microanot_datasource_v0.2_test \
    -vartype SNP \
    -region 1:1-4000000
    # -region 1:1-100000
    # -region 1:939300-2041000


#################################
# make data for annotation
#################################
# mutanno makedata -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_v0.3.0_mvp.json \
#     -out /home/mk446/bio/mutanno/DATASOURCE/MUTANOANNOT/mvp_datasource_v0.3_test \
#     -vartype SNP \
#     -blocksize 10000 \
# 	-region 1:66041-66141 ### COSMIC
    # -region 1:1-100000
    # -region 1:930248-930348	### clinvar
    # -region 1:28590-28690	### UK10k
    # -region 1:69091-69191		### spliceAI
    # -region 1:10701-20000   ### CONSERVATION
    # -region 1:10051-10151  ### TOPMED
    # -region 1:10037-10237  ### AF
    # -region 1:69144-70144  ### UNIPROT_TRANSMEM
    # -region 1:10039-11039   ### dbSNP
    # -region 1:200001-220000
# head -5 /home/mk446/bio/mutanno/DATASOURCE/MUTANOANNOT/mvp_datasource_v0.3_test.tsi


#################################
# make gene data
#################################
# mutanno makedata -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_v0.3.0_mvp.json \
#     -out /home/mk446/bio/mutanno/DATASOURCE/MUTANOANNOT/mvp_gene_datasource_v0.3 \
#     -vartype GENE

# head /home/mk446/bio/mutanno/DATASOURCE/MUTANOANNOT/mvp_gene_datasource_v0.3.bed



#################################
# micro-annotation
#################################
# mutanno annot -vcf /home/mk446/bio/mutanno/DATASOURCE/TEST/trio_test2.vcf \
#     -out /home/mk446/bio/mutanno/DATASOURCE/TEST/trio_clinvar_variants_100_microannot.annot.vcf \
#     -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_microannot_v1.0.json \
#     -blocksize 100

# tail /home/mk446/bio/mutanno/DATASOURCE/TEST/trio_clinvar_variants_100.annot.vcf


## Multi-allelic test
# mutanno annot -vcf /home/mk446/bio/mutanno/DATASOURCE/TEST/trio_test_multiallele.vcf \
#     -out /home/mk446/bio/mutanno/DATASOURCE/TEST/trio_test_multiallele.annot.vcf \
#     -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_microannot_v1.0.json
# tail /home/mk446/bio/mutanno/DATASOURCE/TEST/trio_test_multiallele.annot.vcf

#################################
# Trio GATK vcf
#################################
# mutanno annot -vcf /home/mk446/bio/mutanno/DATASOURCE/TEST/test_trio_v0.3.vcf.gz \
#     -out /home/mk446/bio/mutanno/DATASOURCE/TEST/test_trio_v0.3.annot.vcf \
#     -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_v0.3.0_mvp.json \
# 	-blocksize 10
    
#################################
# deNOVO vcf
#################################
# mutanno annot -vcf /home/mk446/bio/mutanno/DATASOURCE/TEST/NOVO2_all_variants_jc50_wgenome.sorted.vcf.gz \
#     -out /home/mk446/bio/mutanno/DATASOURCE/TEST/NOVO2_all_variants_jc50_wgenome.sorted.annot.vcf \
#     -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_v0.3.0_mvp.json \
#     -blocksize 10
 

# mutanno annot -vcf /home/mk446/bio/mutanno/DATASOURCE/TEST/NOVO2_all_variants_jc50_wgenome.sorted.test.vcf \
#     -out /home/mk446/bio/mutanno/DATASOURCE/TEST/NOVO2_all_variants_jc50_wgenome.sorted.test.annot.vcf \
#     -ds /home/mk446/bio/mutanno/SRC/tests/datastructure_v0.3.0_mvp.json \
#     -blocksize 10






