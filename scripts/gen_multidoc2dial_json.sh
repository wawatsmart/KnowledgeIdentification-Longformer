. path

python ./prepro/create_multidoc2dial_json.py \
    --dtype train \
    --filepath "${parent_dir}/raw_data/multidoc2dial_dial_{}.json" \
    --outfile "${parent_dir}/data/{}.json"

python ./prepro/create_multidoc2dial_json.py \
    --dtype validation \
    --filepath "${parent_dir}/raw_data/multidoc2dial_dial_{}.json" \
    --outfile "${parent_dir}/data/{}.json"
