source /share/apps/examples/cuda/cuda-9.0.source
LD_LIBRARY_PATH="\
/share/apps/libc6_2.23/lib/x86_64-linux-gnu:\
/share/apps/libc6_2.23/lib64:\
/share/apps/gcc-6.2.0/lib64:\
/share/apps/gcc-6.2.0/lib:\
$HOME/anaconda3/lib:\
/share/apps/cuda-9.0/lib64:${LD_LIBRARY_PATH}"
