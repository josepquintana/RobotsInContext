function Dm = case2 ( A, B, C, D )
% ����߶�AB��CD�ڹ���CASE�µ���̾���
%%%%%%%%%%%%%%%%%%%%% (�����������)
% A, B, C, D �ֱ�Ϊ�����߶ε��ĸ��������� ��1*3 ά����λ��mm��
%%%%%%%%%%%%%%%%%%%%% (�����������)
% Dm Ϊ�����߶ε���̾��� �� ��������λ��mm ��

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���AB��CD��λ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AB = B - A;
CD = D - C;

ab = norm(AB);
cd = norm(CD);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if abs( abs( dot( AB / ab , CD / cd ) ) - 1 ) < 1.0e-10           % �߶�AB��CDƽ��
    a = minp2l( A, C, D );
    b = minp2l( B, C, D );
    c = minp2l( C, A, B );
    d = minp2l( D, A, B );
    Dm = min( [a,b,c,d] );
else                                                           % �߶�AB��CD��ƽ��
    R_v1 = AB' / ab ;                              
    R_v3 = cross( AB',CD' ) / norm( cross( AB',CD' ) );
    R_v2 = cross( R_v3,R_v1 );
    R = [R_v1,R_v2,R_v3];                         % ������ϵ����ڻ�����ϵ����ת����
    AA = R'*(A'-A');                              % ��������任
    BB = R'*(B'-A');
    CC = R'*(C'-A');
    DD = R'*(D'-A');
    alpha = ( DD - CC ) / cd;                     % �ж�AB��CD�Ƿ��ཻ��׼������ 
    j = -CC(2)/alpha(2);
    i = CC(1) - ( alpha(1) / alpha(2) ) * CC(2);
    if (i >= 0) && (i <= ab) && (j >= 0) && (j <= cd)     % �߶�AB��CD�ཻ
        Dm = 0;
    else                                          % �߶�AB��CD���ཻ
        a = minp2l( A, C, D );
        b = minp2l( B, C, D );
        c = minp2l( C, A, B );
        d = minp2l( D, A, B );
        Dm = min( [a,b,c,d] );
    end
end
end

    


    
