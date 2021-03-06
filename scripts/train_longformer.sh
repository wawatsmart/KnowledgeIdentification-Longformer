. path

export WORLD_SIZE=1

export CUDA_VISIBLE_DEVICES=1

output_dir=${parent_dir}/exp
mkdir -p $output_dir

data_name=$1
if [ $data_name == "dialdoc" ]; then
    max_seq_len=512
    passages_per_question=8
    max_answer_length=5
    hist_loss_weight=1.0
else
    max_seq_len=384
    passages_per_question=10
    max_answer_length=1 # one sentence only
    hist_loss_weight=0.5
fi

python -m torch.distributed.run --nproc_per_node $WORLD_SIZE train_reader_longformer.py \
    --pretrained_model_cfg ${parent_dir}/pretrained_models/allenai/longformer-base-4096 \
    --seed 42 \
    --learning_rate 3e-5 \
    --eval_step 1000 \
    --do_lower_case \
    --eval_top_docs 20 \
    --warmup_steps 1000 \
    --max_seq_len ${max_seq_len} \
    --batch_size 2 \
    --passages_per_question ${passages_per_question} \
    --num_train_epochs 3 \
    --dev_batch_size 4 \
    --max_answer_length ${max_answer_length} \
    --passages_per_question_predict 20 \
    --train_file ${parent_dir}/cache/cls_longformerlongformerlongformer/train \
    --dev_file ${parent_dir}/cache/cls_longformerlongformerlongformer/dev \
    --output_dir $output_dir \
    --gradient_accumulation_steps 1 \
    --ignore_token_type \
    --decision_function 1 \
    --hist_loss_weight ${hist_loss_weight} \
    --fp16 \
    --fp16_opt_level O2 \
    --data_name ${data_name} \
    --adv_loss_type js \
    --adv_loss_weight 5 \
    --use_z_attn 

#
# #    --checkpoint_file ${parent_dir}/exp/dialki.0.8870.4435 \

# python -m torch.distributed.launch --nproc_per_node $WORLD_SIZE train_reader_longformer.py \
#     --pretrained_model_cfg ${parent_dir}/pretrained_models/allenai/longformer-base-4096 \
#     --seed 42 \
#     --learning_rate 3e-5 \
#     --eval_step 1000 \
#     --do_lower_case \
#     --eval_top_docs 20 \
#     --warmup_steps 1000 \
#     --max_seq_len ${max_seq_len} \
#     --batch_size 2 \
#     --passages_per_question ${passages_per_question} \
#     --num_train_epochs 20 \
#     --dev_batch_size 4 \
#     --max_answer_length ${max_answer_length} \
#     --passages_per_question_predict 20 \
#     --train_file ${parent_dir}/cache/cls_longformerlongformerlongformer/train \
#     --dev_file ${parent_dir}/cache/cls_longformerlongformerlongformer/dev \
#     --output_dir $output_dir \
#     --gradient_accumulation_steps 1 \
#     --ignore_token_type \
#     --decision_function 1 \
#     --hist_loss_weight ${hist_loss_weight} \
#     --fp16 \
#     --fp16_opt_level O2 \
#     --data_name ${data_name} \
#     --adv_loss_type js \
#     --adv_loss_weight 5 \
#     --use_z_attn

# --checkpoint_file ${parent_dir}/exp/dialki.0.820.410 \

# python -m torch.distributed.launch --nproc_per_node $WORLD_SIZE train_reader_longformer.py \
#     --pretrained_model_cfg ${parent_dir}/pretrained_models/allenai/longformer-base-4096 \
#     --checkpoint_file ${parent_dir}/exp/dialki.0.9654.4827\
#     --seed 42 \
#     --learning_rate 3e-5 \
#     --eval_step 1000 \
#     --do_lower_case \
#     --eval_top_docs 20 \
#     --warmup_steps 1000 \
#     --max_seq_len ${max_seq_len} \
#     --batch_size 2 \
#     --passages_per_question ${passages_per_question} \
#     --num_train_epochs 20 \
#     --dev_batch_size 4 \
#     --max_answer_length ${max_answer_length} \
#     --passages_per_question_predict 20 \
#     --train_file ${parent_dir}/cache/cls_longformerlongformerlongformer/train \
#     --dev_file ${parent_dir}/cache/cls_longformerlongformerlongformer/dev \
#     --output_dir $output_dir \
#     --gradient_accumulation_steps 1 \
#     --ignore_token_type \
#     --decision_function 1 \
#     --hist_loss_weight ${hist_loss_weight} \
#     --fp16 \
#     --fp16_opt_level O2 \
#     --data_name ${data_name} \
#     --adv_loss_type js \
#     --adv_loss_weight 5 \
#     --use_z_attn

