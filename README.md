# DIALKI


Repository ini dibuat dalam rangka project mandiri kuliah Perolehan Informasi Lanjut. Paper acuan yang dijadikan baseline dalam projek mandiri adalah [DIALKI: Knowledge Identification in Conversational Systems through Dialogue-Document Contextualization](https://arxiv.org/abs/2109.04673)



## Notebook training
Untuk menjalankan project mandiri ini, bisa mengikuti langkah yang ada pada notebook DIALKI.ipynb.
Tahapan yang ada disana antara lain:
1. Eksperimen dilakukan pada dataset Doc2Dial dimana data dibagi menjadi data training dan data evaluation. Download dataset ada dalam url pada poin 'Dataset, Hasil preprocessing, Hasil generate cls Longformer, dan hasil traning sistem usulan dan baseline' pada folder 'dialdoc/raw_data'
2. Kemudian setup environment dengan melakukan run `!conda env create -f environment.yml`, setting ipkernel dialki lalu `!activate dialki`
3. Setelah dilakukan pembagian data, tahapan selanjutnya adalah data preprocessing. Kemudian dilanjutkan dengan multi passage encoding. Pada tahap ini dilakukan encoding terhadap sequence gabungan dengan menggunakan pretrained language model (Longformer). Run '!bash setup.sh' kemudian run '!bash run_longformer.sh dialdoc'.
5. Langkah selanjutnya adalah melakukan knowledge contextualization, yang memanfaatkan kumpulan global, utterance dan  span representations dari z; ui; sj untuk lebih mengkontekstualisasikan span reprensentation.
6. Langkah berikutnya adalah training. Pada tahap training dilakukan next turn knowledge identification dan history knowledge identification. Kemudian dilakukan evaluasi pada dengan menggunakan matriks evaluasi Exact Match dan F1 score. Run !bash scripts/train_longformer.sh dialdoc. 
8. Untuk inference dilakukan dengan run `bash run_eval.sh [dataname] [checkpoint_path] [inference_output_path]` untuk melakukan run inference. `dataname` = `dialdoc`. Inference dijalankan pada dev set.

## Dataset, Hasil preprocessing, Hasil generate cls Longformer, dan hasil traning sistem usulan dan baseline
Dataset, Hasil preprocessing, Hasil generate cls Longformer, hasil traning sistem usulan, dan hasil training baseline dapat di download pada link berikut [url](https://drive.google.com/drive/folders/1iuEtWgb16r3JNaB8NKRQ8VUQjW3pHvvi?usp=sharing). Dataset ada pada folder 'dialdoc/raw_data'. Hasil generate cls Longformer ada pada folder 'dialdoc/cache/cls_longformerlongformerlongformer'. Sedangkan generate cls Bert(baseline) ada pada folder 'dialdoc/cache/cls_bert'. Hasil training sistem usulan ada pada folder 'dialdoc/exp-finallongformer' sedangkan hasil training baseline ada pada folder 'dialdoc/exp-bert'

## Cite
```
@inproceedings{wu-etal-2021-dialki,
    title = "{DIALKI}: Knowledge Identification in Conversational Systems through Dialogue-Document Contextualization",
    author = "Wu, Zeqiu  and
      Lu, Bo-Ru  and
      Hajishirzi, Hannaneh  and
      Ostendorf, Mari",
    booktitle = "Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing",
    month = nov,
    year = "2021",
    address = "Online and Punta Cana, Dominican Republic",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2021.emnlp-main.140",
    pages = "1852--1863",
    abstract = "Identifying relevant knowledge to be used in conversational systems that are grounded in long documents is critical to effective response generation. We introduce a knowledge identification model that leverages the document structure to provide dialogue-contextualized passage encodings and better locate knowledge relevant to the conversation. An auxiliary loss captures the history of dialogue-document connections. We demonstrate the effectiveness of our model on two document-grounded conversational datasets and provide analyses showing generalization to unseen documents and long dialogue contexts.",
}
```
