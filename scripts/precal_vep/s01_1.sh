Total chunk files:30895
mutanno precal -make_input_vcf  -out /home/mk446/mutanno/PRECALVEP/chr1/0/chr1_1_100000.vcf -fasta /n/data1/hms/dbmi/park/SOFTWARE/REFERENCE/GRCh38d1/GRCh38_full_analysis_set_plus_decoy_hla.fa -region chr1:1-100000;sleep 60;/home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/ensembl-vep-release-99/vep -i /home/mk446/mutanno/PRECALVEP/chr1/0/chr1_1_100000.vcf -o /home/mk446/mutanno/PRECALVEP/chr1/0/chr1_1_100000.vcf.vep.txt --hgvs --fasta /n/data1/hms/dbmi/park/SOFTWARE/REFERENCE/GRCh38d1/GRCh38_full_analysis_set_plus_decoy_hla.fa --assembly GRCh38 --use_given_ref --offline --cache_version 99 --dir_cache /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/nonindexed_vep_cache/homo_sapiens_vep --everything --force_overwrite --vcf --plugin MaxEntScan,/home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/VEP_plugins-release-99/fordownload --plugin TSSDistance --dir_plugins /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/VEP_plugins-release-99 --plugin SpliceRegion,Extended;touch /home/mk446/mutanno/PRECALVEP/chr1/0/chr1_1_100000.vcf.vep.txt.done;
