---
## Front matter
lang: ru-RU
title: Колебания цепочек
subtitle: Этап 3
author:
  - Юсупов Эмиль Артурович
  - Подлесный Иван Сергеевич
  - Сироджиддинов Камолиддин Джамолиддинович
  - Абу Сувейлим Мухаммед Мунифович

institute:
  - Российский университет дружбы народов, Москва, Россия
date: 24 февраля 2024

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Юсупов Эмиль Артурович
  * НКН-01-21
  * Российский Университет Дружбы Народов

:::
::: {.column width="30%"}

:::
::::::::::::::

## Цель работы

- Написать программную реализацию модели "Колебания цепочек".

# Алгоритм реализации

## Алгоритм реализации

1. Понять из каких блоков будет состоять программа. 

2. Написать каждый блок программы.

3. Отладить (по необходимости).

4. Собрать результат.

## Блоки программы

1. Блок входных данных.

2. Блок с функциями и заполенными данными

3. Блок с выводом графиков.

## Блок входные данные

``` julia
using Plots
using DifferentialEquations

const N_i = 200
const N_l = 3
const k_l = 1
const m = 1
const k = 1
const d = 1
const omega_0 = sqrt(k/m)

const A = 0
const B = 1 # sin(p(N+1)d) = 0
```

## Блок с функциями и заполнением данных

``` julia
function Xi(i)
    return i*d
end

function omega_l(l)
    return 2*omega_0*sin( (l*pi) / ( 2 * (N_i+1) ) )
end

function p_l(l)
    return (l * pi) / ((N_i+1) * d)
end
```

##

```julia
function y_i(i, l)
    return ( A*cos(p[l] * x[i]) + B*sin(p[l]*x[i]) ) * cos(omega[l])
end

x = [Xi(x) for x in 1:N_i]
omega = [omega_l(l) for l in 1:N_l]
p = [p_l(l) for l in 1:N_l]
```

## Блок с выводом графиков от одной переменной

```julia
for l in k_l:N_l
    plt = plot(legend=true,
    dpi=256,
    size=(400,400), 
    label="Гармоническая цепочка")

    y = [y_i(i, l) for i in 1:N_i]   

    plot!(plt, x, y, label="Гармоника №"*string(l), color=:blue)
    savefig(plt, "image/main_" * string(l) * "_.png")
end
```

## Блок с выводом графиков от нескольких переменных

```julia

plt = plot(legend=true, dpi=512,
size=(800,800),  label="Гармоническая цепочка")

y = [y_i(i, 1) for i in 1:N_i]   
plot!(plt, x, y, label="Гармоника №1", color=:green)

y = [y_i(i, 2) for i in 1:N_i]   
plot!(plt, x, y, label="Гармоника №2", color=:red)
```

## 

``` julia
y = [y_i(i, 3) for i in 1:N_i]   
plot!(plt, x, y, label="Гармоника №3", color=:blue)

savefig(plt, "image/main.png")
```

# Результат работы

## Гармоники колебании цепочек

![Гармоника №1](../image/main_1_.png)

## Гармоники колебании цепочек

![Гармоника №2](../image/main_2_.png)

## Гармоники колебании цепочек

![Гармоника №3](../image/main_3_.png)

## Гармоники колебании цепочек

![График с наложенными на друг-друга гармониками](../image/main.png)



# Библиография

- Медведев Д. А., Куперштох А. Л., Прууэл Э. Р., Сатонкина Н. П., Карпов Д. И. Моделирование физических процессов и явлений на ПК: Учеб. пособие / Новосибирск: Новосиб. гос. ун-т., 2010. — 101 с.

- Блейкмор, Джон Физика твердого тела. - Москва: Мир, 1988. - 608 с.

- Горелик Г. С. Колебания и волны. Введение в акустику, радиофизику и оптику. — М.: Физматлит, 1959. — 572 с.