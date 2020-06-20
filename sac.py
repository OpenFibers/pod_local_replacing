#!/usr/bin/env python3
# _*_ coding:utf-8 _*_
# search [in] all [git] commits
import sys
import subprocess


def check_keyword(keyword: str) -> None:
    all_commits: bytes = subprocess.check_output(["git", "rev-list", "--all"])
    all_commit_string: str = all_commits.decode('utf-8')
    all_commits_list: [str] = all_commit_string.split('\n')
    for commit_str in all_commits_list:
        if len(commit_str) != 0:
            subprocess.run(["git", "--no-pager", "grep", keyword, commit_str])
    return


if __name__ == '__main__':
    for arg in sys.argv[1:]:
        print('Working... very hard... for searching all codes for key 🙄:')
        print(arg)
        check_keyword(keyword=arg)
