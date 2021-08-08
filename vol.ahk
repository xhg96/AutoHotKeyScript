
;两个模式切换
Flag:=True
RCtrl & End::
if(Flag:=!Flag ){
	hyf_tooltip("代码模式" , 1, 0, A_ScreenWidth, A_ScreenHeight)
}else{
	hyf_tooltip("普通模式" , 1, 0, A_ScreenWidth, A_ScreenHeight)
}
return

;命令模式
#if Flag
;<!L::Send {Right}
;<!J::Send {Left}
;<!I::Send {Up}
;<!K::Send {Down}	

CapsLock::Send, {ESC}  

CapsLock & i::Send, {Up}
CapsLock & j::Send, {Left}
CapsLock & k::Send, {Down}
CapsLock & l::Send, {Right}

CapsLock & w::Send, {Up}
CapsLock & a::Send, {Left}
CapsLock & s::Send, {Down}
CapsLock & d::Send, {Right}

CapsLock & q::Send, ^{Left}
CapsLock & e::Send, ^{Right}

CapsLock & c::Send, ^+{Left}

Insert::CapsLock
RAlt::End
RWin::Home
#if

hyf_tooltip(str, t := 1, ExitScript := 0, x := "", y := "")  ;提示t秒并自动消失   {{{3
{
    t *= 1000
    ToolTip, %str%, %x%, %y%
    SetTimer, hyf_removeToolTip, -%t%
    If ExitScript
    {
        Gui, Destroy
        Exit
    }
}
hyf_removeToolTip() ;清除ToolTip {{{3
{
    ToolTip
}