#!/usr/bin/env python
from setuptools import setup, find_packages

install_requires = [
    'pyfaidx>=0.5.3.1',
    'pysam>=0.11.2.2y7',
    'pysamstats>=1.0.1'
]

tests_require = [
    'nose',
    'mock'
]

extras_require = {
    'docs': [
        'Sphinx>=1.1'
    ]
}


setup(name='mutanno',
      version='0.3.14',
      url='https://github.com/dbmi-bgm/mutanno',
      license='MIT',
      author='CGAP team at Harvard Medical School',
      author_email='daniel.minseok.kwon@gmail.com',
      description='Mutation Annotation Tool',
      download_url='https://github.com/dbmi-bgm/mutanno/archive/0.3.14.tar.gz',
      keywords=['genomics', 'bioinformatics'],
      classifiers=[
          'Operating System :: OS Independent',
          'Topic :: Software Development :: Libraries',
          'License :: OSI Approved :: MIT License',
          'Programming Language :: Python :: 3.4',
          'Programming Language :: Python :: 3.5',
          'Programming Language :: Python :: 3.6',
      ],
      # packages=find_packages(exclude=['tests']),
      python_requires=">=3.4",
      packages=find_packages('src'),
      package_dir={'': 'src'},
      long_description=open('README.md').read(),
      long_description_content_type='text/markdown',
      zip_safe=False,
      install_requires=install_requires,
      setup_requires=['nose>=1.0'],
      test_suite='nose.collector',
      entry_points={
          'console_scripts': [
              'mutanno=mutanno:cli',
          ]
      })
