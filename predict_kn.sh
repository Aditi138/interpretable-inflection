WORDS='aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb bc bd be bf bg bh bi bj bk bl bm bn bo bp bq br bs bt bu bv bw bx by bz da db dc dd de df dg dh di dj dk dl dm dn do dp dq dr ds dt du dv dw dx dy dz ca cb cc cd ce cf cg ch ci cj ck cl cm cn co cp cq cr cs ct cu cv cw cx cy cz'
for l in $WORDS
do
	INPUT=~/parallel-data/en-kn/leminput/train.kn.sud.$l.conllu.lem
	echo $INPUT

	./translate-ch.sh kn_models/gate-sparse-enc-static-head-models/ $INPUT 1
done
