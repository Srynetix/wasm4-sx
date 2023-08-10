_default:
	@just --list

# Build the project in debug mode
build-debug:
	cargo build --manifest-path "./wasm4-sx/Cargo.toml" --target wasm32-unknown-unknown

# Build the project in release mode
build-release:
	cargo build --manifest-path "./wasm4-sx/Cargo.toml" --release --target wasm32-unknown-unknown

# Format the code
fmt *ARGS:
	cargo fmt --manifest-path "./wasm4-stubs/Cargo.toml" {{ARGS}}
	cargo fmt --manifest-path "./wasm4-sx/Cargo.toml" {{ARGS}}
	cargo fmt --manifest-path "./wasm4-sys/Cargo.toml" {{ARGS}}

# Run clippy on the code
lint *ARGS:
	cargo clippy --manifest-path "./wasm4-stubs/Cargo.toml" --target wasm32-unknown-unknown {{ARGS}}
	cargo clippy --manifest-path "./wasm4-stubs/Cargo.toml" --tests {{ARGS}}
	cargo clippy --manifest-path "./wasm4-sx/Cargo.toml" --target wasm32-unknown-unknown {{ARGS}}
	cargo clippy --manifest-path "./wasm4-sx/Cargo.toml" --tests {{ARGS}}
	cargo clippy --manifest-path "./wasm4-sys/Cargo.toml" --target wasm32-unknown-unknown {{ARGS}}
	cargo clippy --manifest-path "./wasm4-sys/Cargo.toml" --tests {{ARGS}}

# Run tests
test:
	cargo test --manifest-path "./wasm4-stubs/Cargo.toml"
	cargo test --manifest-path "./wasm4-sx/Cargo.toml"
	cargo test --manifest-path "./wasm4-sys/Cargo.toml"

# Run CI steps
ci:
	@just fmt "--check"
	@just lint "-- -D warnings"
	@just test
	@just build-release

# Build documentation
doc:
	cargo doc --manifest-path "./wasm4-sx/Cargo.toml"

# Clean target folders
clean:
	cargo clean --manifest-path "./wasm4-stubs/Cargo.toml"
	cargo clean --manifest-path "./wasm4-sx/Cargo.toml"
	cargo clean --manifest-path "./wasm4-sys/Cargo.toml"
