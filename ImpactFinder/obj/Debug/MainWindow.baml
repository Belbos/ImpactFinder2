   M S B A M L   `   `   `  ����G  CImpactFinder, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:ImpactFinderImpactFinder  5   	       ImpactFinder.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:ImpactFinder     5   	     � Title$  영향성 검색기��5   	   $	��500��6   $	��525��6&   .��5	      � .+�5
   
   �� -   5         ��Name$ button��5
      $��찾기��6!   $
��Left=�6.   $��21��6I   $��
410,26,0,0q�6U   $	��Top=�6i   $��32��6�   6�   �� 5   
   -   5         ��Name$ FolderPathTextBox��5      $
��Left=�6-   $��21��6H   $��	80,27,0,0q�6T    �� TextWrapping$
 Wrap=�6g   $	��Top=�6{   $	��323��6�   �� 5   
   -   5         ��Name$ label��5      $��경로��6   $
��Left=�6,   $��	24,24,0,0q�6G   $	��Top=�6Z   �� 5   
   -   5        $ 
label_Copy��5      $��	텍스트��6$   $
��Left=�62   $��	24,87,0,0q�6M   $	��Top=�6`   �� 5   
   -   5        $ FindNameTextBox��5      $
��Left=�6+   $��21��6F   $��	80,92,0,0q�6R   $
 Wrap=�6e   $	��Top=�6y   $	��323��6�   �� 5   
   -   5        $ FindFileButton��5      $��검색��6)   $
��Left=�66   $��21��6Q   $��
409,92,0,0q�6]   $	��Top=�6q   $��32��6�   6�   �� 5   
   -   5        $ label_Copy1��5      $��	확장자��6%   $
��Left=�63   $��	24,56,0,0q�6N   $	��Top=�6a   �� 5   
   -   5        $ 
ExtTextBox��5      $
��Left=�6&   $��21��6A   $��	80,60,0,0q�6M   $
 Wrap=�6`   $	��Top=�6t   $	��318��6�   �� 5   
   -	   5        $ button_Copy1��5      $��Export��6'   $
��Left=�68   $��21��6S   $��
445,92,0,0q�6_   $	��Top=�6s   $��46��6�   6�   &   System.Windows.Controls.DataGrid  5   
   -
   5          Name$ dataGrid��5      $
��Left=�6%   $	��302��6@   $��
24,140,0,0q�6M   $	��Top=�6a   $	��467��6y      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 경로��6H      Width5  /System.Windows.Controls.DataGridLengthConverter$	 150 6T   1  +System.Windows.Controls.DataGridBoundColumn	   Binding	 6%   �� 
 �� Path$
 FILEPATH�6T     5      $ 	파일명��6H   $	 150 6U   	 6%   �� $
 FILENAME�6U     5      $ 	텍스트��6G   $	 100 6T   	 6%   �� $
 FINDTEXT�6T   5      5      5      