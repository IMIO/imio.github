from setuptools import setup, find_packages

version = '0.1'

long_description = (
    open('README.txt').read()
    + '\n' +
    'Contributors\n'
    '============\n'
    + '\n' +
    open('CONTRIBUTORS.txt').read()
    + '\n' +
    open('CHANGES.txt').read()
    + '\n')

setup(name='imio.github',
      version=version,
      description="IMIO helpers cli for github",
      long_description=long_description,
      classifiers=[
        "Programming Language :: Python",
        ],
      keywords='',
      author='Jean Francois Roche',
      author_email='jfroche@affinitic.be',
      url='http://svn.plone.org/svn/collective/',
      license='gpl',
      packages=find_packages('src'),
      package_dir = {'': 'src'},
      namespace_packages=['imio'],
      include_package_data=True,
      zip_safe=False,
      install_requires=[
          'setuptools',
          'github3.py'
      ],
      entry_points={
          'console_scripts': [
              'sync_services = imio.github.sync_services:sync',
              'create_repos_from_file = imio.github.create_repos_from_file:add']})
