# 一个边长是30cm的正方形纸 #

## 题目 ##

一个边长是30cm的正方形纸，从它的四个角上分别剪去一个小正方形（小正方形的边长相等，且是整厘米数），将剩下的部分折成一个无盖长方体纸盒。这个纸盒容积最大是多少？（纸的厚度忽略不计）

![question](https://raw.githubusercontent.com/xiaohaili/scripts/master/math-edge-30cm/q.png)

## 思路 ##

* 假设
    - 减去的每个小正方形的边长是x (cm)
* 剩余部分
    - 体积 = 长 * 宽 * 高  (*表示乘号)
    - (30-2x) * (30-2x) * x (cm3)
* 我们还知道
    - 题目要求x是整数，所以x是从1到14之间的整数
    - 思考：x可以是15吗？

## 解答 ##

* 枚举
    - x是从1到14之间的整数
    - 体积 = (30-2x) * (30-2x) * x (cm3)
    - x=5时，体积最大：2000 (cm3)

| x | 1 | 2 | 3 | 4 | ==5== | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 体积 | 784 | 1352 | 1728 | 1936 | ==2000== | 1944 | 1792 | 1568 | 1296 | 1000 | 704 | 432 | 208 | 56 |

![curve](https://raw.githubusercontent.com/xiaohaili/scripts/master/math-edge-30cm/curve%5E1_30.png)


## 曲线图工具  ##

* gnuplot 画图脚本
```
y(x)=(30-2*x)*(30-2*x)*x
plot [1:30] y(x)
```
* 网站 http://gnuplot.info/

![gnuplot](https://alogus.com/publishing/gnuplot5/gnuplot5cover.png)