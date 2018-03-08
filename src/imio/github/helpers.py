# -*- coding: utf-8 -*-
from .cache import memoize
import netrc
import github3


def get_organization(client):
    return client.organization('IMIO')


def get_team(client, name='Core'):
    for team in get_organization(client).teams():
        if name == team.name:
            return team


def list_imio_repo(client):
    for repo in get_organization(client).repositories():
        yield repo


def list_imio_repo_ids(client):
    for repo in list_imio_repo(client):
        yield repo.name


def login():
    info = netrc.netrc()
    login, account, password = info.authenticators("github.com")
    github = github3.login(login, password)
    return github
