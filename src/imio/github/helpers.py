# -*- coding: utf-8 -*-
from .cache import memoize
import netrc
import github3


def get_organization(client):
    return client.organization('IMIO')


def get_team(client, name='Owners'):
    for team in get_organization(client).iter_teams():
        if name == team.name:
            return team


@memoize
def list_imio_repo(client):
    for repo in get_organization(client).iter_repos():
        yield repo


def list_imio_repo_ids(client):
    for repo in list_imio_repo(client):
        yield repo.name


def login():
    info = netrc.netrc()
    login, account, password = info.authenticators("github.com")
    github = github3.login(login, password)
    return github
