# Kraken2 Setup (with Custom Databases)

## Package installation
The basic setup for kraken2 is straightforward. Regularly updated refseq databases can be downloaded from [here](https://benlangmead.github.io/aws-indexes/k2).

```bash
conda create -n kraken2
conda activate kraken2
conda install kraken2
```

## Custom Databases
It may be more efficient for some studies to use custom databases. This is especially true for studies of non-human multicellular eukaryotes, which are otherwise only present in the largest `core_nt` database.

First, make a directory for the custom database and download taxonomy files
```bash
mkdir custom_db
kraken2-build --download-taxonomy --db custom_db
```

Add any organism groups required to the custom database. Options are `archaea`, `bacteria`, `plasmid`, `viral`, `human`, `fungi`, `plant`, `protozoa`, `nr`, `nt`, `UniVec`, `UniVec_Core`.

```bash
kraken2-build --download-library archaea --db custom_db
kraken2-build --download-library bacteria --db custom_db
kraken2-build --download-library plasmid --db custom_db
kraken2-build --download-library viral --db custom_db
kraken2-build --download-library human --db custom_db

```

To add additional genomes to the database, kraken2-build expects fasta files with header format `>sequence_id|kraken:taxid|TAXID` where TAXID is replaced with the NCBI Taxonomy ID of the genome.

One way to do this simply with .fna.gz files from NCBI FTP would be to add "_TAXID" as a suffix to the file name. For example, the D. melanogaster genome `GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna.gz` could be renamed `GCF_000001215.4_Release_6_plus_ISO1_MT_genomic_7227.fna.gz`

This information could then be transferred to the fasta headers for each .fna.gz file in the current directory using this script:

```bash
nano format_headers.sh
```

Paste the following script and save:

```bash
#!/bin/bash

for file in *.fna.gz; do
    base=$(basename "$file" .fna.gz)
    taxid="${base##*_}"

    echo "Processing $file (taxid: $taxid)"

    zcat "$file" | \
    awk -v taxid="$taxid" '/^>/ {sub(/^>/,">"); print ">"$1"|kraken:taxid|"taxid} !/^>/ {print}' \
    > "$base.fna"
done
```

Then run:

```bash
chmod +x format_headers.sh
bash format_headers.sh
```

To add all .fna files in the current directory to the custom database, run the following:

```bash
for file in *.fna; do
    kraken2-build --add-to-library "$file" --db custom_db
done
```

Once all of the desired libraries and additional genomes have been added, the custom database can be built:

```bash
kraken2-build --build --db custom_db --threads 8

```
