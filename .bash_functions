#Change directories and view the contents at the same time

function cdl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then 
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}

# Copy file with a progress bar
cpp()
{
        set -e
        strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
        | awk '{
        count += $NF
        if (count % 10 == 0) {
                percent = count / total_size * 100
                printf "%3d%% [", percent
                for (i=0;i<=percent;i++)
                        printf "="
                        printf ">"
                        for (i=percent;i<100;i++)
                                printf " "
                                printf "]\r"
                        }
                }
        END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
        if [ -d "$2" ];then
                cp $1 $2 && cd $2
        else
                cp $1 $2
        fi
}

# Move and go to the directory
mvg ()
{
        if [ -d "$2" ];then
                mv $1 $2 && cd $2
        else
                mv $1 $2
        fi
}
# Create and go to the directory
mkdirg ()
{
        mkdir -p $1
        cd $1
}
