"""A setuptools based setup module.
See:
https://packaging.python.org/guides/distributing-packages-using-setuptools/
https://github.com/pypa/sampleproject
"""

import pathlib
from setuptools import setup, find_packages

PROJECT_ROOT = pathlib.Path(__file__).parent.resolve()


setup(
    name='skeleton',
    version='0.1.0',
    description='A simple python project template.',
    long_description=(PROJECT_ROOT / 'README.md').read_text(encoding='utf-8'),
    long_description_content_type='text/markdown',
    url='https://github.com/tcechal/skeleton',
    author='Tomas Cechal',
    author_email='tomas.cechal@gmail.com',
    classifiers=[  # https://pypi.org/classifiers/
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: 3 :: Only',
        'Topic :: Software Development',
        'Typing :: Typed',
    ],
    keywords='development, template',
    package_dir={'': 'src'},
    packages=find_packages(where='src'),
    python_requires='>=3.6, <4',
    install_requires=[],
    extras_require={},
    package_data={},
    data_files=[],
    entry_points={},
    project_urls={},
)
