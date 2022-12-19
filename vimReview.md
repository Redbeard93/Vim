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

# 19 `:?^$?+1,/^$/-1!ls`
把当前段落的内容替换成外部命令ls的输出：向后搜索空行后向前移动一行，向前搜索空行向后移动一行（这样就选中了这个段落，空行没选），替换成ls命令

# 20 `:'<,'> normal 0i666 ^[ 4j'
在visual mode 选中多行按： 后进入命令模式，在后面输入normal表示进入选中的多行的命令模式 再加上代表命令的0i666 表示光标移动到每行行首进入输入模式输入666 之后的^[ 是通过按下ctrl v 之后按Esc 得到的特殊字符表示Esc的命令来退出insert mode而不是在insert模式下输入Esc三个字符 4j 表示光标下移4行 


>（附：ctrl k 加上下面的两个字符可以打印更特殊的字符）
> oo • (bullet)
> Db ◆ (diamond bullet)
> '% ϴ (Greek theta)
> Pd £ (British pound symbols)
> Co © (copyright symbol)
> Rg ® (registered trademark symbol)
> Eu € (euro symbol)
> -1 ‐ (hyphen)
> -N – (en dash)
> -M — (em dash)

# 21 'g <c-a>'
在visual mode 中 选中多行数字 随后输入 g 和 ctrl a 表示每行数字在最上行加一后每下一行在上一行增加的数字再加一，输入 2g 和 ctrl x 表示最上边一行减2后每下一行数字在上一行减少的数字再减二
