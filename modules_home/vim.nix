{
    programs.vim = {
        enable = true;
        defaultEditor = true;  # 保持之前设好的默认编辑器
        extraConfig = ''
            set mouse=          " 关闭鼠标指针
            syntax on           " 语法高亮
            set tabstop=4       " 设置制表符宽度为 4
            set shiftwidth=4    " 设置自动缩进宽度为 4
            set paste           " 始终开启 paste 模式（不推荐）
            " 禁用一些可能冲突的功能
            set noautoindent
            set nosmartindent
            set nocindent
            set formatoptions=
        '';
    };
}