function Dm = Dmin ( A, B, C, D )
% ����߶�AB��CD֮�����̾���
%%%%%%%%%%%%%%%%%%%%% (�����������)
% A, B, C, D �ֱ�Ϊ�����߶ε��ĸ��������� ��1*3 ά����λ��mm��
%%%%%%%%%%%%%%%%%%%%% (�����������)
% Dm Ϊ�����߶ε���̾��� �� ��������λ��mm ��

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���AC��BC��AD��BD��λ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AC = C - A; 
BC = C - B;
AD = D - A;
BD = D - B;

AC = AC / norm(AC);
BC = BC / norm(BC);
AD = AD / norm(AD);
BD = BD / norm(BD);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if norm(AC - BC) <  1.0e-10 & norm(AD - BD) <  1.0e-10               % �߶�AB��CD����
    Dm = case1( A, B, C, D );           
elseif norm(AC - BC) < 1.0e-10 | norm(AD - BD) <  1.0e-10            % �����ĸ������������㹲�߶������߶�AB��CD����
        Dm = case2( A, B, C, D );
else 
    if abs( abs( dot( cross( AC, BC ) / norm( cross( AC, BC ) ), cross( AD, BD ) / norm( cross( AD, BD ) ) ) ) - 1 ) < 1.0e-10
                                      % �߶�AB��CD����
        Dm = case2( A, B, C, D );
    else                              % �߶�AB��CD����
        Dm = case3( A, B, C, D );
    end
end
end
    
