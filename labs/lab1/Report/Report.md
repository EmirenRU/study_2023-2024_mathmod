---
## Front matter
title: "Oтчёт по лабораторной работе №1"
subtitle: "НКНбд-01-21"
author: "Юсупов Эмиль Артурович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: Open Sans
romanfont: Open Sans
sansfont: Open Sans
monofont: Open Sans
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Цель Работы"
lotTitle: "Ход Работы"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Введение

Во время выполнения лабораторный работы мы освоили дополнительные знания по работе с системой управлениями версиями git. Лабораторная работа была произведена на Windows Subsystem for Linux (WSL) с дистрибутивом Ubuntu. 

# Ход работы

1. Подготовка.

- Была произведена настройка Имени, электронной почты, параметров установки окончания строк и установка отображения unicode

2. Создание проекта

- Была произведена создания рабочего каталог с файлом hello.html, где была произведено добавление строки

- Создание репозитория

- Добавление файлов в репозиторий с проверкой на состояние

```bash
git init
git add hello.html
git commit -m "Initial Commit"
git status
```

3. Внесение изменений и индексация изменений

- Было добавлено изменение в файл hello.html, где мы убедились с помощью git status

- Был проверен способ добавления коммита без флага -m 

- Был получен список изменений с помощью git log и с помощью его аргументов

```bash
git log --pretty=oneline --max-count=2
git log --pretty=oneline --since='5 minutes ago'
git log --pretty=oneline --until='5 minutes ago'
git log --pretty=oneline --author=<your name>
git log --pretty=oneline --al
```

- Был произведен возврат на предыдущие коммиты с помощью хэш-кодов.

- Научились пользоваться с git tag для создания тегов, чтобы не перемещатсья по коммитам по хэш-кодам.

5. Отмена локальных изменений

- Был произведено откат изменений без git add . с помощью git checkout

6. Отмена проиндексированных изменений

- Было добавлено с помощью git add намеренное для дальнейшего сброса буферной зоны с помощью git reset

7. Отмена коммитов

- Было произведен сброс закоммиченного сотояния с помощью git revert HEAD

8. Удаление коммитов из ветки

- Было произведено создание тэга oops и дальнейший сброс с помощью git reset --hard v1, который позволил 'удалить' все коммиты в поле зрения git log до тэга v1

- Было увидено, что все удаленные коммиты все еще хранятся в git log, но требуют флаг --all

9. Удаление тэга oops

- Был удален тэг oops с помощью флага -d у git tag

10. Внесение изменений в коммиты

- Было произведена замена коммита с помощью фалага --amend у git commit 

11. Перемещение файлов

- Был рассмотрен два способа перемещения файлов
    - С помощью git и автоматическим изменения состояния
    - С помощью стандартных средств bash и дальнейшем сохранения состояния с git

12. Git внутри: Каталог .git

- Были рассмотрены каталоги .git и его подкаталоги config, refs и файлы HEAD

13. Работа непосредственно с объектами git

- Был произведен поиск последнего коммита, вывод с помощью sha1 хэша  и вывод файла hello.html из этого хэша

14. Создание ветки и слияния веток master с style

- Была создана ветка style, где мы добавили css

- Был создан readme.md в ветке master

- Было произведено слияние веток, где мы разрешили конфликт между ветками.

- В дальнейшем была сброшена ветка style

15. Перебазирование

- Научились пользоваться функцией rebase, которая переносит ветку x в ветку y с дальнейшим сливанием.

16. Клонирование репозиториев

- Был рассмотрен способ работы клонированного репозитория из удаленного (remote) оригинального источника для дальнейшего рассмотрения изменений оригинального репозитория и извлечение изменинй

- Было произведено слияние извлеченных из удаленного (remote) источника изменинй

17. Ветки наблюдений

- Были добавлены ветки наблюдений в клонированном репозитории для получение общих изменений

18. Добавление удаленного репозитория 

- Был создан каталог hello.git с помощью git clone, где хранятся файлы чистого репозитория для дальнейшей работы с клонированными репозиториями

# Результат

Во время выполнения лабораторной работы мы дополнили свои знания с работой с системой управлениями версиями git.   