VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ArrayList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'//----------------------------------------------------------------------------
'// ArrayList�N���X
'//----------------------------------------------------------------------------
Option Explicit
 
Private mvArray() As Variant
 
'//----------------------------------------------------------------------------
'// �֐���  �FClass_Initialize
'// ����    �F�Ȃ�
'// �߂�l  �F�Ȃ�
'// �@�\    �F�R���X�g���N�^
'// ���l    �F
'//----------------------------------------------------------------------------
Private Sub Class_Initialize()
    ReDim mvArray(0)
End Sub
 
'//----------------------------------------------------------------------------
'// �֐���  �FAdd
'// �@�\    �F�l���N���X�ɒǉ�����
'// ����    �F(I) asVal
'// �߂�l  �F�Ȃ�
'// ���l    �FJava��ArrayList.Add�ƈꏏ
'//----------------------------------------------------------------------------
Public Sub add(asVal)
    On Error Resume Next
    
    Dim vArray()
    Dim iCnt
    
    iCnt = Me.count
    
    If (IsEmpty(mvArray(iCnt)) = True) Then
        mvArray(iCnt) = asVal
    Else
        ReDim Preserve mvArray(iCnt + 1)
        mvArray(iCnt + 1) = asVal
    End If
 
End Sub
 
'//----------------------------------------------------------------------------
'// �֐���  �FRemove
'// �@�\    �F�l���N���X����폜����
'// ����    �F(I) asVal
'// �߂�l  �F�Ȃ�
'// ���l    �FJava��ArrayList.Remove�ƈꏏ
'//----------------------------------------------------------------------------
Public Sub Remove(aiIndex)
    On Error Resume Next
    
    Dim vArray()
    Dim iCnt
    Dim i                       '// ���[�v�J�E���^
    Dim iAdjust                 '// mvArray����vArray�փR�s�[���邽�߂�Index
    
    iAdjust = 0
    iCnt = Me.count
    ReDim vArray(iCnt - 1)      '// �v�f�����̂ł��̕����}�C�i�X����
    
    For i = 0 To iCnt
        If (i <> aiIndex) Then
            vArray(iAdjust) = mvArray(i)
            iAdjust = iAdjust + 1
        End If
    Next
    
    Me.Clear
    ReDim mvArray(iAdjust)
    mvArray = vArray
 
End Sub
 
'//----------------------------------------------------------------------------
'// �֐���  �FGetVal
'// �@�\    �F�w��v�f�ʒu�̒l���擾����
'// ����    �F(I) aiIndex
'// �߂�l  �F�w��v�f�ʒu�̒l
'// ���l    �FJava��ArrayList.Get�ƈꏏ
'//----------------------------------------------------------------------------
Public Function GetVal(aiIndex)
    Dim vRet As Variant
    
    If (aiIndex > Me.count) Then
        vRet = Null
    Else
        vRet = mvArray(aiIndex)
    End If
    
    GetVal = vRet
End Function
 
'//----------------------------------------------------------------------------
'// �֐���  �FGetIndex
'// �@�\    �F�w��v�f�̃��X�g���ōŏ��Ɍ��o���ꂽ�ʒu�̃C���f�b�N�X���擾����
'// ����    �F(I) asVal
'// �߂�l  �F�w��v�f�̃C���f�b�N�X�B�v�f���Ȃ��ꍇ��-1��Ԃ��B
'// ���l    �FJava��ArrayList.indexOf�ƈꏏ
'//----------------------------------------------------------------------------
Public Function GetIndex(asVal)
    On Error Resume Next
    
    Dim iCnt
    Dim i                       '// ���[�v�J�E���^
    Dim bExistFlg As Boolean    '// �v�f���݃t���O�iTrue�F�v�f����AFalse�F�Ȃ��j
    Dim iIndex
    
    bExistFlg = False
    iCnt = Me.count
    
    For i = 0 To iCnt
        If (mvArray(i) = asVal) Then
            bExistFlg = True
            Exit For
        End If
    Next
    
    If (bExistFlg = True) Then
        iIndex = i
    Else
        iIndex = -1
    End If
    
    GetIndex = iIndex
End Function
 
'//----------------------------------------------------------------------------
'// �֐���  �FClear
'// �@�\    �F�z��v�f���N���A����
'// ����    �F�Ȃ�
'// �߂�l  �F�Ȃ�
'// ���l    �FJava��ArrayList.Clear�ƈꏏ
'//----------------------------------------------------------------------------
Public Function Clear()
    Call Class_Initialize
End Function
 
'//----------------------------------------------------------------------------
'// �֐���  �FCount
'// �@�\    �F�z��v�f���𒲂ׂ�
'// ����    �F�Ȃ�
'// �߂�l  �FLong �F�}�b�s���O��
'// ���l    �FJava��ArrayList.Count�ƈꏏ
'//----------------------------------------------------------------------------
Public Function count() As Long
    count = UBound(mvArray)
End Function
 
'//----------------------------------------------------------------------------
'// �֐���  �FContains
'// �@�\    �F�����l�����X�g�Ɋ܂܂�邩���m�F����
'// ����    �F(I) asVal
'// �߂�l  �FBoolean �FTrue�F���������X�g�Ɋ܂܂��AFalse�F�܂܂�Ȃ�
'// ���l    �FJava��ArrayList.contains�ƈꏏ
'//----------------------------------------------------------------------------
Public Function Contains(asVal) As Boolean
    Dim iCnt As Long
    Dim iListCnt As Long
    Dim bRet As Boolean
    
    bRet = False
    iListCnt = Me.count
    
    Do While (iCnt <= iListCnt)
        If (asVal = mvArray(iCnt)) Then
            bRet = True
        Exit Do
    End If
    
    iCnt = iCnt + 1
    Loop
    
    Contains = bRet
End Function
 
'//----------------------------------------------------------------------------
'// �֐���  �FContainsU
'// �@�\    �F�����l�����X�g�Ɋ܂܂�邩���m�F����B�啶���œ��ꂵ�Ĕ�r�B
'// ����    �F(I) asVal
'// �߂�l  �FBoolean �FTrue�F���������X�g�Ɋ܂܂��AFalse�F�܂܂�Ȃ�
'// ���l    �FJava��ArrayList.contains�ƈꏏ
'//----------------------------------------------------------------------------
Public Function ContainsU(asVal) As Boolean
    Dim iCnt As Long
    Dim iListCnt As Long
    Dim bRet As Boolean
    
    bRet = False
    iListCnt = Me.count
    
    Do While (iCnt <= iListCnt)
    If (UCase(asVal) = UCase(mvArray(iCnt))) Then
        bRet = True
        Exit Do
    End If
    
    iCnt = iCnt + 1
    Loop
    
    ContainsU = bRet
End Function
 
'//----------------------------------------------------------------------------
'// �֐���  �FContainsInstr
'// �@�\    �F����������l�����X�g������̈ꕔ�Ɋ܂܂�邩���m�F����B�啶���œ��ꂵ�Ĕ�r�B
'// ����    �F(I) asVal
'// �߂�l  �FBoolean �FTrue�F���������X�g�Ɋ܂܂��AFalse�F�܂܂�Ȃ�
'// ���l    �FJava��ArrayList.contains�ƈꏏ
'//----------------------------------------------------------------------------
Public Function ContainsInStr(asVal) As Boolean
    Dim iCnt As Long
    Dim iListCnt As Long
    Dim bRet As Boolean
    
    bRet = False
    iListCnt = Me.count
    
    Do While (iCnt <= iListCnt)
        If (InStr(1, UCase(asVal), UCase(mvArray(iCnt))) > 0) Then
            bRet = True
            Exit Do
        End If
    
        iCnt = iCnt + 1
    Loop
    
    ContainsInStr = bRet
End Function