#!/usr/bin/python


import subprocess
from string import Template
from os import path
from glob import glob


def load_xresources():
    x = subprocess.Popen(['xrdb', '-query'], stdout=subprocess.PIPE)\
                    .stdout.read().decode('utf-8')
    xresources = dict()
    for l in x.split('\n'):
        if l:
            d = l.split(':', maxsplit=1)
            xresources[d[0].lstrip('.*')] = d[1].strip()
    return xresources



class Config():
    def __init__(self, infiles, outfile, substitute=True, substitution_source=None):
        self.infiles = infiles
        self.outfile = self.__expandpath(outfile)
        self.config = ""

        if type(infiles) == str:
            self.infiles = sorted(glob(self.__expandpath(infiles)))

        for f in self.infiles:
            self.__load(self.__expandpath(f))

        if substitute and substitution_source:
            self.substitute(substitution_source)

        self.save()

    def __expandpath(self, p):
        p = path.expanduser(p)
        if not p.startswith('/'):
            p = path.join(path.dirname(path.realpath(__file__)), p)
        return p

    def __load(self, infile):
        print(f'Concatenating {infile}')
        with open(infile, 'r') as f:
            self.config += f.read()

    def substitute(self, sub_source):
        self.config = Template(self.config).safe_substitute(**sub_source)

    def save(self):
        print(f'Saving to {self.outfile}\n')
        with open(self.outfile, 'w') as f:
            f.write(self.config)


def load_config(conf_file='reconfigure.yaml'):
    import yaml
    with open(conf_file, 'r') as f:
        data = yaml.load(f)

        sub_source = None
        if '$substitution_source' in data:
            if data.get('$substitution_source') == 'xresources':
                sub_source = load_xresources()
            else:
                try:
                    with open(data.get('$substitution_source'), 'r') as ss:
                        sub_source = yaml.load(ss)
                except FileNotFoundError as e:
                    print(str(e))

        for c in [v for k, v in data.items() if not k.startswith('$')]:
            try:
                Config(c['infiles'], c['outfile'], c.get('substitute', True), sub_source)
            except FileNotFoundError as e:
                print(str(e))


if __name__ == '__main__':
    # Config([
    #     '~/.config/dunst/dunstrc.base',
    #     'templates/dunstrc.theme'], '~/.config/dunst/dunstrc')
    # Config('~/.config/i3/0*', '~/.config/i3/config', substitute=False)
    load_config()
