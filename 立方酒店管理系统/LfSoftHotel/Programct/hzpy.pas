//{$D-,L-}
Unit hzpy;
Interface
{ }
//����Ԫ�ǰ��������˴��������Զ����ֿ��ֹ��������д�ģ�
//���������Դ���룬ϣ����������ʹ�ú����������������
//���޸ġ������˴˴��룬ϣ���ܼĸ�����һ�ݣ������ڴ�лл����
//��ӭ������ҳhttp://lkpc.126.COM
//Email:  fda@football.com.cn

Function  getpy1(S:String):String;
function GetPY2( hzchar:string):char;

Implementation


function GetPY2( hzchar:string):char;
begin
  case WORD(hzchar[1]) shl 8 + WORD(hzchar[2]) of
    $B0A1..$B0C4 : result := 'a';
    $B0C5..$B2C0 : result := 'b';
    $B2C1..$B4ED : result := 'c';
    $B4EE..$B6E9 : result := 'd';
    $B6EA..$B7A1 : result := 'e';
    $B7A2..$B8C0 : result := 'f';
    $B8C1..$B9FD : result := 'g';
    $B9FE..$BBF6 : result := 'h';
    $BBF7..$BFA5 : result := 'j';
    $BFA6..$C0AB : result := 'k';
    $C0AC..$C2E7 : result := 'l';
    $C2E8..$C4C2 : result := 'm';
    $C4C3..$C5B5 : result := 'n';
    $C5B6..$C5BD : result := 'o';
    $C5BE..$C6D9 : result := 'p';
    $C6DA..$C8BA : result := 'q';
    $C8BB..$C8F5 : result := 'r';
    $C8F6..$CBF9 : result := 's';
    $CBFA..$CDD9 : result := 't';
    $CDDA..$CEF3 : result := 'w';
    $CEF4..$D1B8 : result := 'x';
    $D1B9..$D4D0 : result := 'y';
    $D4D1..$D7F9 : result := 'z';
  else
    result := char(0);
  end;
end;

function getpy1(S:String):String;
var
cstr,hz,py,py1:string;
hstr:array[1..23] of string;
i,j,k:integer;
const zm:array[1..23] of char='abcdefghjklmnopqrstwxyz';
begin
cstr:='0123456789abcdefghijklmnopqrstuvwxyz';
cstr:=cstr+'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
cstr:=cstr+'!.#$%()*+-,/[\|^~`@{}_';

hstr[1]:='� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� � �� �� ';
hstr[1]:=hstr[1]+'�� �� �� � � �� �� �� �� �� �� �� �� �� �� ';

hstr[2]:='�� �� � � �� �� �� �� �� �� �� �� �� � � �� �� � �� ';
hstr[2]:=hstr[2]+'�� �� �� � �� �� �� �� �� �� �� �� �� �� � �� �� �� �� �� �� ';
hstr[2]:=hstr[2]+'�� �� �� � �� � ذ �� �� �� �� ݩ �� ޵ �� �� �� �� � �� � ';
hstr[2]:=hstr[2]+'�� �� � �� � �� � � �� �� �� �� �� �� �� �� �� �� �� �� �� ';
hstr[2]:=hstr[2]+'�� �� �� � �� �� �� � �� �� �� �� � �� � � � �� �� � �� ';
hstr[2]:=hstr[2]+'�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ';
hstr[2]:=hstr[2]+'� �� �� �� � �� �� � �� �� �� �� ߲ �� � �� �� �� �� ';

hstr[3]:='�� �� �� �� � �� �� �� �� � �� �� � � ɲ �� �� � �� �� � � � ';
hstr[3]:=hstr[3]+'� �� �� �� �� ٭ �� �� � �� �� �� �� �� �� � �� �� � �� �� ';
hstr[3]:=hstr[3]+'�� �� � �� �� �� �� �� �� �� �� � �� � �� �� � �� �� �� �� ';
hstr[3]:=hstr[3]+'�� �� �� �� �� �� �� �� �� �� �� � � � �� �� �� �� ة �� �� ';
hstr[3]:=hstr[3]+'�� �� �� � �� �� �� �� �� �� �� ܯ �� ߳ �� � �� �� �� � �� ';
hstr[3]:=hstr[3]+'� � �� � � �� �� �� �� �� �� �� � � �� �� ٱ �� � � �� ';
hstr[3]:=hstr[3]+'�� ء ۻ �� �� � �� �� �� �� �� �� �� �� �� �� � �� � �� �� ';
hstr[3]:=hstr[3]+'� �� �� �� �� � � �� �� �� �� �� � � �� �� �� � �� �� �� ';
hstr[3]:=hstr[3]+'�� �� �� ߥ �� �� �� �� � � �� � �� �� �� �� �� �� � �� �� ';
hstr[3]:=hstr[3]+'�� �� �� ';

hstr[4]:='�� �� � �� � �� �� �� �� �� �� ܤ ߰ ߾ � �� �� � �� �� ';
hstr[4]:=hstr[4]+'�� �� �� � � �� �� �� �� �� �� �� �� �� �� � �� �� ߶ �� �� ';
hstr[4]:=hstr[4]+'� �� �� � �� �� � �� �� �� ص �� ڮ �� ۡ �� ݶ �� � � �� ';
hstr[4]:=hstr[4]+'� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �� �� �� � �� ';
hstr[4]:=hstr[4]+'�� �� ܦ �� � � � �� �� �� �� �� � �� �� �� � �� �� �� �� ';
hstr[4]:=hstr[4]+'�� �� �� � � � �� �� �� � �� � � �� ܶ � �� �� � � �� ';
hstr[4]:=hstr[4]+'�� �� � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �� ';
hstr[4]:=hstr[4]+'�� �� �� ';

hstr[5]:='ج �� �� �� ݭ �� �� � �� � �� �� � �� �� � �� �� �� �� ٦ �� �� �� � �� ';

hstr[6]:='�� �� ެ �� � �� �� � �� �� �� �� �� �� �� �� �� �� � �� �� � � �� ';
hstr[6]:=hstr[6]+'� �� �� �� �� �� �� �� �� �� � �� �� �� �� ٺ ۺ �� �� �� �� � ';
hstr[6]:=hstr[6]+'�� �� ۮ ܽ �� �� �� ݳ �� �� ߻ � �� �� �� �� �� � � �� �� ';
hstr[6]:=hstr[6]+'�� �� �� �� � �� � � �� �� �� �� �� �� �� �� ';

hstr[7]:='�� �� �� � �� ؤ �� �� � �� �� �� �� ߦ �� �� �� � �� � �� �� �� ';
hstr[7]:=hstr[7]+'�� � �� غ ھ ۬ ޻ �� �� �� � � �� �� ت �� �� �� ܪ �� �� ';
hstr[7]:=hstr[7]+'� �� �� �� �� � � �� �� ب ݢ �� �� �� �� � �� �� �� � �� ';
hstr[7]:=hstr[7]+'�� ڸ � �� �� �� �� �� � �� �� �� �� ڬ �� �� �� �� �� �� �� ';
hstr[7]:=hstr[7]+'�� �� � � � �� �� � �� �� �� �� �� �� �� �� ڴ �� �� �� � ';
hstr[7]:=hstr[7]+'�� �� ݸ �� �� �� �� �� �� �� �� �� �� �� Ȳ �� �� �� � � �� ';
hstr[7]:=hstr[7]+'�� �� � �� �� �� �� � �� �� �� �� �� �� �� �� �� � � � �� �� �� ';

hstr[8]:='�� Ϻ �� �� �� �� �� �� �� �� �� �� � �� �� �� � �� �� �� � �� �� �� ';
hstr[8]:=hstr[8]+'�� �� ޶ �� �� � � � � � � ڭ �� �� �� �� �� �� �� � �� �� ';
hstr[8]:=hstr[8]+'޿ �� �� �� �� ڧ ݦ ޮ ް �� �� ܩ �� �� �� �� �� �� �� �� �� �� ';
hstr[8]:=hstr[8]+'� � �� � � �� �� �� �� � �� �� �� �� �� � �� �� �� �� �� �� ';
hstr[8]:=hstr[8]+'�� �� �� �� �� ۨ ۼ �� ߧ �� � � � �� � �� �� �� �� �� �� �� ';
hstr[8]:=hstr[8]+'�� �� �� � �� � � �� �� �� �� ޥ �� �� � �� � � �� �� �� �� ';
hstr[8]:=hstr[8]+'�� �� � � �� ڻ �� �� �� �� ޽ ߫ �� � �� �� �� �� � ';

hstr[9]:='آ ؽ �� �� ٥ �� ڵ �� ܸ �� �� �� ު �� ߴ �� �� �� � �� � �� �� �� ';
hstr[9]:=hstr[9]+'�� � �� � � �� �� �� � �� � �� � � � �� �� �� �� �� �� �� ';
hstr[9]:=hstr[9]+'�� �� �� �� ٤ ۣ �� � � �� �� � �� �� �� �� �� �� �� �� �� ';
hstr[9]:=hstr[9]+'�� �� �� �� �� �� �� �� �� �� � �� �� �� � � � �� �� � �� ';
hstr[9]:=hstr[9]+'�� � �� �� �� �� �� �� �� �� �� �� �� � � �� �� �� �� �� �� ';
hstr[9]:=hstr[9]+'�� ܴ �� �� �� � �� �� � � � �� �� �� �� �� �� ڦ ڵ �� � ';
hstr[9]:=hstr[9]+'� � �� �� �� �� � � �� �� �� �� �� �� ݣ �� �� �� �� � �� ';
hstr[9]:=hstr[9]+'� �� �� �� �� �� �� �� ݼ � � �� �� �� � �� �� �� � �� �� ';
hstr[9]:=hstr[9]+'�� �� �� � �� �� �� � �� �� �� �� ڪ �� �� �� �� �� �� � �� ';
hstr[9]:=hstr[9]+'� � � �� �� � �� � �� �� �� �� �� �� �� �� �� ۲ �� � �� ';
hstr[9]:=hstr[9]+'�� �� �� �� �� �� �� �� ާ � �� �� �� � �� �� �� �� �� �� �� ';
hstr[9]:=hstr[9]+'�� �� �� �� �� �� �� ';

hstr[10]:='�� �� �� �� �� �� �� �� �� � �� ٩ ݨ �� � �� � �� �� �� �� �� ';
hstr[10]:=hstr[10]+'�� �� � � � �� �� � �� �� � � �� � �� �� � � �� �� ';
hstr[10]:=hstr[10]+'�� � �� �� �� �� ޢ ߵ �� �� �� ܥ � � �� ٨ �� �� ۦ �� ';
hstr[10]:=hstr[10]+'�� � �� �� ڲ ڿ �� �� �� �� �� �� ظ �� �� �� �� �� � � ';
hstr[10]:=hstr[10]+'� � �� �� � �� �� �� �� � �� �� � �� �� �� �� �� ';

hstr[11]:='�� �� � �� �� �� �� � �� �� �� � � �� � �� � � � �� �� ';
hstr[11]:=hstr[11]+'ݹ �� � �� � �� �� �� �� �� �� �� � �� �� �� �� ߷ �� �� ';
hstr[11]:=hstr[11]+'�� ڳ �� �� �� �� �� �� ܨ � ت ٳ ٵ ۪ �� �� ݰ �� ޼ ߿ ';
hstr[11]:=hstr[11]+'� � �� � �� � �� � �� �� �� �� �� �� �� �� � � � � ';
hstr[11]:=hstr[11]+'�� �� �� �� � �� �� �� �� �� �� �� �� �� �� �� �� � �� � ';
hstr[11]:=hstr[11]+'�� � �� �� � �� �� �� ܮ ݹ � �� �� �� ޤ �� �� � � �� ';
hstr[11]:=hstr[11]+'�� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� � � � ';
hstr[11]:=hstr[11]+'�� �� ۹ �� �� �� �� � �� �� � �� �� �� �� � �� �� � � ';
hstr[11]:=hstr[11]+'�� � �� �� �� �� �� �� �� �� �� � �� �� � �� �� �� �� �� ';
hstr[11]:=hstr[11]+'�� �� ޤ ߣ �� �� �� �� �� �� � �� � �� �� �� � � �� �� ';
hstr[11]:=hstr[11]+'�� �� � �� �� �� �� �� �� �� �� �� � �� � �� � �� �� �� ';
hstr[11]:=hstr[11]+'�� �� �� � �� �� �� � �� �� �� � �� ';

hstr[12]:='�� �� �� � � ۽ ݤ �� ܬ � �� �� �� � �� �� �� �� �� �� �� ';
hstr[12]:=hstr[12]+'�� �� � �� � �� �� � � �� � � �� �� ݮ �� � � �� � ';
hstr[12]:=hstr[12]+'�� �� �� �� �� �� �� �� �� �� ޫ �� �� �� � �� � �� �� �� ';
hstr[12]:=hstr[12]+'�� �� �� �� � �� � �� �� �� �� �� �� �� �� �� �� �� �� �� ';
hstr[12]:=hstr[12]+'�� � �� �� �� �� �� ؿ �� � �� �� � �� �� �� �� �� �� �� ';
hstr[12]:=hstr[12]+'�� ڤ �� �� �� � �� �� �� �� �� �� �� �� �� � �� �� �� ٰ ';
hstr[12]:=hstr[12]+'�� �� �� �� �� �� �� �� �� �� � �� ';

hstr[13]:='�� �� �� �� ؾ ܵ �� �� � �� �� � �� �� �� ߭ �� �� �� ث �� �� � ';
hstr[13]:=hstr[13]+'� �� �� �� ګ �� ٣ �� � �� �� � �� �� �� �� �� إ �� �� ';
hstr[13]:=hstr[13]+'� �� �� �� �� �� �� ؿ �� �� � � �� �� �� �� �� � �� �� ';
hstr[13]:=hstr[13]+'�� �� � ٯ �� �� �� �� �� �� �� �� �� �� �� �� � ';

hstr[14]:='ک �� � �� ';

hstr[15]:='�� �� �� �� ٽ �� �� �� �� �� �� � �� �� �� �� � �� �� �� �� �� �� ';
hstr[15]:=hstr[15]+'�� � �� �� �� �� ܡ �� �� � ا �� �� �� �� ۯ �� �� ܱ �� ';
hstr[15]:=hstr[15]+'ߨ �� �� �� �� �� � �� � � � �� � �� �� � �� �� �� �� ';
hstr[15]:=hstr[15]+'�� �� �� �� �� �� ݳ �� �� �� �� �� � � �� � � �� � �� ';
hstr[15]:=hstr[15]+'� ٷ � �� �� �� ۶ �� �� � �� �� �� � �� �� �� �� �� �� ';
hstr[15]:=hstr[15]+'� � � �� �� �� ';

hstr[16]:='ؽ �� ٹ �� ܻ �� �� ݽ �� �� ޭ �� � � � �� � �� � �� �� � �� ';
hstr[16]:=hstr[16]+'�� �� � �� �� �� �� �� �� �� �� �� �� �� �� �� �� ٻ �� �� ';
hstr[16]:=hstr[16]+'ܷ �� �� ݡ �� � � � � � � �� �� �� �� �� �� � �� �� ';
hstr[16]:=hstr[16]+'�� �� �� � �� � �� �� �� �� �� �� �� ڽ �� �� � � � �� ';
hstr[16]:=hstr[16]+'�� �� �� �� ۧ � � � �� �� �� �� �� �� � �� �� �� �� � ';
hstr[16]:=hstr[16]+'�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �� �� ';
hstr[16]:=hstr[16]+'�� �� ٴ �� �� �� �� �� � �� � �� �� �� �� �� �� ڰ ۾ �� ';
hstr[16]:=hstr[16]+'ޡ ޾ � �� �� � �� � �� �� �� � � �� � �� �� �� ڹ �� ';
hstr[16]:=hstr[16]+'� � �� � �� �� �� �� �� �� �� �� ';

hstr[17]:='�� �� �� �� � �� � �� �� �� �� � �� �� �� �� �� �� �� �� �� �� ޸ ';
hstr[17]:=hstr[17]+'�� � �� � �� � �� � �� �� ި �� � � ټ ';

hstr[18]:='ئ �� �� �� � �� �� � �� �� � ܣ �� �� �� �� �� �� � �� �� �� � ';
hstr[18]:=hstr[18]+'� �� �� �� �� �� ڨ ۷ �� �� �� � �� �� �� �� �� �� � �� ';
hstr[18]:=hstr[18]+'�� �� �� � �� �� �� ۿ �� �� � �� �� �� �� �� �� ߡ � �� ';
hstr[18]:=hstr[18]+'� � �� ڷ �� ݷ �� �� �� � �� �� �� �� �� �� �� �� �� �� ';
hstr[18]:=hstr[18]+'�� �� �� �� �� ݪ �� ߱ �� �� �� �� � �� �� �� �� �� �� �� ';
hstr[18]:=hstr[18]+'� �� �� ٿ �� �� �� �� �� � � � �� � �� � � �� �� �� ';
hstr[18]:=hstr[18]+'�� �� �� �� �� �� �� �� �� �� ٹ �� �� �� �� �� �� � �� �� ';
hstr[18]:=hstr[18]+'�� �� � �� �� �� �� �� �� ڡ ݿ �� �� �� � �� � ޴ � �� ';
hstr[18]:=hstr[18]+'�� �� � � �� �� �� �� �� � � � �� �� �� �� � �� �� �� ';
hstr[18]:=hstr[18]+'�� �� �� �� ݴ � �� �� �� � ݥ �� � � �� �� �� � �� �� �� �� ';

hstr[19]:='̡ ̢ ̣ �� � �� �� �� �� � �� �� �� �� ̦ ̪ ̭ ۢ ޷ ߾ �� �� �� ';
hstr[19]:=hstr[19]+'�� �� �� ̴ ̵ ̶ ̷ ̺ ̻ ̾ ۰ � � �� �� �� �� �� �� �� ';
hstr[19]:=hstr[19]+'� �� � �� �� � � �� �� ػ �� � � �� �� ߯ �� �� � �� ';
hstr[19]:=hstr[19]+'�� �� �� �� �� �� �� �� �� �� �� � �� � � �� �� �� �� �� ';
hstr[19]:=hstr[19]+'�� �� �� �� �� � ٬ �� �� � �� �� �� �� �� �� �� �� �� ͡ ';
hstr[19]:=hstr[19]+'ͤ ͧ �� �� �� �� � �� �� �� �� �� ͩ ͪ ͫ ͮ ͱ ١ �� �� ';
hstr[19]:=hstr[19]+'�� �� � �� �� �� �� �� ܢ ݱ �� �� �� �� �� � �� ߯ �� � ';
hstr[19]:=hstr[19]+'�� �� ر ٢ �� �� �� �� �� �� �� �� �� �� �� �� ';

hstr[20]:='�� � �� �� �� �� �� �� �� �� ܹ ݸ �� �� � �� �� � �� �� �� � �� ';
hstr[20]:=hstr[20]+'�� �� �� �� �� �� ޱ �� � �� �� � � �� �� � � �� � �� ';
hstr[20]:=hstr[20]+'� � � �� �� �� �� �� �� �� �� � �� �� ޳ �� �� ݫ � � ';
hstr[20]:=hstr[20]+'�� � �� �� أ �� �� �� �� �� �� �� �� �� � � �� �� �� �� ';
hstr[20]:=hstr[20]+'� �� �� �� �� �� �� �� �� ';

hstr[21]:='�� �� �� ۭ �� ݾ �� �� �� �� �� � �� � �� �� �� �� �� �� � � �� ';
hstr[21]:=hstr[21]+'�� �� � � �� �� � � �� �� �� �� �� �� �� �� �� �� �� � ';
hstr[21]:=hstr[21]+'�� �� �� �� �� �� �� ݲ ޺ � �� �� � � �� �� �� �� � �� ';
hstr[21]:=hstr[21]+'�� �� �� �� �� ܼ �� �� �� �� � � �� �� �� �� �� �� �� � ';
hstr[21]:=hstr[21]+'�� �� �� �� �� �� �� �� �� �� ޯ ߢ � �� �� � �� � �� � ';
hstr[21]:=hstr[21]+'�� � �� �� �� ض ܰ � � �� �� �� �� �� ߩ � � �� ܺ �� ';
hstr[21]:=hstr[21]+'� �� �� �� � �� �� ڼ �� �� ޣ � � �� �� �� �� �� �� �� ';
hstr[21]:=hstr[21]+'�� �� �� �� �� �� �� �� �� � � �� �� �� �� �� �� �� Ѧ �� ';
hstr[21]:=hstr[21]+'�� �� �� �� �� �� ۨ �� �� ަ � �� � � �� � �� �� ';

hstr[22]:='�� �� � �� � �� �� � �� �� �� �� �� �� ٲ �� �� �� �� ۱ ۳ ܾ �� ';
hstr[22]:=hstr[22]+'�� �� �� �� �� �� �� �� �� �� �� �� �� �� � �� �� �� �� �� ';
hstr[22]:=hstr[22]+'�� � �� �� �� Ҩ Կ ز س ߺ �� �� �� �� �� �� �� �� � �� ';
hstr[22]:=hstr[22]+'� �� �� ҭ Ү Ҵ ҷ Ҹ ק �� �� �� �� �� �� �� ҿ �� �� �� ';
hstr[22]:=hstr[22]+'�� �� �� ٫ ڱ �� �� ܲ �� �� ޲ �� �� �� ߮ ߽ �� �� �� �� ';
hstr[22]:=hstr[22]+'� �� � �� �� �� � �� �� �� � � �� �� �� �� �� �� �� � ';
hstr[22]:=hstr[22]+'� �� �� �� �� �� �� ط ۴ �� �� ܧ �� �� � �� � � �� � ';
hstr[22]:=hstr[22]+'�� � � � �� �� �� ۫ �� �� ݺ �� �� �� �� �� �� �� � �� ';
hstr[22]:=hstr[22]+'� � �� �� � � � ӷ Ӹ Ӻ ӻ ӽ Ӿ �� ٸ �� ܭ � � �� ';
hstr[22]:=hstr[22]+'�� � �� �� �� �� �� ٧ ݬ ݯ ݵ �� �� �� � �� �� � �� �� ';
hstr[22]:=hstr[22]+'�� �� �� �� �� �� �� �� خ ع �� ٶ �� �� �� �� �� �� �� �� ';
hstr[22]:=hstr[22]+'�� �� �� �� �� �� �� �� � �� � �� �� �� �� � � �� �� �� ';
hstr[22]:=hstr[22]+'�� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� ܫ ܾ �� �� ';
hstr[22]:=hstr[22]+'�� �� � �� � �� � � �� �� �� � �� �� � �� �� �� �� �� ';
hstr[22]:=hstr[22]+'�� �� ۩ ܿ �� � � � � �� �� � �� ';

hstr[23]:='�� �� �� � �� �� �� �� �� �� �� � �� �� �� �� �� �� � �� �� �� �� ';
hstr[23]:=hstr[23]+'�� � �� � �� ߸ �� � � �� �� �� �� �� � �� �� � �� �� ';
hstr[23]:=hstr[23]+'۵ � �� � �� � � �� گ �� �� �� �� �� �� �� ߡ �� �� �� ';
hstr[23]:=hstr[23]+'�� �� �� �� �� �� �� �� �� �� �� �� �� � �� �� �� � � �� ';
hstr[23]:=hstr[23]+'�� �� �� �� � � � �� ֡ ں � �� �� ش �� ۤ �� �� �� �� ';
hstr[23]:=hstr[23]+'�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �� ';
hstr[23]:=hstr[23]+'�� �� �� �� �� �� �� �� ڣ �� �� � �� �� ݧ �� � �� � �� ';
hstr[23]:=hstr[23]+'�� �� �� �� �� ٪ ۥ �� � � �� �� �� �� �� �� �� �� �� �� ';
hstr[23]:=hstr[23]+'�� �� �� �� �� �� ҷ ק ׭ �� �� �� � �� �� �� �� پ �� ߪ ';
hstr[23]:=hstr[23]+'� �� � �� �� �� �� �� �� �� �� � �� � �� � �� �� �� �� ';
hstr[23]:=hstr[23]+'�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ۸ �� �� �� ';
hstr[23]:=hstr[23]+'�� �� �� ߬ �� �� ީ ߤ �� �� �� �� �� �� �� �� �� �� ';

result:=s;
py:='';
j:=1;
i:=Length(Result);
while (j<=i) Do
begin
if Pos(s[j],cstr)>0 then
   begin
      py:=py+s[j];
      j:=j+1;
   end
else
begin
  hz:=s[j]+s[j+1];
  py1:=getpy2(hz);
  if py1<>char(0) then
  begin
  py:=py+py1;
  end
  else
  for k:=1 to 23 do
  begin
      if Pos(hz,hstr[k])>0 then
      begin
       py:=py+zm[k];
       break;
      end;
      if k=23 then py:=py+'!';
  end;
  j:=j+2;
end;
end;
getpy1:=py;
end;

End.
