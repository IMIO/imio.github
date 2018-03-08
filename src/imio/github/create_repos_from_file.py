# -*- coding: utf-8 -*-
import argparse
from .helpers import login, list_imio_repo_ids, get_organization, get_team


def create_repo(client, repo_id):
    print 'creating %s' % repo_id
    team = get_team(client)
    get_organization(client).create_repository(unicode(repo_id), team_id=team.id)


def add():

    parser = argparse.ArgumentParser(description='Create a list of repo on github')
    parser.add_argument('filepath', metavar='FILEPATH', type=str, nargs=1,
                        help='file path')
    args = parser.parse_args()
    filepath = args.filepath[0]
    repos = []
    with open(filepath, 'r') as fd:
        repos = fd.readlines()
    repos_to_create = [repo.strip() for repo in repos]
    github = login()
    for repo_id in repos_to_create:
        if repo_id not in list_imio_repo_ids(github):
            create_repo(github, repo_id)
