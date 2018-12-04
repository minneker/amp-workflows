class: Workflow
cwlVersion: v1.0
doc: |
  Align RNA-seq data for each sample using STAR.
$namespaces:
  dct: 'http://purl.org/dc/terms/'
  foaf: 'http://xmlns.com/foaf/0.1/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: genomeFastaFiles
    type: 'File[]'
    'sbg:x': -256.28173828125
    'sbg:y': -146
  - id: genemodel_gtf
    type: File
    'sbg:x': -269.28173828125
    'sbg:y': -17
  - id: reads_aligned_bam
    type: File
    'sbg:x': -271.28173828125
    'sbg:y': 166
outputs: []
steps:
  - id: wf_buildrefs
    in:
      - id: genemodel_gtf
        source: genemodel_gtf
      - id: genomeFastaFiles
        source:
          - genomeFastaFiles
    out:
      - id: starIndex
    run: ./wf-buildrefs.cwl
    'sbg:x': -77
    'sbg:y': -108
  - id: wf_buildindexes
    in:
      - id: genemodel_gtf
        source: genemodel_gtf
      - id: reads_aligned_bam
        source: reads_aligned_bam
    out:
      - id: picard_riboints
      - id: picard_refflat
    run: ./wf-buildindexes.cwl
    'sbg:x': -65
    'sbg:y': 133
requirements:
  - class: SubworkflowFeatureRequirement
'dct:creator':
  '@id': 'http://orcid.org/0000-0001-9758-0176'
  'foaf:mbox': 'mailto:james.a.eddy@gmail.com'
  'foaf:name': James Eddy
