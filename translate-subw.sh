# Evaluation of subword-based model

modeldir=$1 
test=$2 
test_bpe=$3
beam=$4

####################################################################################################

evalset=$(basename $datapath)
model=$( python best_model.py $modeldir/*.pt )
echo $model
preddir=$modeldir/predict
mkdir -p $preddir
predpath=$preddir/$evalset.pred.$beam
finalout=$predpath.out
attnpath=$predpath.attn
evalout=$preddir/$evalset.eval.$beam
echo $predpath
python translate.py -model $model -corpora $test -use_bpe -bpe_file $test_bpe -output $predpath -beam_size $beam --attn_path $attnpath #-gpu 0
python pred2sigmorphon.py $test $predpath > $finalout
python evalm.py --guess $finalout --gold $datapath --task 1 > $evalout