#!/usr/bin/env python3

import subprocess
import re
import sys

from simple_term_menu import TerminalMenu


def __get_project_terminal_menu(projects):
    terminal_menu = TerminalMenu(
        projects,
        multi_select=True,
        show_multi_select_hint=True,
    )

    return terminal_menu


def __get_date(time_adjustments):
    date = subprocess.run(
        ['date', *time_adjustments, '+%Y-%m-%d'],
        capture_output=True,
        text=True
    ).stdout.strip()

    return date


def __get_klog_time(project, since):
    dirty_time = subprocess.run(
        [
            'klog',
            'total',
            f'--since={since}',
            f'--tag={project}',
            '~/Documents/notes/time.klg'
        ],
        capture_output=True,
        text=True
    ).stdout.strip()

    if 'Malformed entry' in dirty_time:
        print('Malformed entry in time.klg')
        sys.exit(1)

    return dirty_time


def __clean_klog_time(dirty_time):
    cleaned_time = re.sub(
        r'\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])',
        '',
        dirty_time
    )

    return cleaned_time


def __calculate_project_time_unit(search):
    unit = 0

    if search and len(search.groups()) == 1:
        unit = int(search.group(1))

    return unit


def __calculate_project_hours(hours_search):
    return __calculate_project_time_unit(hours_search)


def __calculate_project_minutes(minutes_search):
    return __calculate_project_time_unit(minutes_search)


def __calculate_project_total_hours(hours, minutes):
    if minutes and not hours:
        return minutes / 60

    if not minutes:
        return hours

    return minutes / 60 + hours


def __calculate_project_time_percentage(project, start):
    dirty_time = __get_klog_time(project, start)
    cleaned_time = __clean_klog_time(dirty_time)

    hours_search = re.search(r'(\d+)h', cleaned_time)
    minutes_search = re.search(r'(\d+)m', cleaned_time)

    hours = __calculate_project_hours(hours_search)
    minutes = __calculate_project_minutes(minutes_search)

    total_hours = __calculate_project_total_hours(hours, minutes)
    pay_hours = 80

    return int(total_hours / pay_hours * 100)


def __format_percentage(time):
    return f'{time}%'


def __display_project_times(selected_projects, start, end):
    print(f'Timesheet info for {start} - {end}')
    for key, value in selected_projects.items():
        print(f'{key}: {value}')


def __display_unclaimed_time(percentage):
    print(__format_percentage(f'Unclaimed time: {percentage}'))


def main(time_adjustments):
    available_projects = ['Select all', '3DMSS', 'ASPCT', 'COMM', 'HLIT', 'STLON', 'WEB', 'PTO']
    available_tags = ['meeting']

    terminal_menu = __get_project_terminal_menu([*available_projects, *available_tags])

    terminal_menu.show()
    start = __get_date(time_adjustments[0])
    end = __get_date(time_adjustments[1])

    selected_projects = terminal_menu.chosen_menu_entries

    if available_projects[0] in terminal_menu.chosen_menu_entries:
        selected_projects = [*available_projects[1:], *available_tags]

    total_selected_percentage = 0
    formatted_projects = {}
    for project in selected_projects:
        project_percentage = __calculate_project_time_percentage(project, start)

        if project not in available_tags:
            total_selected_percentage = total_selected_percentage + project_percentage

        formatted_projects[project] = __format_percentage(project_percentage)

    __display_project_times(formatted_projects, start, end)
    __display_unclaimed_time(100 - total_selected_percentage)


def run(argv):
    last_start = ['-v-fri', '-v-11d']
    last_end = ['-v-fri']

    this_start = ['-v+fri', '-v-11d']
    this_end = ['-v+fri']

    next_start = ['-v+sat', '-v+fri', '-v-11d']
    next_end = ['-v+sat', '-v+fri']

    options = {
        'last': (last_start, last_end),
        'this': (this_start, this_end),
        'next': (next_start, next_end)
    }

    time_adjustments = options['this']

    if len(argv) > 1:
        if argv[1] == '-h':
            print('Timesheet help')
            print('./timesheet.py [option]')
            print('options:')
            print('\tthis: pay period ends this week. (default)')
            print('\tlast: pay period ended last week.')
            print('\tnext: pay period ends next week.')
            return

        time_adjustments = options[argv[1]]

    main(time_adjustments)


if __name__ == '__main__':
    run(sys.argv)
