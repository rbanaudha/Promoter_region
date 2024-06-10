#This script find promoter region present in 5kb (2.5kb before and after TSS)
awk -F '\t' -v OFS='\t' '{
    if ($5 == "+") {
        $7 = $3 - 2500;
        $8 = $3 + 2500;
    } else {
        $7 = $4 - 2500;
        $8 = $4 + 2500;
    }
    #print
    print $1,$7,$8,$6,$2,$3,$4,$5
}' Transcript.bed > TSS_5kb.bed
