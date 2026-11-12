# Flutter Task Calendar

A small Flutter UI project: a calendar with a day planner underneath, plus a charts screen. Pick a date and see that day's tasks and appointments as a timeline.

## Features

- Month/week calendar built on `table_calendar`
- Horizontal date strip and a day planner with task cards
- Charts screen with `fl_chart`
- Custom colours, typography (`google_fonts`) and SVG icons

## Tech stack

Flutter (Dart), `table_calendar`, `fl_chart`, `flutter_svg`, `google_fonts`

## Project structure

```
lib/
  views/     todo_calendar.dart (calendar and planner), charts_screen.dart
  widgets/   calendar_dates.dart, task_container.dart
  helper/    sample data and font styles
  theme/     app colours
```

## Getting started

```bash
flutter pub get
flutter run
```

> The `feature/calendar_table` branch is the default branch.
