#!/bin/bash -eu
# SPDX-License-Identifier: Apache-2.0

# Fuzz target names (must match Package.swift executable target names)
FUZZ_TARGETS=(
    "FuzzRlpDecode"
    "FuzzTransactionFromBytes"
    "FuzzPemDecode"
    "FuzzPublicKeyFromBytes"
    "FuzzEthereumDataFromBytes"
    "FuzzMnemonicFromString"
    "FuzzPrivateKeyFromBytes"
    "FuzzAccountIdFromString"
    "FuzzTransactionIdFromString"
)

# Build each fuzz target with sanitizers and testable imports enabled
for target in "${FUZZ_TARGETS[@]}"; do
    swift build \
        --product "$target" \
        -Xswiftc -sanitize=fuzzer,"$SANITIZER" \
        -Xswiftc -parse-as-library \
        -Xswiftc -enable-testing

    # Copy the built binary to the output directory
    cp ".build/debug/${target}" "${OUT}/${target}"
done

# Copy seed corpora if they exist
for target in "${FUZZ_TARGETS[@]}"; do
    if [ -d "FuzzTests/Corpora/${target}" ]; then
        zip -j "${OUT}/${target}_seed_corpus.zip" "FuzzTests/Corpora/${target}"/*
    fi
done
