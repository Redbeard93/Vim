<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="github-markdown.css">
<style>
	.markdown-body {
		box-sizing: border-box;
		min-width: 200px;
		max-width: 980px;
		margin: 0 auto;
		padding: 45px;
	}

	@media (max-width: 767px) {
		.markdown-body {
			padding: 15px;
		}
	}
</style>
<article class="markdown-body">
	<h1>Vim shortcut Reminder</h1>
	<p>enks</p>
</article>

Date: 2022-02-22 07:55:37

Last modified: 2022-02-22 09:50:04

# 1 `&`

`:s/.*/<p>\r&\r<\/p>/` 中的'&'代表之前的pattern中高亮的内容

# 2 `.`

`.`与`..` 都可以作为string concatenator 如`:call setline(i,i .' '. getline(i))`

# 3 `^]`

`<c-]>` 可以在帮助文档里进入超链接

# 4 `^wo`

`<c-w>o` 可以关掉出当前之外的所有窗口等于`:only`

# 5 `:noh`

取消正则命令后的高亮搜索

# 6 `q:`

进入命令历史

# 7 `mo`

通过先搜索再 move 行的方式可以颠倒行如`:3,5g/^.*/m 2`颠倒3到5行

# 8 `:$norm gUU`

将最后一行单词转换为大写

# 9 `\( \)成一组 与 /1第一组 /2第二组 /3第三组`

分组和反向引用可以颠倒同一行的任何东西

# 10 `:/Cons/+1m-2`

将包含Cons的下一行向上移两行

# 11 `:/<table>/,/<\/table>/g/^$/d`

将 <table> 与 </table> 之间的空行删除(演示range()用法)

# 12 `:/^$/;/^$/-1m1`

将接下来两个空行之间的文本移到第一行之后

# 13 `:2,$-1>`

缩进第 2 行到倒数第 1 行之间的文本

# 14 `:2,/^EOT/-1!sort -k2n -k1M`

根据年份和月份排序数据

# 15 `\%什么东西`

match什么东西

# 16 `:[range]r[ead] [++opt] !{cmd}`

在下range 上执行cmd并且把光标下的内容插入

# 17 `:1,/^EOT/!bash`

执行内嵌脚本并以结果替换

# 18 `K`

直接查看光标下的帮助文档

# 19 ``
