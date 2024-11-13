set windows-shell := ["nu.exe", "-c"]
set shell := ["nu", "-c"]

root := justfile_directory()
artifacts := absolute_path('artifacts')

default:
    @just --choose

dev:
    mdbook serve --dest-dir '{{ artifacts }}'

format:
    cd '{{ root }}'; just --unstable --fmt
    prettier --write '{{ root }}'
    nixpkgs-fmt '{{ root }}'

lint:
    prettier --check '{{ root }}'

build:
    mdbook build --dest-dir '{{ artifacts }}'
