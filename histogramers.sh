more honds* | grep .A@ | awk '{print $1}' > singlecollumn ; more honds* | grep .A@ | awk '{print $2}' >> singlecollumn
grep ".A" singlecollumn > singlecollumn.A
cut -d . -f1 singlecollumn.A > singlecollumn.B
cut -d : -f2 singlecollumn.B > hydrogen_bond.final


more contacs* | grep .A@ | awk '{print $1}' > singlecollumn ; more contacts* | grep .A@ | awk '{print $2}' >> singlecollumn_cont
grep ".A" singlecollumn > singlecollumn_cont.A
cut -d . -f1 singlecollumn_cont.A > singlecollumn_cont.B
cut -d : -f2 singlecollumn_cont.B > contact.final

echo "attribute: contacts
recipient: residues" > contacts_chimera.dat

awk '{
        BIN=sprintf("%d", $1*(1/BINSIZE))+0;
        DATA[BIN]++;
        if((!MIN)||(MIN>BIN)) MIN=BIN;
        if((!MAX)||(MAX<BIN)) MAX=BIN;
 }
END {
        for(BIN=MIN; BIN<=MAX; BIN++)
                printf("\t:%1.f.A\t%d\n", (BIN*BINSIZE)+1, DATA[BIN]);
}' BINSIZE=1 contact.final >> contacts_chimera.dat

rm singlecollumn*
