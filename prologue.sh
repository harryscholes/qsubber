# Time and date for logging
the_date=$(date +%Y-%m-%d)
# Set $sti to $SGE_TASK_ID if the job is part of an array
[ $SGE_TASK_ID = 'undefined' ] && sti='' || sti=_$SGE_TASK_ID
# Do work in scratch
mkdir -p $output_dir
cd $output_dir
# Setup environment
if [ -z ${virtual_env:+x} ]; then
    echo 'Using default env'
else
    source activate $virtual_env && echo 'Setting virtual env:' $virtual_env
fi
python=$(which python)
echo Python interpreter: $python
