# python mutanno.py precal -run_vep \
#     -out /home/mk446/mutanno/PRECALVEP \
#     -fasta /n/data1/hms/dbmi/park/SOFTWARE/REFERENCE/GRCh38d1/GRCh38_full_analysis_set_plus_decoy_hla.fa \
#     -vepcache /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/nonindexed_vep_cache/homo_sapiens_merged \
#     -vep /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/ensembl-vep-release-98/vep \
#     -cache_version 98

mutanno precal -run_vep \
    -out /home/mk446/mutanno/PRECALVEP \
    -fasta /n/data1/hms/dbmi/park/SOFTWARE/REFERENCE/GRCh38d1/GRCh38_full_analysis_set_plus_decoy_hla.fa \
    -vepcache /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/nonindexed_vep_cache/homo_sapiens_vep \
    -vep /home/mk446/bio/mutanno/ANNOT3TOOLS/BIN/ensembl-vep-release-99/vep \
    -cache_version 99