# Calculate Enzyme Activity Using TCGA Sample Networks

This is a pipeline to predict tumor enzyme activity. Firstly, user need choose your tumor type, if user don't have your own metabolic networks, user can using ours constructed TCGA networks. If user want to constructed your own networks, user can infer our pipeline **[pipeline](https://github.com/bigbinb/Calculate-Enzyme-with-your-own-networks)**.

### Requirements
    R: v4.0+
    tidyverse: v2.0.0
    viper: 1.32.0
    this.path: 1.4.0

### Usage:
    Rscript CalProteinActivity.R "YourExpressionfile" "TumorType"

  note:
 
 YourExpressionfile need **TPM** Expression file, and sample in column, genes in row.
  

TumorType is one of list type:
                 
                 "ACC",
                 "BLCA",
                 "BRCA",
                 "CESC",
                 "CHOL",
                 "COAD",
                 "DLBC",
                 "ESCA",
                 "GBM",
                 "HNSC",
                 "KICH",
                 "KIRC",
                 "KIRP",
                 "LAML",
                 "LGG",
                 "LIHC",
                 "LUAD",
                 "LUSC",
                 "MESO",
                 "OV",
                 "PAAD",
                 "PCPG",
                 "PRAD",
                 "READ",
                 "SARC",
                 "SKCM",
                 "STAD",
                 "TGCT",
                 "THCA",
                 "THYM",
                 "UCEC",
                 "UCS",
                 "UVM"
				 
Finally, the program will export a file named **"Predicted_proteinactivity.csv"**, colnames is your sample name, and rownames is enzyme name.