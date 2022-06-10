set -e

data_name=$1

python download_hf_model_longformer.py --data_name=$data_name

bash scripts/gen_${data_name}_json.sh
bash scripts/gen_data_cls_longformer.sh ${data_name}
#bash scripts/train_longformer.sh ${data_name}
