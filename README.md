# DIALKI


Repository ini dibuat dalam rangka project mandiri kuliah Perolehan Informasi Lanjut. Paper acuan yang dijadikan baseline dalam projek mandiri adalah [DIALKI: Knowledge Identification in Conversational Systems through Dialogue-Document Contextualization](https://arxiv.org/abs/2109.04673)



## Notebook training
Untuk menjalankan project mandiri ini, bisa mengikuti langkah yang ada pada notebook DIALKI.ipynb.
Tahapan yang ada disana antara lain:
1. Eksperimen dilakukan pada dataset Doc2Dial dimana data dibagi menjadi data training dan data evaluation.
2. Setelah dilakukan pembagian data, tahapan selanjutnya adalah data preprocessing. 
3. Kemudian dilanjutkan dengan multi passage encoding. Pada tahap ini dilakukan encoding terhadap sequence gabungan dengan menggunakan pretrained language model (Longformer). 
4. Langkah selanjutnya adalah melakukan knowledge contextualization, yang memanfaatkan kumpulan global, utterance dan  span representations dari z; ui; sj untuk lebih mengkontekstualisasikan span reprensentation.
5. Langkah berikutnya adalah training. Pada tahap training dilakukan next turn knowledge identification dan history knowledge identification. Kemudian dilakukan evaluasi pada dengan menggunakan matriks evaluasi Exact Match dan F1 score.

## Dataset, Hasil preprocessing, Hasil generate cls Longformer, dan hasil traning
Dataset, Hasil preprocessing, Hasil generate cls Longformer, dan hasil traning dapat di download pada link berikut [url](https://drive.google.com/drive/folders/1iuEtWgb16r3JNaB8NKRQ8VUQjW3pHvvi?usp=sharing).

## Setup
The code has been tested on CUDA 11.0+.
1. Run `conda env create -f environment.yml` and `conda activate dialki`
2. To train on doc2dial dataset, first create a folder `./dialdoc` and put original data files from [here](https://github.com/doc2dial/sharedtask-dialdoc2021/tree/master/data/doc2dial/v1.0.1) into a subfolder `./dialdoc/raw_data`.
3. If you want to train on wow instead, skip step 2. Create a folder `./wow` and change the path variable in `./path` file to `./wow`.
4. Run `bash setup.sh`.

## Data Preparation and Training
The default parameters were used to run on 2 NVIDIA Quadro Q6000 GPUs. Each training process took about 18 hours for 20 epochs (default). 
1. Simply run `bash run.sh dialdoc` or `bash run.sh wow` depending on which dataset you want to run.

## Inference and Evaluation
After you finish training, run `bash run_eval.sh [dataname] [checkpoint_path] [inference_output_path]` to run inference. `dataname` can be either `dialdoc` or `wow`. The checkpoint_path can be either the best model from your training or [our provided model](https://drive.google.com/drive/folders/1iuEtWgb16r3JNaB8NKRQ8VUQjW3pHvvi?usp=sharing) for each dataset. `inference_output_path` is where you want the inference results to be saved. The console will print out the evaluation results during inference. 

Currently, the inference will run for dev set by default. If you want to change to test sets (note that you need to contact dialdoc authors to get their test set), go to `script/eval.sh` and change the `--dev_file` path.


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
