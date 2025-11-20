#!/bin/bash

mkdir -p llvm-project && pushd llvm-project

git init

git remote add origin git@github.com:llvm/llvm-project.git
# git remote add origin /repo/llvm-project

######

git sparse-checkout set --no-cone \
  /cmake /llvm /mlir /lld /clang \
  '!/llvm/test' '!/llvm/unittests' '!/llvm/docs' \
  '!/mlir/test' '!/mlir/unittests' '!/mlir/docs' \
  '!/clang/test' '!/clang/unittests' '!/clang/docs' \
  /.vscode '/*.*'

git sparse-checkout add \
  '!/llvm/utils/gn' \
  '!/llvm/lib/Target' '/llvm/lib/Target/*.*' \
  '/llvm/lib/Target/RISCV' '/llvm/lib/Target/ARM' '/llvm/lib/Target/AArch64' \
  '/llvm/lib/Target/AMDGPU' 'llvm/lib/Target/NVPTX' 'llvm/lib/Target/X86' \
  'llvm/lib/Target/SPIRV'

git sparse-checkout list

######

# LLVM_SHA="6c2e170d043d3a7d7b32635e887cfd255ef5c2ce"
LLVM_SHA="b79a665f7170fbb631b13175ec747ccfd779bf9e"

git fetch --depth 1 origin $LLVM_SHA
# git checkout -b sync $LLVM_SHA
git checkout $LLVM_SHA

popd

###############################################################################
