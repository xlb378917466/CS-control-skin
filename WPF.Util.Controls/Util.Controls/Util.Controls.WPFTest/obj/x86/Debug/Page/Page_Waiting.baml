   M S B A M L   `   `   `  ����H  DUtil.Controls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullD2clr-namespace:Util.Controls;assembly=Util.ControlsUtil.Controls  5       Util.Controls.WPFTest(   "Util.Controls.WPFTest.Page_Waiting   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Ccore2clr-namespace:Util.Controls;assembly=Util.Controls     5      c _Microsoft.Expression.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35=ed4http://schemas.microsoft.com/expression/2010/drawing  5        N� 
Background  �#5656CA N� Title$ Page_Waiting��5
       � 	Resources 5       �� 
TargetType �� Property �� Value   WindowBackground��%�   '��       7   �� 5   
   " ��6   .�5      ��  � ��$ 80��6'   �� 5       � ��$ 3q�6'   �� 5       �@��Orientation$ 
Horizontal=�6,   �� 5       � ��8   6+   5      5      .��5      �� ��6   Z� .+�5   
   �� $��90��6   .+�5      �� -   5         ��Name$ cbActive��5   2   $��Center=�6   $��5q�6D    d� 	IsChecked$
 TrueY�6O   .��6`   
IsActive6j       Util.Controls.ProgressRing  5      $��80��6    $��80��6+   
���  ��$��5q�6H      IsActive 6T   �� *	IsChecked+	 �� ElementName$	 cbActive���� 5      -   5        $ 	cbActive2��5   2   $��Center=�6   $
 TrueY�6E   $��5q�6V   .��6a   
IsActive6k      Util.Controls.BusyBox  5      $��80��6   $��80��6&   
�������
���  ��$��5q�6W   
   IsActive
 6c   �� *	IsChecked+$	 	cbActive2��  5      $��30��6   $��30��6&   
�������
���  ��$��5q�6W   
 6c   �� *	IsChecked+$	 	cbActive2��5      �� 5   
   $	��350��6   .+�5      � -   5         �Name$
 pro6��5   �   $��5q�6    � Orientation$ Vertical=�6%   $��12��6<   $
��auto��6G     SimpleProgressBar#��[ 6{    � Value 6U   �� *	Percent+ �� Mode$ OneWay=�6�   � 5      -   5        $
 pro1��5   i     LoopProcessBar#��[ 6    6B   �� *	Percent+$ OneWay=�6z   � 5       $	��200��6   $	��200��6   .+�5!      � -   5        $
 pro2��5!   l   #��[ 6   $��0q�6z   $	��200��6�   $	��200��6�   $��20q�6�   ���#EF436F 6F   �� *	Percent+$ OneWay=�6�   �� 5"      $��30(�6   $��Center=�6t   $��Center=�6�   ��6*   �� *Value+$ OneWay=�$
	 pro2�� �� StringFormat$ {0:p1}��6�   5#      � 5%      -   5        $
 pro3��5%   B   #��[ 6   $	��100��6v   $	��100��6�   $��10q�6�   ���#EFBF0E 6P   �� *	Percent+$ OneWay=�6�      Util.Controls.FButton  5&      -   5        $��成功��5&      $��3q�6(   63     5'      -   5        $��失败��5'      $��3q�6(   63     5(      -	   5        $��重置��5(      $��3q�6(   63   5)      �� 5*   
    �� Orientation$ Vertical=�6   .+�5+      � -
   5        $
 pro4��5+   v   $��5q�6   #��[ 6K    6%   �� *	Percent+$ OneWay=�6�   � 5,      -   5        $
 pro5��5,   W   $��5q�6   $��15��6K   
����İ�
��� E��#��[ 6�    6%   �� *	Percent+$ OneWay=�6�   �� 5-      -   5         ��Name$ proValue��5-      $��Center=�6f   ��6+   �� *	Percent+$ OneWay=�$ {0:p1}��6�   5.      �� 50   
   6   �� 51   
   6   �� 52   
   6   53      54      