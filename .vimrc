"Vimrc注释的语法是"不是#，#会报错
set exrc
set hidden
set expandtab
set smartindent
set nowrap
set incsearch
set scrolloff=8
set clipboard+=unnamedplus
set cuc cul
set encoding=utf-8
set shiftwidth=4
set softtabstop=4
set tabstop=4
syntax on
set t_Co=256
filetype indent on
set autoindent
set relativenumber
highlight CursorLine term=bold cterm=bold ctermbg=DarkGray
highlight CursorColumn ctermbg=DarkGray
set textwidth=80
set ruler
set showmatch
set history =1000
set wildmenu
set wildmode=longest:list,full
set nu
set nocompatible
"设置backspace可以正常使用
set backspace=indent,eol,start
"insert模式下设置大括号自动缩进
imap {<CR> {<CR>}<ESC>O
"insert模式下设置中括号缩进
imap [ []<ESC>i
"insert模式下设置小括号缩进
imap ( ()<ESC>i
"insert模式下输入一个[相当于输入一个完整[]再将光标左移一个字符
imap [ []<LEFT>
imap ( ()<LEFT>
call plug#begin()


call plug#end()
package com.kkb.views;

import java.util.Scanner;
import com.kkb.exception.OutNumBoundException;

public class Views {
    private Scanner input = new Scanner(System.in);

    public int menu(){
        int num=0;
        do{
            System.out.println("请输入年：");
            String strNum=input.nextLine();
            int num=Integer.valueOf(strNum);
            try {
                num=validateNum(strNum, 1, 12);
                break;
            }catch (NumberFormateException e){
                System.out.println(e.getMessage());
            }catch (OutNumBoundException e){
                System.out.println(e.getMessage());
            }
            System.out.println("请输入月：");
            String strNum=input.nextLine();
            int num=Integer.valueOf(strNum);
            try {
                num=validateNum(strNum, 1, 12);
                break;
            }catch (NumberFormateException e){
                System.out.println(e.getMessage());
            }catch (OutNumBoundException e){
                System.out.println(e.getMessage());
            }
            System.out.println("输入0退出");
            String strNum=input.nextLine();
            int num=Integer.valueOf(strNum);
            try {
                num=validateNum(strNum);
                break;
            }catch (NumberFormateException e){
                System.out.println(e.getMessage());
            }
        }while(true);
        return num;
    }


    private int validateNum(String strNum, int begin, int end) throws NumberFormateException,OutNumBoundException{
        try {
            int num=Integer.valueOf(StrNum);
            if(num<begin || num>end){
                throw new OutNumBoundException("数字在"+begin+"和"+end+"之间！");
            }
            return num;
        }catch (NumberFormateException exception){
            throw new NumberFormateException("输入的必须是数字！");
        }
    }

}
