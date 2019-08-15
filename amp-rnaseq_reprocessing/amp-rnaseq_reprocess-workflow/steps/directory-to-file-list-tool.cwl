#!/usr/bin/env cwl-runner

# from https://github.com/common-workflow-language/common-workflow-language/issues/700

cwlVersion: v1.0
class: ExpressionTool
requirements: { InlineJavascriptRequirement: {} }
inputs:
  - id: dir
    type: Directory
expression: '${return {"files": inputs.dir.listing};}'
outputs:
  - id: files
    type: File[]

