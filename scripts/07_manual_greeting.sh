name: Manuelle Pipeline

on:
  workflow_dispatch:
    inputs:
      student_name:
        description: "Name, welcher im Bash-Skript 07_manual_greeting.sh verwendet werden soll"
        required: false
        default: "Ibrahim"

jobs:
  info:
    runs-on: ubuntu-latest

    steps:
      - name: Repository herunterladen
        uses: actions/checkout@v4

      - name: Skripte ausführbar machen
        run: chmod +x scripts/*.sh tests/*.sh

      - name: Namensbegrüßung
        run: bash scripts/07_manual_greeting.sh
        env:
          STUDENT_NAME: ${{ github.event.inputs.student_name }}
