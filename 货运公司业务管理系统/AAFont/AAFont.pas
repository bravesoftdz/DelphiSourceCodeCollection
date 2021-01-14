{*******************************************************************************

                          AAFont - 平滑特效字体控件包
                          ---------------------------
                           (C)Copyright 2001, 2002
                            与月共舞工作室 周劲羽

            这一控件包是自由软件，您可以遵照自由软件基金会出版的GNU 较
        宽松通用公共许可证协议来修改和重新发布这一程序，或者用许可证的
        第二版，或者（根据您的选择）用任何更新的版本。

            发布这一控件包的目的是希望它有用，但没有任何担保。甚至没有
        适合特定目的而隐含的担保。更详细的情况请参阅 GNU 较宽松通用公
        共许可证。

            您应该已经和控件包一起收到一份 GNU 较宽松通用公共许可证的
        副本。如果还没有，写信给：
            Free Software Foundation, Inc., 59 Temple Place - Suite
        330, Boston, MA 02111-1307, USA.

          原始文件名：AAFont.pas
            单元作者：周劲羽
            下载地址：http://yygw@163.com
            电子邮件：yygw@163.com
            最后更新：2002.10.22

*******************************************************************************}

unit AAFont;
{* |<PRE>
================================================================================
* 软件名称：平滑特效字体控件包 V2.56
* 单元名称：平滑特效字体单元
* 单元作者：与月共舞工作室  周劲羽
* 下载网址：http://yygw.126.com
* Eamil   ：yygw@163.com; yygw@sina.com
* 开发平台：PWin98SE + Delphi 5.0
* 兼容测试：PWin9X/2000/XP + Delphi 5/6/7 + C++Build 5/6
* 备　　注：平滑字体算法由李文松朋友提供的AAFont修改而来
* 最后更新：2002.10.23
================================================================================
|</PRE>}

interface

{$I AAFont.inc}

uses
  Windows, Messages, Classes, Graphics, SysUtils, Consts, Controls, Forms,
  Registry, StdCtrls, ExtCtrls, Math, IniFiles;

type

  TAAQuality = (aqHigh, aqNormal, aqLow, aqNone);
  {* 平滑字体显示精度类型
   |<PRE>
     aqHigh     - 4X4采样的最高显示精度，速度较慢
     aqNormal   - 3X3采样的普通显示精度，最佳性能速度比
     aqLow      - 2X2采样的低显示精度，速度较快
     aqNone     - 无平滑效果
   |</PRE>}
  TAlpha = 0..100;
  {* 不透明度类型，0为完全透明，100为完全不透明}
  TBlurStrength = 0..100;
  {* 模糊度类型，0为不模糊，100为最大模糊度}
  TOffset = -20..20;
  {* 阴影偏移量范围}
  TSprayRange = 0..100;
  {* 喷溅效果参数范围}
  TAngle = -360..360;
  {* 旋转角度}
  TGradualStyle = (gsLeftToRight, gsRightToLeft, gsTopToBottom, gsBottomToTop,
    gsCenterToLR, gsCenterToTB);
  {* 渐变方式类型
   |<PRE>
     gsLeftToRight      - 从左向右渐变
     gsRightToLeft      - 从右向左渐变
     gsTopToBottom      - 从上向下渐变
     gsBottomToTop      - 从下向上渐变
     gsCenterToLR       - 从中间向左右渐变
     gsCenterToTB       - 从中间向上下渐变
   |</PRE>}
  TTextureMode = (tmTiled, tmStretched, tmCenter, tmNormal);
  {* 纹理图像显示模式
   |<PRE>
     tmTiled            - 平铺显示
     tmStretched        - 自动缩放显示
     tmCenter           - 在中心位置显示
     tmNormal           - 在左上角显示
   |</PRE>}

  TAAEffect = class;
  TAAMask = class;
  TAABlend = class;
  TAAFont = class;
  TAAFontEx = class;

{ TNotifyClass }

  TNotifyClass = class(TPersistent)
  {* 带更新通知的持久性类，控件包中大部分持久类的基类，一般不需要直接使用}
  private
    FOnChanged: TNotifyEvent;
  protected
    FOwner: TPersistent;
    procedure Changed; virtual;
    procedure OnChildChanged(Sender: TObject); virtual;
    function GetOwner: TPersistent; override;
  public
    constructor Create(ChangedProc: TNotifyEvent); virtual;
    {* 类构造器，参数为通知事件}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    {* 属性已变更事件}
  end;

{ TEnabledClass }

  TEnabledClass = class(TNotifyClass)
  {* 带Enabled功能的更新通知的持久性类，一般不需要直接使用}
  private
    FEnabled: Boolean;
  protected
    procedure SetEnabled(const Value: Boolean); virtual;
    procedure Changed; override;
  public
    constructor Create(ChangedProc: TNotifyEvent); override;
    {* 类构造器，参数为通知事件}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    {* 是否允许使用}
  end;

{ TAAShadow }

  TAAShadow = class(TEnabledClass)
  {* 平滑特效字体阴影显示参数类，一般不需要用户直接创建}
  private
    FBlur: TBlurStrength;
    FAlpha: TAlpha;
    FColor: TColor;
    FOffsetX: TOffset;
    FOffsetY: TOffset;
    procedure SetBlur(const Value: TBlurStrength);
    procedure SetColor(const Value: TColor);
    procedure SetOffsetX(const Value: TOffset);
    procedure SetOffsetY(const Value: TOffset);
    procedure SetAlpha(const Value: TAlpha);
  public
    constructor Create(ChangedProc: TNotifyEvent); override;
    {* 类构造器，参数为通知事件}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
  published
    property Blur: TBlurStrength read FBlur write SetBlur default 80;
    {* 阴影模糊度，参数范围为0..100，0为不模糊}
    property Alpha: TAlpha read FAlpha write SetAlpha default 70;
    {* 阴影不透明度，参数范围为0..100，0为全透明，100为不透明}
    property Color: TColor read FColor write SetColor default $00444444;
    {* 阴影颜色}
    property OffsetX: TOffset read FOffsetX write SetOffsetX default 2;
    {* 阴影水平方向偏移量，为负值时向左偏移}
    property OffsetY: TOffset read FOffsetY write SetOffsetY default 2;
    {* 阴影垂直方向偏移量，为负值时向上偏移}
  end;

{ TAAGradual }

  TAAGradual = class(TEnabledClass)
  {* 平滑特效字体渐变显示参数类，一般不需要用户直接创建}
  private
    FStyle: TGradualStyle;
    FStartColor: TColor;
    FEndColor: TColor;
    procedure SetStyle(const Value: TGradualStyle);
    procedure SetStartColor(const Value: TColor);
    procedure SetEndColor(const Value: TColor);
  public
    constructor Create(ChangedProc: TNotifyEvent); override;
    {* 类构造器，参数为通知事件}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
  published
    property Style: TGradualStyle read FStyle write SetStyle default gsLeftToRight;
    {* 渐变显示风格}
    property StartColor: TColor read FStartColor write SetStartColor
      default clWhite;
    {* 渐变起始色}
    property EndColor: TColor read FEndColor write SetEndColor default clBlack;
    {* 渐变结束色}
  end;

{ TAATexture }

  TAATexture = class(TEnabledClass)
  {* 平滑特效字体纹理参数类，一般不需要用户直接创建}
  private
    FPicture: TPicture;
    FMode: TTextureMode;
    procedure SetMode(const Value: TTextureMode);
    procedure SetPicture(const Value: TPicture);
    procedure PictureChanged(Sender: TObject);
  public
    constructor Create(ChangedProc: TNotifyEvent); override;
    {* 类构造器，参数为通知事件}
    destructor Destroy; override;
    {* 类析构器}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
  published
    property Mode: TTextureMode read FMode write SetMode default tmTiled;
    {* 纹理图像显示模式}
    property Picture: TPicture read FPicture write SetPicture;
    {* 纹理图像}
  end;

{ TAAEffect }

  TAAEffect = class(TNotifyClass)
  {* 平滑特效字体参数类，一般不需要用户直接创建}
  private
    FAlpha: TAlpha;
    FBlur: TBlurStrength;
    FGradual: TAAGradual;
    FShadow: TAAShadow;
    FTexture: TAATexture;
    FOutline: Boolean;
    FNoise: Byte;
    FSpray: TSprayRange;
    FAngle: TAngle;
    procedure SetAlpha(const Value: TAlpha);
    procedure SetBlur(const Value: TBlurStrength);
    procedure SetGradual(const Value: TAAGradual);
    procedure SetShadow(const Value: TAAShadow);
    procedure SetTexture(const Value: TAATexture);
    procedure SetOutline(const Value: Boolean);
    procedure SetNoise(const Value: Byte);
    procedure SetSpray(const Value: TSprayRange);
    procedure SetAngle(const Value: TAngle);
  public
    constructor Create(ChangedProc: TNotifyEvent); override;
    {* 类构造器，参数为通知事件}
    destructor Destroy; override;
    {* 类析构器}
    procedure Assign(Source: TPersistent); override;
    procedure LoadFromIni(Ini: TCustomIniFile; const Section: string); virtual;
    procedure SaveToIni(Ini: TCustomIniFile; const Section: string); virtual;
    {* 对象赋值方法}
  published
    property Shadow: TAAShadow read FShadow write SetShadow;
    {* 字体阴影参数}
    property Gradual: TAAGradual read FGradual write SetGradual;
    {* 渐变显示参数}
    property Texture: TAATexture read FTexture write SetTexture;
    {* 字体纹理参数}
    property Alpha: TAlpha read FAlpha write SetAlpha default 100;
    {* 不透明度，参数范围为0..100，0为完全透明，100为不透明}
    property Blur: TBlurStrength read FBlur write SetBlur default 0;
    {* 模糊度，参数范围为0..100，0为不模糊}
    property Angle: TAngle read FAngle write SetAngle default 0;
    {* 字体旋转角度，参数范围为-360..360，单位为度}
    property Noise: Byte read FNoise write SetNoise default 0;
    {* 噪声效果，参数范围为0..255}
    property Spray: TSprayRange read FSpray write SetSpray default 0;
    {* 喷溅效果，参数范围为0..100}
    property Outline: Boolean read FOutline write SetOutline default False;
    {* 是否显示轮廓效果}
  end;

{ TAAMask }

  EInvalidPixel = class(Exception);
  EInvalidLine = class(Exception);

  PByteArray = ^TByteArray;
  {* 字节数组指针}
  TByteArray = array[0..32767] of Byte;
  {* 字节数组类型}

  PRGBArray = ^TRGBArray;
  {* RGB数组指针}
  TRGBArray = array[0..8192] of tagRGBTriple;
  {* RGB数组类型}

  TAAMask = class(TPersistent)
  {* 平滑特效字体蒙板处理类，供绘制平滑字体时内部使用}
  private
    FQuality: TAAQuality;
    FpMaskBuff: PByteArray;
    FHeight: Integer;
    FWidth: Integer;
    BytesLineGray: Integer;
    BytesLineMask: Integer;
    Scale: Integer;
    AAFont: TAAFont;
    GrayBmp: TBitmap;
    procedure InitGrayBmp;
    procedure FreeGrayBmp;
    procedure SetQuality(const Value: TAAQuality);
    function TextExtentEx(s: string; var Point: TPoint): TSize;
  protected
    function ScanLine(Line: Integer; pAData: PByteArray): PByteArray; overload;
    property pMaskBuff: PByteArray read FpMaskBuff;
  public
    constructor Create(AOwner: TAAFont);
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
    procedure DrawMask(Text: string);
    {* 绘制文本蒙板图}
    procedure DrawMaskEx(Text: string; Extend: TSize; Point: TPoint);
    {* 绘制文本蒙板图增强版}
    procedure Blur(Blur: TBlurStrength);
    {* 对蒙板图进行模糊处理}
    procedure Outline;
    {* 对蒙板图进行轮廓处理}
    procedure Spray(Amount: Integer);
    {* 对蒙板图进行喷溅处理}
    function TextExtent(s: string): TSize;
    {* 返回文本高、宽}
    function TextHeight(s: string): Integer;
    {* 返回文本高度}
    function TextWidth(s: string): Integer;
    {* 返回文本宽度}
    function ScanLine(Line: Integer): Pointer; overload;
    {* 返回蒙板图扫描线地址}
    function Pixel(x, y: Integer): Byte;
    {* 返回蒙板图指定象素灰度值}
    function PixelAddr(x, y: Integer): Pointer;
    {* 返回蒙板图指定象素地址}
    property Height: Integer read FHeight;
    {* 蒙板图的高度}
    property Width: Integer read FWidth;
    {* 蒙板图的宽度}
    property Quality: TAAQuality read FQuality write SetQuality;
    {* 平滑字体绘制精度}
  end;

{ TAABlend }

  EInvalidForeBmp = class(Exception);

  TAABlend = class(TPersistent)
  {* 平滑特效字体图像混合处理类，供绘制平滑字体时内部使用}
  private
    FForeBmp: TBitmap;
    RGBBmp: TBitmap;
    AAFont: TAAFont;
    procedure SetForeBmp(const Value: TBitmap);
  public
    constructor Create(AOwner: TAAFont);
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
    procedure Blend(x, y: Integer; AColor: TColor; Alpha: TAlpha; Mask: TAAMask);
    {* 按指定颜色进行混合}
    procedure BlendEx(x, y: Integer; Alpha: TAlpha; Mask: TAAMask);
    {* 使用前景图ForeBmp进行混合}
    property ForeBmp: TBitmap read FForeBmp write SetForeBmp;
    {* 字体前景图}
  end;

{ TAAFont }

  TAAFont = class
  {* 平滑特效字体绘制类，封装了基本的平滑字体绘制方法，用户可手动使用。
   |<BR>如果需要在其它地方绘制平滑字体，可使用下面的方法：
   !var
   !  AAFont: TAAFont;
   !  W, H: Integer;
   !  S: string;
   !begin
   !  // 创建TAAFont实例，并指定它使用PaintBox1的画布进行绘制
   !  AAFont := TAAFont.Create(PaintBox1.Canvas);
   !  try
   !    with PaintBox1.Canvas do
   !    begin
   !      Font.Name := '宋体'; // 设置字体
   !      Font.Size := 24;
   !      Font.Color := clBlue;
   !      Brush.Style := bsClear; // 设置透明绘制
   !    end;
   !    S := '这是一个使用平滑字体的例子';
   !    W := AAFont.TextWidth(S);
   !    H := AAFont.TextHeight(S);
   !    with PaintBox1 do // 在控件中心输出文本
   !      AAFont.TextOut((Width - W) div 2, (Height - H) div 2, S, 80, 0);
   !    AAFont.Canvas := Image1.Canvas; // 也可以切换到另一画布
   !    AAFont.TextOut(10, 10, S); // 绘制时将使用Image1.Canvas的字体属性
   !  finally
   !    AAFont.Free;
   !  end;
   !end;}
  private
    FCanvas: TCanvas;
    function GetQuality: TAAQuality;
    procedure SetQuality(const Value: TAAQuality);
  protected
    Mask: TAAMask;
    Blend: TAABlend;
  public
    constructor Create(ACanvas: TCanvas); virtual;
    {* 类构造器，参数为绘制平滑字体文本和计算文本大小时使用的画布。
     |<BR> 允许为nil，如果为nil，请在调用文本方法前对Canvas属性赋值}
    destructor Destroy; override;
    {* 类析构器}
    procedure TextOut(x, y: Integer; s: string; Alpha: TAlpha = 100;
      Blur: TBlurStrength = 0);
    {* 输出平滑字体文本到当前设置的Canvas中，使用它的字体属性和画刷设置。
     |<BR> 如果要输出背景透明的文本，需要将Canvas.Brush.Style设为bsClear。
     |<BR> 注：该方法不支持多行文本。
     |<PRE>
       x, y: Integer    - 文本输出位置
       s: string        - 要绘制的字符串
       Alpha: TAlpha    - 文本的不透明度，默认为完全不透明
       Blur: TBlurStrength  - 文本的模糊度，默认为不进行模糊处理
     |</PRE>}
    function TextExtent(s: string): TSize; virtual;
    {* 返回文本高、宽}
    function TextHeight(s: string): Integer; virtual;
    {* 返回指定文本的显示高度，使用当前的Canvas属性}
    function TextWidth(s: string): Integer; virtual;
    {* 返回指定文本的显示宽度，使用当前的Canvas属性}
    property Quality: TAAQuality read GetQuality write SetQuality;
    {* 平滑字体绘制精度}
    property Canvas: TCanvas read FCanvas write FCanvas;
    {* 用于平滑字体绘制输出和文本尺寸检测的画布}
  end;

{ TAAFontEx }

  TAAFontEx = class(TAAFont)
  {* 扩展的平滑特效字体绘制类，实现了阴影、渐变、纹理等特效。
   |<BR> 用户可手动TAAFontEx来绘制带特效的平滑字体文本，使用方法类似于TAAFont。}
  private
    FEffect: TAAEffect;
    procedure SetEffect(const Value: TAAEffect);
  protected
    function GetShadowPoint: TPoint;
    function GetTextPoint: TPoint;
    procedure CreateGradual;
    procedure DrawTiled(Canvas: TCanvas; Rect: TRect; G: TGraphic);
    procedure CreateForeBmp;
    procedure CreateNoiseBmp;
    procedure AddNoise(Amount: Byte);
  public
    constructor Create(ACanvas: TCanvas); override;
    {* 类构造器，参数为绘制平滑字体文本和计算文本大小时使用的画布。
     |<BR> 允许为nil，如果为nil，请在调用文本方法前对Canvas属性赋值}
    destructor Destroy; override;
    {* 类析构器}
    function TextExtent(s: string): TSize; override;
    {* 返回文本高、宽
     |<BR> 注：Effect参数中的阴影、旋转角度等设置将影响返回结果}
    procedure TextOut(x, y: Integer; s: string);
    {* 使用Effect设置的字体特效，输出平滑字体文本到当前设置的Canvas中，使用它的字体属性和画刷设置。
     |<BR> 如果要输出背景透明的文本，需要将Canvas.Brush.Style设为bsClear。
     |<BR> 注：该方法不支持多行文本。
     |<PRE>
       x, y: Integer    - 文本输出位置
       s: string        - 要绘制的字符串
     |</PRE>}
    property Effect: TAAEffect read FEffect write SetEffect;
    {* 平滑字体绘制时的特效参数}
  end;

const
  csMaxProgress = 255;

type
  TParentControl = class(TWinControl);
  TMyControl = class(TControl);
  TFontLabel = class;
  TFontLabels = class;
  TUserLabel = class;
  TUserLabels = class;
  TAAGraphicControl = class;

{ TFontLabel }

  TFontLabel = class(TCollectionItem)
  {* 字体标签列表项类，TFontLabels的子项，一般不需要用户直接创建}
  private
    FName: string;
    FFont: TFont;
    FEffect: TAAEffect;
    function GetFontLabels: TFontLabels;
    procedure Changed;
    procedure SetFont(const Value: TFont);
    procedure SetName(const Value: string);
    procedure OnEffectChanged(Sender: TObject);
    procedure SetEffect(const Value: TAAEffect);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
    property FontLabels: TFontLabels read GetFontLabels;
    {* 所有者}
  published
    property Name: string read FName write SetName;
    {* 字体标签名}
    property Font: TFont read FFont write SetFont;
    {* 字体属性}
    property Effect: TAAEffect read FEffect write SetEffect;
    {* 平滑字体特效显示属性}
  end;

{ TFontLabels }

  TFontLabels = class(TOwnedCollection)
  {* 字体标签列表类，定义了在文本类控件中可使用的字体标签集，一般不需要用户直接创建}
  private
    FOnChanged: TNotifyEvent;
    function GetItem(Index: Integer): TFontLabel;
    procedure SetItem(Index: Integer; const Value: TFontLabel);
  protected
    procedure Changed;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TComponent);
    {* 类构造器}
    function AddItem(AName: string; AFontName: string; AFontSize: Integer;
      AFontColor: TColor; AFontEffect: TFontStyles; Shadow: Boolean;
      OffsetX, OffsetY: Integer): TFontLabel;
    {* 增加一个新的字体标签}
    function IndexOf(const Name: string): Integer;
    {* 根据标签名查找子项索引号}
    procedure Check(var AText: string; AFont: TFont; AEffect: TAAEffect);
    {* 检查可能带字体标签的字符串。
     |<BR> 如果找到相应的标签，删除字符串中的标签（包含<>标记），并用该标签
       定义的Font和Effect属性设置参数中的对应属性}
    property Items[Index: Integer]: TFontLabel read GetItem write SetItem; default;
    {* 字体标签项数组属性}
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    {* 属性变更通知}
  end;

{ TUserLabel }

  TGetTextEvent = procedure(Sender: TUserLabel; var Text: string) of object;
  {* 取用户标签所对应的文本事件
   |<PRE>
     Sender: TUserLabel  - 产生该事件的对象
     Text: string        - 由用户返回该标签对应的文本，变量参数
   |</PRE>}
  TLabelStyle = (lsLeftJustify, lsCenter, lsRightJustify, lsRegOwner,
    lsRegOrganization, lsAppTitle, lsDate, lsTime, lsCustom);
  {* 用户标签类型，分对齐控制标签和文本标签，文本标签在运行时被指定的文本取代：
   |<PRE>
     lsLeftJustify      - 左对齐标签，不可见控制标签，决定文本对齐方式
     lsCenter           - 中心对齐标签，不可见控制标签，决定文本对齐方式
     lsRightJustify     - 右对齐标签，不可见控制标签，决定文本对齐方式
     lsRegOwner         - 注册表中用户名标签，系统定义标签
     lsRegOrganization  - 注册表中组织名标签，系统定义标签（NT下无效）
     lsAppTitle         - 应用程序标题标签，系统定义标签
     lsDate             - 当前日期标签，系统定义标签
     lsTime             - 当前时间标签，系统定义标签
     lsCustom           - 用户自定义标签类型
   |</PRE>}

  TUserLabel = class(TCollectionItem)
  {* 用户文本标签列表项类，TUserLabels的子项，一般不需要用户直接创建}
  private
    FName: string;
    FText: string;
    FOnGetText: TGetTextEvent;
    FStyle: TLabelStyle;
    function GetUserLabels: TUserLabels;
    procedure Changed;
    procedure SetName(const Value: string);
    procedure SetText(const Value: string);
    function GetText: string;
    procedure SetStyle(const Value: TLabelStyle);
    function IsTextStored: Boolean;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    {* 类构造器}
    property UserLabels: TUserLabels read GetUserLabels;
    {* 所有者}
  published
    property Name: string read FName write SetName;
    {* 用户标签名}
    property Text: string read GetText write SetText stored IsTextStored;
    {* 标签所对应的文本，运行期显示文本中的标签用该值代替}
    property Style: TLabelStyle read FStyle write SetStyle default lsCustom;
    {* 标签类型}
    property OnGetText: TGetTextEvent read FOnGetText write FOnGetText;
    {* 取用户标签所对应的文本事件，对系统标签也有效}
  end;

{ TUserLabels }

  TUserLabels = class(TOwnedCollection)
  {* 用户标签列表类，定义了在文本类控件中可使用的用户标签集，一般不需要用户直接创建}
  private
    RegOwner: string;
    RegOrganization: string;
    FOnChanged: TNotifyEvent;
    function GetItem(Index: Integer): TUserLabel;
    procedure SetItem(Index: Integer; const Value: TUserLabel);
  protected
    procedure Changed;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TComponent);
    {* 类构造器}
    function AddItem(AName: string; AText: string; AStyle: TLabelStyle): TUserLabel;
    {* 增加一个新的用户标签}
    function IndexOf(const Name: string): Integer;
    {* 根据标签名查找子项索引}
    procedure Check(var AText: string; var Align: TAlignment);
    {* 检查可能带文本标签的字符串。
     |<BR> 如果找到相应的标签，将文本中的标签（包含<>符号）用标签的Text属性取代，
       同时，还将调用标签的OnGetText事件。如果是对齐标签，将设置参数中的Align属性。}
    property Items[Index: Integer]: TUserLabel read GetItem write SetItem; default;
    {* 用户标签项数组属性}
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    {* 属性变更通知}
  end;

{ TPackParam }

  TPackParam = class(TPersistent)
  {* 打包的参数属性类}
  private
    FOwner: TControl;
  protected
    property Owner: TControl read FOwner;
  public
    constructor Create(AOwner: TControl); virtual;
    {* 类构造器}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
  end;

{ TDrag }

  TDrag = class(TPackParam)
  {* 打包的拖放相关属性类}
  private
    function GetDragCursor: TCursor;
    function GetDragKind: TDragKind;
    function GetDragMode: TDragMode;
    procedure SetDragCursor(const Value: TCursor);
    procedure SetDragKind(const Value: TDragKind);
    procedure SetDragMode(const Value: TDragMode);
  published
    property DragKind: TDragKind read GetDragKind write SetDragKind default dkDrag;
    {* 拖放类型，同TControl中定义}
    property DragCursor: TCursor read GetDragCursor write SetDragCursor default crDrag;
    {* 拖放光标，同TControl中定义}
    property DragMode: TDragMode read GetDragMode write SetDragMode default dmManual;
    {* 拖放模式，同TControl中定义}
  end;

{ TParentEffect }

  TParentEffect = class(TPackParam)
  {* 打包的父控件影响相关属性类}
  private
    function GetParentBiDiMode: Boolean;
    function GetParentColor: Boolean;
    function GetParentFont: Boolean;
    function GetParentShowHint: Boolean;
    procedure SetParentBiDiMode(const Value: Boolean);
    procedure SetParentColor(const Value: Boolean);
    procedure SetParentFont(const Value: Boolean);
    procedure SetParentShowHint(const Value: Boolean);
  protected
    property ParentBiDiMode: Boolean read GetParentBiDiMode write SetParentBiDiMode
      default True;
  published
    property ParentColor: Boolean read GetParentColor write SetParentColor default
      True;
    {* 使用父控件的颜色，同TControl中定义}
    property ParentFont: Boolean read GetParentFont write SetParentFont default True;
    {* 使用父控件的字体，同TControl中定义}
    property ParentShowHint: Boolean read GetParentShowHint write SetParentShowHint
      default True;
    {* 使用父控件的提示显示设置，同TControl中定义}
  end;

{ TTimerThread }

  TTimerEx = class;

  TTimerThread = class(TThread)
  private
    FOwner: TTimerEx;
    FInterval: WORD;
    FStop: THandle;
  protected
    constructor Create(CreateSuspended: Boolean); virtual;
    procedure Execute; override;
  end;

{ TTimerEx }

  TTimerQuality = (tqHighest, tqHigh, tqLow);
  {* 高精度定时器定时精度枚举型
   |<PRE>
     tqHighest  - 最高精度，使用高优先级的线程进行定时
     tqHigh     - 高精度，使用普通优先级的线程进行定时
     tqLow      - 低精度，内部使用Timer进行定时，在9X下精度为55ms，NT下为10ms
   |</PRE>}

  TTimerEx = class(TComponent)
  {* 高精度定时器组件，允许使用线程方式定时来提高定时器精度，主要用于动态组件中。
   <BR> 用户也可在其它地方使用，使用方法同普通的TTimer，只要根据需要设置Quality即可}
  private
    FOnTimer: TNotifyEvent;
    FQuality: TTimerQuality;
    FEnabled: Boolean;
    FInterval: WORD;
    FTimerThread: TTimerThread;
    FTimer: TTimer;
    procedure DoTimer;
    procedure OnTimerTimer(Sender: TObject);
    procedure CreateTimer;
    procedure CreateTimerThread;
    procedure FreeTimer;
    procedure FreeTimerThread;
    procedure SetEnabled(Value: Boolean);
    procedure SetInterval(Value: WORD);
    procedure SetQuality(const Value: TTimerQuality);
  public
    constructor Create(AOwner: TComponent); override;
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
  published
    property Enabled: Boolean read FEnabled write SetEnabled;
    {* 是否允许定时器工作，功能同TTimer}
    property Interval: WORD read FInterval write SetInterval
      default 1000;
    {* 定时间隔，功能同TTimer}
    property Quality: TTimerQuality read FQuality write SetQuality;
    {* 定时精度}
    property OnTimer: TNotifyEvent read FOnTimer write FOnTimer;
    {* 定时事件}
  end;

{ TCustomParam }

  TBackGroundMode = (bmTiled, bmStretched, bmCenter, bmNormal);
  {* 背景图像显示模式
   |<PRE>
     bmTiled            - 平铺显示
     bmStretched        - 自动缩放显示
     bmCenter           - 在中心位置显示
     bmNormal           - 在左上角显示
   |</PRE>}

  TCustomParam = class(TNotifyClass)
  {* 可定制的平滑字体控件参数基类，一般不需要用户直接创建}
  private
    FAlignment: TAlignment;
    FWordWrap: Boolean;
    FTransparent: Boolean;
    FLayout: TTextLayout;
    FOwner: TAAGraphicControl;
    FBackGround: TPicture;
    FBackGroundMode: TBackGroundMode;

    procedure BackGroundChanged(Sender: TObject);
    procedure SetAlignment(const Value: TAlignment);
    procedure SetLayout(const Value: TTextLayout);
    procedure SetTransparent(const Value: Boolean);
    procedure SetWordWrap(const Value: Boolean);
    procedure SetQuality(const Value: TAAQuality);
    procedure SetFontEffect(const Value: TAAEffect);
    function GetQuality: TAAQuality;
    function GetFontEffect: TAAEffect;
    function GetColor: TColor;
    function GetFont: TFont;
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetBackGround(const Value: TPicture);
    procedure SetBackGroundMode(const Value: TBackGroundMode);
    function IsColorStroed: Boolean;
  protected
    function IsBackEmpty: Boolean;
    property Owner: TAAGraphicControl read FOwner;
    property Font: TFont read GetFont write SetFont;
    {* 控件字体}
    property Quality: TAAQuality read GetQuality write SetQuality default aqNormal;
    {* 平滑字体显示精度}
    property Alignment: TAlignment read FAlignment write SetAlignment
      default taLeftJustify;
    {* 文本对齐方式}
    property Layout: TTextLayout read FLayout write SetLayout default tlTop;
    {* 文本垂直方向对齐方式}
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    {* 文本是否自动换行}
    property Transparent: Boolean read FTransparent write SetTransparent
      default False;
    {* 控件是否透明}
    property FontEffect: TAAEffect read GetFontEffect write SetFontEffect;
    {* 平滑特效字体属性}
    property BackGround: TPicture read FBackGround write SetBackGround;
    {* 控件背景图像}
    property BackGroundMode: TBackGroundMode read FBackGroundMode
      write SetBackGroundMode default bmCenter;
    {* 控件背景图像显示模式}
    property BackColor: TColor read GetColor write SetColor stored IsColorStroed;
    {* 控件背景颜色}
  public
    constructor Create(AOwner: TAAGraphicControl; ChangedProc: TNotifyEvent);
      reintroduce; virtual;
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
  end;

{ TCustomTextParam }

  TLabelEffect = (leOnlyALine, leUntilNextLabel);
  {* 标签作用范围类型
   |<PRE>
     leOnlyALine        - 字体、控制标签仅在当前行有效，无标签的行字体、对齐等由默认值决定
     leUntilNextLabel   - 标签所对应的参数影响当前行和后续行，直到遇到下一标签为止
   |</PRE>}
  TRowPitch = -100..150;
  {* 行间隔类型，单位为字体高度的百分比，允许为负以产生特殊效果}

  TCustomTextParam = class(TCustomParam)
  {* 可定制的平滑字体文本类控件参数基类，一般不需要用户直接创建}
  private
    FLines: TStrings;
    FLabelEffect: TLabelEffect;
    FRowPitch: TRowPitch;
    FFontEffect: TAAEffect;

    procedure LinesChanged(Sender: TObject);
    procedure SetLines(const Value: TStrings);
    procedure SetLabelEffect(const Value: TLabelEffect);
    procedure SetRowPitch(const Value: TRowPitch);
    procedure SetFontEffect(const Value: TAAEffect);
  protected
    function IsLinesStored: Boolean; virtual;
    property Lines: TStrings read FLines write SetLines stored IsLinesStored;
    {* 控件文本内容}
    property RowPitch: TRowPitch read FRowPitch write SetRowPitch default 20;
    {* 文本行间距}
    property LabelEffect: TLabelEffect read FLabelEffect write SetLabelEffect
      default leUntilNextLabel;
    {* 文本中字体、控制标签的作用范围}
    property FontEffect: TAAEffect read FFontEffect write SetFontEffect;
    {* 平滑特效字体属性}
  public
    constructor Create(AOwner: TAAGraphicControl; ChangedProc: TNotifyEvent);
      override;
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
    procedure Assign(Source: TPersistent); override;
    {* 对象赋值方法}
  end;

{ TAAGraphicControl }

  TProgress = 0..csMaxProgress;

  TAAGraphicControl = class(TGraphicControl)
  {* 平滑字体控件基类，所有平滑字体控件由该基类派生而来，一般不需要用户直接创建
   |<BR> 如果用户需要编写自己的平滑字体控件，可仔细分析该基类源码}
  private
    { Private declarations }
{$IFNDEF COMPILER6_UP}
    FAutoSize: Boolean;
{$ENDIF}
    FAAFont: TAAFontEx;
    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    FAutoUpdate: Boolean;
    FDrag: TDrag;
    FParentEffect: TParentEffect;
    FUpdateCount: Integer;
    FBorder: TBorderWidth;
    FChangeCount: Integer;
    Inited: Boolean;
    Drawing: Boolean;
    AHeight: Integer;
    AWidth: Integer;

    procedure SetBorder(const Value: TBorderWidth);
    procedure SetDrag(const Value: TDrag);
    procedure SetParentEffect(const Value: TParentEffect);
    function GetWrapText(const Line, BreakStr: string;
      BreakChars: TSysCharSet; MaxCol: Integer): string;
    procedure SetAutoUpdate(const Value: Boolean);
  protected
    { Protected declarations }
{$IFDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); override;
{$ELSE}
    procedure SetAutoSize(const Value: Boolean); virtual;
{$ENDIF}
    procedure OnEffectChanged(Sender: TObject);
    procedure CopyParentImage(Dest: TCanvas);
    procedure WrapText(const S: string; Strs: TStrings; Col: Integer);
    procedure Blend(DesBmp, BkBmp, ForeBmp: TBitmap; AProgress: TProgress);
    procedure DrawTiled(Canvas: TCanvas; Rect: TRect; G: TGraphic);
    procedure DrawBackGround(Canvas: TCanvas; Rect: TRect; G: TGraphic;
      Mode: TBackGroundMode);
    procedure WndProc(var message: TMessage); override;
    procedure PaintCanvas; virtual;
    procedure Paint; override;
    procedure Loaded; override;
    procedure LoadedEx; virtual;
    procedure Reset; virtual;
    procedure Resize; override;
    property UpdateCount: Integer read FUpdateCount;
    property ChangeCount: Integer read FChangeCount;
    property AAFont: TAAFontEx read FAAFont;
{$IFDEF COMPILER6_UP}
    property AutoSize default True;
{$ELSE}
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
{$ENDIF}
    property AutoUpdate: Boolean read FAutoUpdate write SetAutoUpdate default True;
    property Border: TBorderWidth read FBorder write SetBorder default 0;
    {* 控件边界保留宽度}
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
    property Canvas;
    {* 控件画布}
    procedure BeginUpdate;
    {* 开始更新，调用该方法后，对控件属性的更改不会导致控件重绘，建议在批量修改
       控件时使用。
     |<BR> 注意该方法必须与EndUpate成对使用。}
    procedure EndUpdate;
    {* 结束更新，见BeginUpdate。用户结束更新后通常还应调用Changed方法通知控件重绘。}
    procedure Changed;
    {* 通知控件属性已变更，要求控件重绘}
  published
    { Published declarations }
    property Drag: TDrag read FDrag write SetDrag;
    {* 拖动相关属性打包}
    property ParentEffect: TParentEffect read FParentEffect write SetParentEffect;
    {* 父控件影响相关属性打包}
    property Align;
    property Anchors;
    property Constraints;
    property Enabled;
    property ShowHint;
    property Hint;
    property PopupMenu;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    {* 鼠标移入控件内部事件}
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    {* 鼠标移出控件内部事件}
    property OnStartDock;
    property OnStartDrag;
  end;

{ TAACustomText }

  TAACustomText = class(TAAGraphicControl)
  {* 平滑字体文本类控件基类，所有使用多行文本的平滑字体控件由该基类派生而来，
     一般不需要用户直接创建。
   |<BR> 如果用户需要编写自己的平滑字体控件，可分析该基类源码}
  private
    { Private declarations }
    FFonts: TFontLabels;
    FOnTextReady: TNotifyEvent;
    FOnComplete: TNotifyEvent;
    FOnPainted: TNotifyEvent;
    FLabels: TUserLabels;
    FLabelsInited: Boolean;
    FFontsInited: Boolean;
    procedure SetFonts(const Value: TFontLabels);
    procedure SetLabels(const Value: TUserLabels);
  protected
    { Protected declarations }
    procedure CreateDefLabels; virtual;
    procedure CreateDefFonts; virtual;
    procedure CreateDefault;
    function UseDefaultLabels: Boolean; virtual;
    procedure LoadedEx; override;
    procedure OnLabelChanged(Sender: TObject);
    property OnComplete: TNotifyEvent read FOnComplete write FOnComplete;
    property OnTextReady: TNotifyEvent read FOnTextReady write FOnTextReady;
    property OnPainted: TNotifyEvent read FOnPainted write FOnPainted;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    {* 类构造器}
    destructor Destroy; override;
    {* 类析构器}
  published
    { Published declarations }
    property Fonts: TFontLabels read FFonts write SetFonts;
    {* 字体标签属性}
    property Labels: TUserLabels read FLabels write SetLabels;
    {* 用户标签属性}
  end;

var
  HSLRange: Integer = 240;
  {* HSL整数型颜色的范围值}

//HSL颜色与RGB色转换函数
function HSLtoRGB(H, S, L: Double): TColor;
{* HSL颜色转换为RGB颜色
 |<PRE>
   H, S, L: Double      - 分别为色调、饱和度、亮度分量，为"0"到"1"之间的小数
   Result: TColor       - 返回RGB颜色值
 |</PRE>}
function HSLRangeToRGB(H, S, L: Integer): TColor;
{* HSL颜色转换为RGB颜色
 |<PRE>
   H, S, L: Integer     - 分别为色调、饱和度、亮度分量，0..240
   Result: TColor       - 返回RGB颜色值
 |</PRE>}
procedure RGBtoHSL(RGB: TColor; var H, S, L: Double);
{* RGB颜色转换为HSL颜色
 |<PRE>
   Color: TColor        - RGB颜色值
   H, S, L: Integer     - 输出分别为色调、饱和度、亮度分量，为"0"到"1"之间的小数
 |</PRE>}
procedure RGBtoHSLRange(RGB: TColor; var H, S, L: Integer);
{* RGB颜色转换为HSL颜色
 |<PRE>
   Color: TColor        - RGB颜色值
   H, S, L: Integer     - 输出分别为色调、饱和度、亮度分量，0..240
 |</PRE>}

implementation

{$R-}

const
  ItalicAdjust = 0.3;                   //斜体字宽度校正系数
  SDuplicateString = 'Duplicate string!';

function HSLtoRGB(H, S, L: Double): TColor;
var
  M1, M2: Double;

  function HueToColourValue(Hue: Double): Byte;
  var
    V: Double;
  begin
    if Hue < 0 then
      Hue := Hue + 1
    else if Hue > 1 then
      Hue := Hue - 1;
    if 6 * Hue < 1 then
      V := M1 + (M2 - M1) * Hue * 6
    else if 2 * Hue < 1 then
      V := M2
    else if 3 * Hue < 2 then
      V := M1 + (M2 - M1) * (2 / 3 - Hue) * 6
    else
      V := M1;
    Result := Round(255 * V)
  end;
var
  R, G, B: Byte;
begin
  if S = 0 then
  begin
    R := Round(255 * L);
    G := R;
    B := R
  end
  else
  begin
    if L <= 0.5 then
      M2 := L * (1 + S)
    else
      M2 := L + S - L * S;
    M1 := 2 * L - M2;
    R := HueToColourValue(H + 1 / 3);
    G := HueToColourValue(H);
    B := HueToColourValue(H - 1 / 3)
  end;
  Result := RGB(R, G, B)
end;

function HSLRangeToRGB(H, S, L: Integer): TColor;
begin
  Result := HSLtoRGB(H / (HSLRange - 1), S / HSLRange, L / HSLRange)
end;

procedure RGBtoHSL(RGB: TColor; var H, S, L: Double);
  function Max(a, b: Double): Double;
  begin
    if a > b then
      Result := a
    else
      Result := b
  end;
  function Min(a, b: Double): Double;
  begin
    if a < b then
      Result := a
    else
      Result := b
  end;
var
  R, G, B, D, Cmax, Cmin: Double;
begin
  R := GetRValue(RGB) / 255;
  G := GetGValue(RGB) / 255;
  B := GetBValue(RGB) / 255;
  Cmax := Max(R, Max(G, B));
  Cmin := Min(R, Min(G, B));
  L := (Cmax + Cmin) / 2;
  if Cmax = Cmin then
  begin
    H := 0;
    S := 0
  end
  else
  begin
    D := Cmax - Cmin;
    if L < 0.5 then
      S := D / (Cmax + Cmin)
    else
      S := D / (2 - Cmax - Cmin);
    if R = Cmax then
      H := (G - B) / D
    else if G = Cmax then
      H := 2 + (B - R) / D
    else
      H := 4 + (R - G) / D;
    H := H / 6;
    if H < 0 then
      H := H + 1
  end
end;

procedure RGBtoHSLRange(RGB: TColor; var H, S, L: Integer);
var
  Hd, Sd, Ld: Double;
begin
  RGBtoHSL(RGB, Hd, Sd, Ld);
  H := Round(Hd * (HSLRange - 1));
  S := Round(Sd * HSLRange);
  L := Round(Ld * HSLRange);
end;

type
  TLogPal = record
    lpal: TLogPalette;
    dummy: array[0..255] of TPaletteEntry;
  end;

var
  HGrayPal: HPALETTE = 0;
  LogPal: TLogPal;

//初始化灰度位图
procedure InitGrayPal;
var
  i: Integer;
begin
  LogPal.lpal.palVersion := $300;
  LogPal.lpal.palNumEntries := 256;
  for i := 0 to 255 do
  begin
    LogPal.dummy[i].peRed := i;
    LogPal.dummy[i].peGreen := i;
    LogPal.dummy[i].peBlue := i;
    LogPal.dummy[i].peFlags := 0;
  end;
  HGrayPal := CreatePalette(LogPal.lpal);
end;

{ TAAMask }

//--------------------------------------------------------//
//平滑字体蒙板类                                          //
//--------------------------------------------------------//

//赋值
procedure TAAMask.Assign(Source: TPersistent);
begin
  if Source is TAAMask then
  begin
    FWidth := TAAMask(Source).Width;
    FHeight := TAAMask(Source).Height;
    Quality := TAAMask(Source).Quality;
    BytesLineGray := TAAMask(Source).BytesLineGray;
    BytesLineMask := TAAMask(Source).BytesLineMask;
    ReAllocMem(FpMaskBuff, FHeight * BytesLineMask);
    CopyMemory(FpMaskBuff, TAAMask(Source).FpMaskBuff, FHeight * BytesLineMask);
  end
  else
  begin
    inherited Assign(Source);
  end;
end;

//初始化
constructor TAAMask.Create(AOwner: TAAFont);
begin
  AAFont := AOwner;
  FpMaskBuff := nil;
  Quality := aqNormal;
end;

//释放
destructor TAAMask.Destroy;
begin
  FreeGrayBmp;
  FreeMem(FpMaskBuff);
  inherited;
end;

procedure TAAMask.InitGrayBmp;
begin
  if GrayBmp = nil then
  begin
    GrayBmp := TBitmap.Create;
    GrayBmp.PixelFormat := pf8bit;
    GrayBmp.Canvas.Brush.Style := bsSolid;
    GrayBmp.Canvas.Brush.Color := clBlack;
    GrayBmp.Palette := CopyPalette(HGrayPal);
  end;
end;

procedure TAAMask.FreeGrayBmp;
var
  P: HPALETTE;
begin
  if GrayBmp <> nil then
  begin
    P := GrayBmp.Palette;
    GrayBmp.Palette := 0;
    FreeAndNil(GrayBmp);
    DeleteObject(P);
  end;
end;

//绘制平滑字体蒙板
procedure TAAMask.DrawMaskEx(Text: string; Extend: TSize; Point: TPoint);
var
  i, j: Integer;
  pS1, pS2, pS3, pS4: PByteArray;
  pDes: PByteArray;
  x, y: Integer;
  P: TPoint;
  LogFont: TLogFont;
  Beta: Double;
  TextSize: TSize;
  R: TRect;
begin
  if (AAFont = nil) or (AAFont.Canvas = nil) then
    Exit;

  InitGrayBmp;
  FWidth := Extend.cx;                  //大小
  FHeight := Extend.cy;
  if GrayBmp.Width < Width * Scale then //放大
    GrayBmp.Width := Width * Scale;
  if GrayBmp.Height < Height * Scale then
    GrayBmp.Height := Height * Scale;

  GetObject(AAFont.Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
  with LogFont do
  begin
    lfHeight := lfHeight * Scale;
    lfWidth := lfWidth * Scale;
    Beta := lfEscapement * Pi / 1800;
  end;
  GrayBmp.Canvas.Font.Handle := CreateFontIndirect(LogFont);
  GrayBmp.Canvas.Font.Color := clWhite;
  FillRect(GrayBmp.Canvas.Handle, Bounds(0, 0, GrayBmp.Width, GrayBmp.Height), 0);
  x := Point.x * Scale;
  y := Point.y * Scale;
  if Beta <> 0 then      // 考虑字体旋转
  begin
    TextSize := TextExtentEx(Text, P);
    Inc(x, P.x * Scale);
    Inc(y, P.y * Scale);
  end;
  R := Bounds(0, 0, GrayBmp.Width, GrayBmp.Height);
  Windows.TextOut(GrayBmp.Canvas.Handle, x, y, PChar(Text), Length(Text));

  BytesLineGray := (GrayBmp.Width + 3) div 4 * 4; //扫描线宽度
  BytesLineMask := (Width + 3) div 4 * 4;
  ReAllocMem(FpMaskBuff, BytesLineMask * Height);

  pS1 := GrayBmp.ScanLine[0];           //源灰度图
  pS2 := PByteArray(Integer(pS1) - BytesLineGray);
  pS3 := PByteArray(Integer(pS2) - BytesLineGray);
  pS4 := PByteArray(Integer(pS3) - BytesLineGray);
  pDes := PByteArray(Integer(pMaskBuff) + (Height - 1) * BytesLineMask);
    //目标灰度为源矩形块的平均值
  case Quality of
    aqHigh:
      begin                             //高精度4X4采样
        for i := 0 to Height - 1 do
        begin
          for j := 0 to Width - 1 do
          begin
            x := j * 4;
            pDes^[j] :=
              (pS1^[x] + pS1^[x + 1] + pS1^[x + 2] + pS1^[x + 3] +
              pS2^[x] + pS2^[x + 1] + pS2^[x + 2] + pS2^[x + 3] +
              pS3^[x] + pS3^[x + 1] + pS3^[x + 2] + pS3^[x + 3] +
              pS4^[x] + pS4^[x + 1] + pS4^[x + 2] + pS4^[x + 3]) shr 4;
          end;
          pS1 := PByteArray(Integer(pS4) - BytesLineGray);
          pS2 := PByteArray(Integer(pS1) - BytesLineGray);
          pS3 := PByteArray(Integer(pS2) - BytesLineGray);
          pS4 := PByteArray(Integer(pS3) - BytesLineGray);
          pDes := PByteArray(Integer(pDes) - BytesLineMask);
        end;
      end;
    aqNormal:
      begin                             //普通精度3X3采样
        for i := 0 to Height - 1 do
        begin
          for j := 0 to Width - 1 do
          begin
            x := j * 3;
            pDes^[j] :=
              (pS1^[x] + pS1^[x + 1] + pS1^[x + 2] shr 1 +
              pS2^[x] + pS2^[x + 1] + pS2^[x + 2] +
              pS3^[x] shr 1 + pS3^[x + 1] + pS3^[x + 2]) shr 3;
          end;
          pS1 := PByteArray(Integer(pS3) - BytesLineGray);
          pS2 := PByteArray(Integer(pS1) - BytesLineGray);
          pS3 := PByteArray(Integer(pS2) - BytesLineGray);
          pDes := PByteArray(Integer(pDes) - BytesLineMask);
        end;
      end;
    aqLow:
      begin                             //低精度2X2采样
        for i := 0 to Height - 1 do
        begin
          for j := 0 to Width - 1 do
          begin
            x := j * 2;
            pDes^[j] :=
              (pS1^[x] + pS1^[x + 1] +
              pS2^[x] + pS2^[x + 1]) shr 2;
          end;
          pS1 := PByteArray(Integer(pS2) - BytesLineGray);
          pS2 := PByteArray(Integer(pS1) - BytesLineGray);
          pDes := PByteArray(Integer(pDes) - BytesLineMask);
        end;
      end;
    aqNone:
      begin                             //无平滑效果
        for i := 0 to Height - 1 do
        begin
          CopyMemory(pDes, pS1, Width);
          pS1 := PByteArray(Integer(pS1) - BytesLineGray);
          pDes := PByteArray(Integer(pDes) - BytesLineMask);
        end;
      end;
  end;
  FreeGrayBmp;
end;

//绘制平滑字体
procedure TAAMask.DrawMask(Text: string);
begin
  DrawMaskEx(Text, TextExtent(Text), Point(0, 0));
end;

//边缘检测
procedure TAAMask.Outline;
var
  x, y: Integer;
  s1, s2, s3, s4, Sum: Integer;
  pTempBuff: PByteArray;
  pDes: PByteArray;
  pUp, pMiddle, pDown: PByteArray;      //卷积用指针
begin
  GetMem(pTempBuff, BytesLineMask * Height); //临时缓冲区
  try
    CopyMemory(pTempBuff, pMaskBuff, BytesLineMask * Height);
    for y := 1 to Height - 2 do
    begin
      pUp := ScanLine(y - 1, pTempBuff);
      pMiddle := ScanLine(y, pTempBuff);
      pDown := ScanLine(y + 1, pTempBuff);
      pDes := ScanLine(y);
      for x := 1 to Width - 2 do
      begin
        s1 := Abs(pDown^[x] - pUp^[x]);
        s2 := Abs(pMiddle^[x + 1] - pMiddle^[x - 1]);
        s3 := Abs(pDown^[x - 1] - pUp^[x + 1]);
        s4 := Abs(pDown^[x + 1] - pUp^[x - 1]);
        Sum := (s1 + s2 + s3 + s4) shr 2;
        if Sum > 255 then
          pDes^[x] := 255
        else
          pDes^[x] := Sum;
      end;
    end;
  finally
    FreeMem(pTempBuff);
  end;
end;

//字体模糊
procedure TAAMask.Blur(Blur: TBlurStrength);
type
  TLine = array[0..4] of Integer;
const
  csLine: array[0..4] of TLine = (
    (0, 0, 0, 1, 2), (-1, -1, 0, 1, 2), (-2, -1, 0, 1, 2),
    (-2, -1, 0, 1, 1), (-2, -1, 0, 0, 0)); //边界处理常量
var
  pTempBuff: PByteArray;
  pSour: array[0..4] of PByteArray;
  pDes: PByteArray;
  xLine: TLine;
  yLine: TLine;
  x, y, i: Integer;
  Sum: Integer;
  ABlur: Byte;
begin
  GetMem(pTempBuff, BytesLineMask * Height); //临时缓冲区
  try
    CopyMemory(pTempBuff, pMaskBuff, BytesLineMask * Height);
    ABlur := Round(Blur * 255 / 100);
    for y := 0 to Height - 1 do         //边界处理
    begin
      if y = 0 then
        yLine := csLine[0]
      else if y = 1 then
        yLine := csLine[1]
      else if y = Height - 2 then
        yLine := csLine[3]
      else if y = Height - 1 then
        yLine := csLine[4]
      else
        yLine := csLine[2];
      for i := 0 to 4 do
        pSour[i] := ScanLine(yLine[i] + y, pTempBuff);
      pDes := ScanLine(y, pMaskBuff);
      for x := 0 to Width - 1 do        //边界处理
      begin
        if x = 0 then
          xLine := csLine[0]
        else if x = 1 then
          xLine := csLine[1]
        else if x = Width - 2 then
          xLine := csLine[3]
        else if x = Width - 1 then
          xLine := csLine[4]
        else
          xLine := csLine[2];
        Sum := 0;
        for i := 0 to 4 do              //5X5均值处理
          Inc(Sum, pSour[i]^[x + xLine[0]] + pSour[i]^[x + xLine[1]] +
            pSour[i]^[x + xLine[2]] + pSour[i]^[x + xLine[3]] +
            pSour[i]^[x + xLine[3]]);
        if ABlur = 255 then             //模糊度
          pDes^[x] := Round(Sum / 25)
        else
          pDes^[x] := (Round(Sum / 25) - pDes^[x]) * ABlur shr 8 + pDes^[x];
      end;
    end;
  finally
    FreeMem(pTempBuff);
  end;
end;

// 喷溅效果
procedure TAAMask.Spray(Amount: Integer);
var
  r, x, y, ax, ay: Integer;
  pDes: PByteArray;
begin
  pDes := ScanLine(0);
  for y := 0 to FHeight - 1 do
  begin
    for x := 0 to FWidth - 1 do
    begin
      r := Random(Amount + 1);
      ax := x + r - Random(r * 2);
      if ax < 0 then
        ax := 0
      else if ax > FWidth - 1 then
        ax := FWidth - 1;
      ay := y + r - Random(r * 2);
      if ay < 0 then
        ay := 0
      else if ay > FHeight - 1 then
        ay := FHeight - 1;
      pDes^[x] := PByteArray(ScanLine(ay))[ax];
    end;
    pDes := PByteArray(Integer(pDes) - BytesLineMask);
  end;
end;

//象素地址
function TAAMask.PixelAddr(x, y: Integer): Pointer;
begin
  if (x < 0) or (x > Width - 1) or (y < 0) or (y > Height - 1) then
    raise EInvalidPixel.Create('Invalid pixel!')
  else
    Result := Pointer(Integer(FpMaskBuff) + (Height - 1 + y) * BytesLineMask + x);
end;

//象素
function TAAMask.Pixel(x, y: Integer): Byte;
begin
  if (x < 0) or (x > Width - 1) or (y < 0) or (y > Height - 1) then
    raise EInvalidPixel.Create('Invalid pixel!')
  else
    Result := PByteArray(Integer(FpMaskBuff) + (Height - 1 + y) * BytesLineMask)[x];
end;

//扫描线地址
function TAAMask.ScanLine(Line: Integer): Pointer;
begin
  if (Line < 0) or (Line > Height - 1) then
    raise EInvalidLine.Create('Invalid line!')
  else
    Result := Pointer(Integer(FpMaskBuff) + (Height - 1 - Line) * BytesLineMask);
end;

function TAAMask.ScanLine(Line: Integer; pAData: PByteArray): PByteArray;
begin
  Result := PByteArray(Integer(pAData) + (Height - 1 - Line) * BytesLineMask);
end;

//设置精度
procedure TAAMask.SetQuality(const Value: TAAQuality);
begin
  FQuality := Value;
  case FQuality of
    aqHigh: Scale := 4;
    aqNormal: Scale := 3;
    aqLow: Scale := 2;
    aqNone: Scale := 1;
  else
    Scale := 1;
  end;
end;

function GetRotateSize(Size: TSize; Angle: Double; var StartPoint: TPoint): TSize;
var
  p1, p2, p3, p4: TPoint;
  cAngle, sAngle: Double;
  wCos, hCos, wSin, hSin: Double;
  SrcW2, SrcH2: Double;
  Rect: TRect;
begin
  sAngle := Sin(-Angle);
  cAngle := Cos(-Angle);

  // 计算目标顶点位置
  SrcW2 := Size.cx / 2;
  SrcH2 := Size.cy / 2;
  wCos := SrcW2 * cAngle;
  hCos := SrcH2 * cAngle;
  wSin := SrcW2 * sAngle;
  hSin := SrcH2 * sAngle;
  p1.x := Round(-wCos + hSin); // 左下
  p1.y := Round(-wSin - hCos);
  p2.x := Round(wCos + hSin); // 右下
  p2.y := Round(wSin - hCos);
  p3.x := Round(-wCos - hSin); // 左上
  p3.y := Round(-wSin + hCos);
  p4.x := Round(wCos - hSin); // 右上
  p4.y := Round(wSin + hCos);

  // 计算包含矩形
  Rect.Left := MinIntValue([p1.x, p2.x, p3.x, p4.x]);
  Rect.Right := MaxIntValue([p1.x, p2.x, p3.x, p4.x]);
  Rect.Top := MinIntValue([p1.y, p2.y, p3.y, p4.y]);
  Rect.Bottom := MaxIntValue([p1.y, p2.y, p3.y, p4.y]);
  
  Result.cx := Rect.Right - Rect.Left;
  Result.cy := Rect.Bottom - Rect.Top;
  StartPoint.x := p1.x + Result.cx div 2;
  StartPoint.y := p1.y + Result.cy div 2;
end;

//文本高、宽，旋转后起始位置
function TAAMask.TextExtentEx(s: string; var Point: TPoint): TSize;
var
  LogFont: TLogFont;
  TempFont, SaveFont: HFONT;
  DC: HDC;
  Beta: Double;
begin
  Result.cx := 0;
  Result.cy := 0;
  if (AAFont = nil) or (AAFont.Canvas = nil) then
    Exit;
  DC := GetDC(0);
  try
    GetObject(AAFont.Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
    with LogFont do
    begin
      lfHeight := lfHeight * Scale;
      lfWidth := lfWidth * Scale;
      Beta := lfEscapement * Pi / 1800;
    end;
    TempFont := CreateFontIndirect(LogFont);
    try
      SaveFont := SelectObject(DC, TempFont);
      GetTextExtentPoint32(DC, PChar(s), Length(s), Result);
      Result.cx := (Result.cx + Scale - 1) div Scale;
      Result.cy := (Result.cy + Scale - 1) div Scale;
      if (fsItalic in AAFont.Canvas.Font.Style) and (Length(s) > 0) then
        Result.cx := Result.cx + Round(Result.cx / Length(s) * ItalicAdjust);
      SelectObject(DC, SaveFont);
      if Beta <> 0 then
      begin
        Result := GetRotateSize(Result, Beta, Point);
      end;
    finally
      DeleteObject(TempFont);
    end;
  finally
    ReleaseDC(0, DC);
  end;
end;

//文本高、宽
function TAAMask.TextExtent(s: string): TSize;
var
  Point: TPoint;
begin
  Result := TextExtentEx(s, Point);
end;

//文本高度
function TAAMask.TextHeight(s: string): Integer;
begin
  Result := TextExtent(s).cy;
end;

//文本宽度
function TAAMask.TextWidth(s: string): Integer;
begin
  Result := TextExtent(s).cx;
end;

{ TAABlend }

//--------------------------------------------------------//
//前景背景蒙板混合类                                      //
//--------------------------------------------------------//

//初始化
constructor TAABlend.Create(AOwner: TAAFont);
begin
  AAFont := AOwner;
  FForeBmp := TBitmap.Create;
  FForeBmp.PixelFormat := pf24bit;
  RGBBmp := TBitmap.Create;
  RGBBmp.PixelFormat := pf24bit;
end;

//释放
destructor TAABlend.Destroy;
begin
  ForeBmp.Free;
  RGBBmp.Free;
  inherited;
end;

//赋值
procedure TAABlend.Assign(Source: TPersistent);
begin
  if Source is TAABlend then
    ForeBmp.Assign(TAABlend(Source).ForeBmp)
  else
    inherited Assign(Source);
end;

//文本按前景色与背景混合
procedure TAABlend.Blend(x, y: Integer; AColor: TColor; Alpha: TAlpha;
  Mask: TAAMask);
var
  r, b, g: Byte;
  AAlpha: DWORD;
  pMask: PByteArray;
  pRGB: PRGBArray;
  Weight: Byte;
  i, j: Integer;
  Color: TColor;
begin
  if (AAFont = nil) or (AAFont.Canvas = nil) then
    Exit;

  RGBBmp.Width := Mask.Width;
  RGBBmp.Height := Mask.Height;
  Color := ColorToRGB(AColor);          //实际前景色
  r := GetRValue(Color);                //色彩分量
  g := GetGValue(Color);
  b := GetBValue(Color);
  AAlpha := Alpha * $100 div 100;       //透明度
  RGBBmp.Canvas.Brush.Assign(AAFont.Canvas.Brush);
  if RGBBmp.Canvas.Brush.Style <> bsSolid then
    Bitblt(RGBBmp.Canvas.Handle, 0, 0, RGBBmp.Width, RGBBmp.Height,
      AAFont.Canvas.Handle, x, y, SRCCOPY) //透明
  else
    FillRect(RGBBmp.Canvas.Handle, Bounds(0, 0, RGBBmp.Width, RGBBmp.Height), 0);

  for j := 0 to RGBBmp.Height - 1 do
  begin
    pMask := Mask.ScanLine(j);
    pRGB := RGBBmp.ScanLine[j];
    for i := 0 to RGBBmp.Width - 1 do
    begin
      Weight := pMask^[i] * AAlpha shr 8; //混合系数
      if Weight <> 0 then
      begin
        if Weight = 255 then
        begin                           //前景色
          pRGB^[i].rgbtBlue := b;
          pRGB^[i].rgbtGreen := g;
          pRGB^[i].rgbtRed := r;
        end
        else
        begin                           //混合
          Inc(pRGB^[i].rgbtBlue, Weight * (b - pRGB^[i].rgbtBlue) shr 8);
          Inc(pRGB^[i].rgbtGreen, Weight * (g - pRGB^[i].rgbtGreen) shr 8);
          Inc(pRGB^[i].rgbtRed, Weight * (r - pRGB^[i].rgbtRed) shr 8);
        end;
      end;
    end;
  end;

  Bitblt(AAFont.Canvas.Handle, x, y, RGBBmp.Width, RGBBmp.Height,
    RGBBmp.Canvas.Handle, 0, 0, SRCCOPY); //输出
end;

//文本按纹理与背景混合
procedure TAABlend.BlendEx(x, y: Integer; Alpha: TAlpha; Mask: TAAMask);
var
  AAlpha: WORD;
  pMask: PByteArray;
  pRGB: PRGBArray;
  pFore: PRGBArray;
  Weight: Byte;
  i, j: Integer;
begin
  if (AAFont = nil) or (AAFont.Canvas = nil) then
    Exit;
  if (ForeBmp.Width <> Mask.Width) or (ForeBmp.Height <> Mask.Height)
    or (ForeBmp.PixelFormat <> pf24bit) then
  begin                                 //错误的纹理图
    raise EInvalidForeBmp.Create('Invalid foreground bitmap!');
    Exit;
  end;

  RGBBmp.Width := Mask.Width;
  RGBBmp.Height := Mask.Height;
  AAlpha := Alpha * $100 div 100;       //透明度
  RGBBmp.Canvas.Brush.Assign(AAFont.Canvas.Brush);
  if RGBBmp.Canvas.Brush.Style <> bsSolid then
    Bitblt(RGBBmp.Canvas.Handle, 0, 0, RGBBmp.Width, RGBBmp.Height,
      AAFont.Canvas.Handle, x, y, SRCCOPY) //透明
  else
    FillRect(RGBBmp.Canvas.Handle, Bounds(0, 0, RGBBmp.Width, RGBBmp.Height), 0);

  for j := 0 to RGBBmp.Height - 1 do
  begin
    pMask := Mask.ScanLine(j);
    pRGB := RGBBmp.ScanLine[j];
    pFore := ForeBmp.ScanLine[j];
    for i := 0 to RGBBmp.Width - 1 do
    begin
      Weight := pMask^[i] * AAlpha shr 8; //混合系数
      if Weight = 255 then
      begin
        pRGB^[i].rgbtBlue := pFore^[i].rgbtBlue;
        pRGB^[i].rgbtGreen := pFore^[i].rgbtGreen;
        pRGB^[i].rgbtRed := pFore^[i].rgbtRed;
      end
      else if Weight <> 0 then          //混合
      begin
        Inc(pRGB^[i].rgbtBlue, Weight * (pFore^[i].rgbtBlue - pRGB^[i].rgbtBlue) shr
          8);
        Inc(pRGB^[i].rgbtGreen, Weight * (pFore^[i].rgbtGreen - pRGB^[i].rgbtGreen) shr
          8);
        Inc(pRGB^[i].rgbtRed, Weight * (pFore^[i].rgbtRed - pRGB^[i].rgbtRed) shr 8);
      end;
    end;
  end;

  Bitblt(AAFont.Canvas.Handle, x, y, RGBBmp.Width, RGBBmp.Height,
    RGBBmp.Canvas.Handle, 0, 0, SRCCOPY); //输出
end;

//设置前景纹理图
procedure TAABlend.SetForeBmp(const Value: TBitmap);
begin
  FForeBmp.Assign(Value);
end;

{ TAAFont }

//--------------------------------------------------------//
//平滑字体类                                              //
//--------------------------------------------------------//

//初始化
constructor TAAFont.Create(ACanvas: TCanvas);
begin
  FCanvas := ACanvas;
  Mask := TAAMask.Create(Self);
  Blend := TAABlend.Create(Self);
end;

//释放
destructor TAAFont.Destroy;
begin
  Mask.Free;
  Blend.Free;
  inherited;
end;

//取显示精度
function TAAFont.GetQuality: TAAQuality;
begin
  Result := Mask.Quality;
end;

//设置显示精度
procedure TAAFont.SetQuality(const Value: TAAQuality);
begin
  Mask.Quality := Value;
end;

//文本高、宽
function TAAFont.TextExtent(s: string): TSize;
begin
  Result := Mask.TextExtent(s);
end;

//文本高度
function TAAFont.TextHeight(s: string): Integer;
begin
  Result := TextExtent(s).cy;
end;

//文本宽度
function TAAFont.TextWidth(s: string): Integer;
begin
  Result := TextExtent(s).cx;
end;

//平滑文本输出
procedure TAAFont.TextOut(x, y: Integer; s: string; Alpha: TAlpha;
  Blur: TBlurStrength);
begin
  if (Canvas = nil) or (s = '') then
    Exit;

  Mask.DrawMask(s);                     //创建字体蒙板
  if Blur > 0 then
    Mask.Blur(Blur);                    //模糊
  Blend.Blend(x, y, Canvas.Font.Color, Alpha, Mask); //与前景色混合
end;

{ TAAFontEx }

//--------------------------------------------------------//
//增强平滑字体类                                          //
//--------------------------------------------------------//

//初始化
constructor TAAFontEx.Create(ACanvas: TCanvas);
begin
  inherited Create(ACanvas);
  FEffect := TAAEffect.Create(nil);
end;

//释放
destructor TAAFontEx.Destroy;
begin
  FEffect.Free;
  inherited;
end;

//设置显示风格
procedure TAAFontEx.SetEffect(const Value: TAAEffect);
begin
  FEffect.Assign(Value);
end;

//计算阴影偏移
function TAAFontEx.GetShadowPoint: TPoint;
begin
  if Effect.Shadow.Enabled then
  begin
    if Effect.Shadow.OffsetX > 0 then
      Result.x := Effect.Shadow.OffsetX
    else
      Result.x := 0;
    if Effect.Shadow.OffsetY > 0 then
      Result.y := Effect.Shadow.OffsetY
    else
      Result.y := 0;
  end
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

//计算文本偏移
function TAAFontEx.GetTextPoint: TPoint;
begin
  if Effect.Shadow.Enabled then
  begin
    if Effect.Shadow.OffsetX < 0 then
      Result.x := Abs(Effect.Shadow.OffsetX)
    else
      Result.x := 0;
    if Effect.Shadow.OffsetY < 0 then
      Result.y := Abs(Effect.Shadow.OffsetY)
    else
      Result.y := 0;
  end
  else
  begin
    Result.x := 0;
    Result.y := 0;
  end;
end;

//文本高、宽
function TAAFontEx.TextExtent(s: string): TSize;
var
  LogFont: TLogFont;
  TempFont: HFONT;
  SaveFont: TFont;
begin
  if Effect.Angle <> 0 then
  begin
    GetObject(Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
    LogFont.lfEscapement := Effect.Angle * 10;
    SaveFont := TFont.Create;
    try
      SaveFont.Assign(Canvas.Font);
      TempFont := CreateFontIndirect(LogFont);
      Canvas.Font.Handle := TempFont;
      Result := inherited TextExtent(s);
      Canvas.Font.Assign(SaveFont);
      DeleteObject(TempFont);
    finally
      SaveFont.Free;
    end;
  end
  else
    Result := inherited TextExtent(s);
    
  if Effect.Shadow.Enabled then
  begin
    Inc(Result.cx, Abs(Effect.Shadow.OffsetX));
    Inc(Result.cy, Abs(Effect.Shadow.OffsetY));
  end;
end;

//创建渐变色前景
procedure TAAFontEx.CreateGradual;
var
  Buf, Dst: PRGBArray;
  BufLen, Len: Integer;
  SCol, ECol: TColor;
  sr, sb, sg: Byte;
  er, eb, eg: Byte;
  BufSize: Integer;
  i, j: Integer;
  Width, Height: Integer;
begin
  if (Canvas = nil) or not Effect.Gradual.Enabled then
    Exit;

  Height := Mask.Height;
  Width := Mask.Width;
  Blend.ForeBmp.Height := Height;
  Blend.ForeBmp.Width := Width;

  if Effect.Gradual.Style in [gsLeftToRight, gsRightToLeft, gsCenterToLR] then
    BufLen := Width                     // 缓冲区长度
  else
    BufLen := Height;
  if Effect.Gradual.Style in [gsCenterToLR, gsCenterToTB] then
    Len := (BufLen + 1) div 2           // 渐变带长度
  else
    Len := BufLen;
  BufSize := BufLen * 3;
  GetMem(Buf, BufSize);
  try
    // 创建渐变色带缓冲区
    if Effect.Gradual.Style in [gsLeftToRight, gsTopToBottom] then
    begin
      SCol := ColorToRGB(Effect.Gradual.StartColor);
      ECol := ColorToRGB(Effect.Gradual.EndColor);
    end
    else begin
      SCol := ColorToRGB(Effect.Gradual.EndColor);
      ECol := ColorToRGB(Effect.Gradual.StartColor);
    end;
    sr := GetRValue(SCol);              //起始色
    sg := GetGValue(SCol);
    sb := GetBValue(SCol);
    er := GetRValue(ECol);              //结束色
    eg := GetGValue(ECol);
    eb := GetBValue(ECol);
    for i := 0 to Len - 1 do
    begin
      Buf[i].rgbtRed := sr + (er - sr) * i div Len;
      Buf[i].rgbtGreen := sg + (eg - sg) * i div Len;
      Buf[i].rgbtBlue := sb + (eb - sb) * i div Len;
    end;

    if Effect.Gradual.Style in [gsCenterToLR, gsCenterToTB] then // 对称渐变
      for i := 0 to Len - 1 do
        Buf[BufLen - 1 - i] := Buf[i];

    if Effect.Gradual.Style in [gsLeftToRight, gsRightToLeft, gsCenterToLR] then
      for i := 0 to Height - 1 do  // 水平渐变
        Move(Buf[0], Blend.ForeBmp.ScanLine[i]^, BufSize)
    else                               
      for i := 0 to Height - 1 do  // 垂直渐变
      begin
        Dst := Blend.ForeBmp.ScanLine[i];
        for j := 0 to Width - 1 do
          Dst^[j] := Buf[i];
      end;
  finally
    FreeMem(Buf);
  end;
end;

//创建噪声前景图
procedure TAAFontEx.CreateNoiseBmp;
var
  pLine: PRGBArray;
  x, y: Integer;
  r, g, b: Byte;
  nr, ng, nb: Integer;
  Amount: Byte;
begin
  r := GetRValue(ColorToRGB(Canvas.Font.Color));
  g := GetGValue(ColorToRGB(Canvas.Font.Color));
  b := GetBValue(ColorToRGB(Canvas.Font.Color));
  Amount := Effect.Noise;

  Blend.ForeBmp.Height := Mask.Height;
  Blend.ForeBmp.Width := Mask.Width;

  for y := 0 to Blend.ForeBmp.Height - 1 do
  begin
    pLine := Blend.ForeBmp.ScanLine[y];
    for x := 0 to Blend.ForeBmp.Width - 1 do
    begin
      nr := r + Random(Amount) - Amount shr 1;
      ng := g + Random(Amount) - Amount shr 1;
      nb := b + Random(Amount) - Amount shr 1;
      if nr < 0 then
        nr := 0
      else if nr > 255 then
        nr := 255;
      if ng < 0 then
        ng := 0
      else if ng > 255 then
        ng := 255;
      if nb < 0 then
        nb := 0
      else if nb > 255 then
        nb := 255;
      pLine^[x].rgbtRed := nr;
      pLine^[x].rgbtGreen := ng;
      pLine^[x].rgbtBlue := nb;
    end;
  end;
end;

//增强平滑文本输出
procedure TAAFontEx.TextOut(x, y: Integer; s: string);
var
  TextPoint, ShadowPoint: TPoint;
  OldBrushStyle: TBrushStyle;
  ShadowMask: TAAMask;
  LogFont: TLogFont;
  TempFont: HFONT;
  SaveFont: TFont;
begin
  if (Canvas = nil) or (s = '') then
    Exit;

  TempFont := 0;
  SaveFont := nil;
  try
    if Effect.Angle <> 0 then
    begin
      SaveFont := TFont.Create;
      SaveFont.Assign(Canvas.Font);
      GetObject(Canvas.Font.Handle, SizeOf(TLogFont), @LogFont);
      LogFont.lfEscapement := Effect.Angle * 10;
      TempFont := CreateFontIndirect(LogFont);
      Canvas.Font.Handle := TempFont;
    end;

    if Effect.Shadow.Enabled then         //阴影计算
    begin
      TextPoint := GetTextPoint;
      ShadowPoint := GetShadowPoint;
      TextPoint.x := TextPoint.x + x;
      TextPoint.y := TextPoint.y + y;
      ShadowPoint.x := ShadowPoint.x + x;
      ShadowPoint.y := ShadowPoint.y + y;
    end
    else
    begin
      TextPoint := Point(x, y);
    end;

    Mask.DrawMask(s);                     //创建字体蒙板
    if Effect.Outline then
      Mask.Outline;
    if Effect.Spray > 0 then
      Mask.Spray(Effect.Spray);

    OldBrushStyle := Canvas.Brush.Style;
    if Effect.Shadow.Enabled then         //阴影处理
    begin
      ShadowMask := TAAMask.Create(Self);
      ShadowMask.Assign(Mask);            //阴影蒙板
      if Effect.Shadow.Blur > 0 then
        ShadowMask.Blur(Effect.Shadow.Blur); //阴影模糊
      Blend.Blend(ShadowPoint.x, ShadowPoint.y, Effect.Shadow.Color,
        Effect.Shadow.Alpha * Effect.Alpha div 100, ShadowMask);
      ShadowMask.Free;
      Canvas.Brush.Style := bsClear;      //透明
    end;

    if Effect.Blur > 0 then               //文本模糊
      Mask.Blur(Effect.Blur);

    if Effect.Texture.Enabled and Assigned(Effect.Texture.Picture.Graphic) and
      not Effect.Texture.Picture.Graphic.Empty then
    begin
      CreateForeBmp;                      //创建字体纹理图
      if Effect.Noise > 0 then
        AddNoise(Effect.Noise);
      Blend.BlendEx(TextPoint.x, TextPoint.y, Effect.Alpha, Mask);
    end
    else if Effect.Gradual.Enabled then
    begin                                 //创建渐变色前景图
      CreateGradual;
      if Effect.Noise > 0 then
        AddNoise(Effect.Noise);
      Blend.BlendEx(TextPoint.x, TextPoint.y, Effect.Alpha, Mask);
    end
    else
    begin                                 //混合输出
      if Effect.Noise > 0 then
      begin
        CreateNoiseBmp;
        Blend.BlendEx(TextPoint.x, TextPoint.y, Effect.Alpha, Mask);
      end
      else
        Blend.Blend(TextPoint.x, TextPoint.y, Canvas.Font.Color, Effect.Alpha, Mask);
    end;

    if Effect.Shadow.Enabled then
      Canvas.Brush.Style := OldBrushStyle;
  finally
    if Effect.Angle <> 0 then
    begin
      Canvas.Font.Assign(SaveFont);
      SaveFont.Free;
      DeleteObject(TempFont);
    end;
  end;
end;

//绘制平铺图
procedure TAAFontEx.DrawTiled(Canvas: TCanvas; Rect: TRect; G: TGraphic);
var
  R, Rows, C, Cols: Integer;
begin
  if (G <> nil) and (not G.Empty) then
  begin
    Rows := ((Rect.Bottom - Rect.Top) div G.Height) + 1;
    Cols := ((Rect.Right - Rect.Left) div G.Width) + 1;
    for R := 1 to Rows do
      for C := 1 to Cols do
        Canvas.Draw(Rect.Left + (C - 1) * G.Width, Rect.Top + (R - 1) * G.Height, G);
  end;
end;

//创建纹理图
procedure TAAFontEx.CreateForeBmp;
var
  Width, Height: Integer;
begin
  if (Canvas = nil) or not Effect.Texture.Enabled or
    not Assigned(Effect.Texture.Picture) then
    Exit;

  Height := Mask.Height;
  Width := Mask.Width;
  Blend.ForeBmp.Height := Height;
  Blend.ForeBmp.Width := Width;
  Blend.ForeBmp.Canvas.Brush.Color := Canvas.Font.Color;
  Blend.ForeBmp.Canvas.Brush.Style := bsSolid;
  Blend.ForeBmp.Canvas.FillRect(Rect(0, 0, Width, Height));
  case Effect.Texture.Mode of
    tmTiled:                            //平铺
      with Blend.ForeBmp do
        DrawTiled(Canvas, Rect(0, 0, Width, Height),
          Effect.Texture.Picture.Graphic);
    tmStretched:                        //拉伸
      with Blend.ForeBmp do
        Blend.ForeBmp.Canvas.StretchDraw(Rect(0, 0, Width, Height),
          Effect.Texture.Picture.Graphic);
    tmCenter:                           //中心
      with Effect.Texture.Picture do
        Blend.ForeBmp.Canvas.Draw((Blend.ForeBmp.Width - bitmap.Width) div 2,
          (Blend.ForeBmp.Height - bitmap.Height) div 2, Graphic);
    tmNormal:                           //普通
      with Effect.Texture.Picture do
        Blend.ForeBmp.Canvas.Draw(0, 0, Graphic);
  end;
end;

//增加噪声点
procedure TAAFontEx.AddNoise(Amount: Byte);
var
  pLine: PByteArray;
  x, y: Integer;
  Val: Integer;
begin
  for y := 0 to Blend.ForeBmp.Height - 1 do
  begin
    pLine := Blend.ForeBmp.ScanLine[y];
    for x := 0 to Blend.ForeBmp.Width * 3 - 1 do
    begin
      Val := pLine^[x];
      Val := Val + Random(Amount) - Amount shr 1;
      if Val < 0 then
        Val := 0
      else if Val > 255 then
        Val := 255;
      pLine^[x] := Val;
    end;
  end;
end;

{ TNotifyClass }

//--------------------------------------------------------//
//带更新通知的持久性类                                    //
//--------------------------------------------------------//

//赋值
procedure TNotifyClass.Assign(Source: TPersistent);
begin
  if Source is TNotifyClass then
    //
  else
    inherited Assign(Source);
end;

//更新通知
procedure TNotifyClass.Changed;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

//创建
constructor TNotifyClass.Create(ChangedProc: TNotifyEvent);
begin
  FOnChanged := ChangedProc;
end;

//取所有者
function TNotifyClass.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

//子单位更新通知
procedure TNotifyClass.OnChildChanged(Sender: TObject);
begin
  Changed;
end;

{ TEnabledClass }

//--------------------------------------------------------//
//带Enabled功能的更新通知类                               //
//--------------------------------------------------------//

//赋值
procedure TEnabledClass.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TEnabledClass then
  begin
    FEnabled := TEnabledClass(Source).Enabled;
  end;
end;

//更新通知
procedure TEnabledClass.Changed;
begin
  if FEnabled then                      //如果能用则通知
    inherited Changed;
end;

//创建
constructor TEnabledClass.Create(ChangedProc: TNotifyEvent);
begin
  inherited Create(ChangedProc);
  FEnabled := False;
end;

//设置参数
procedure TEnabledClass.SetEnabled(const Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if Assigned(FOnChanged) then
      FOnChanged(Self);
  end;
end;

{ TAAShadow }

//--------------------------------------------------------//
//阴影参数类                                              //
//--------------------------------------------------------//

//赋值
procedure TAAShadow.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TAAShadow then
  begin
    FBlur := TAAShadow(Source).Blur;
    FColor := TAAShadow(Source).Color;
    FOffsetX := TAAShadow(Source).OffsetX;
    FOffsetY := TAAShadow(Source).OffsetY;
  end;
end;

//创建
constructor TAAShadow.Create(ChangedProc: TNotifyEvent);
begin
  inherited Create(ChangedProc);
  FBlur := 80;
  FAlpha := 70;
  FColor := $00444444;
  FOffsetX := 2;
  FOffsetY := 2;
end;

//设置不透明度
procedure TAAShadow.SetAlpha(const Value: TAlpha);
begin
  if FAlpha <> Value then
  begin
    FAlpha := Value;
    Changed;
  end;
end;

//设置模糊度
procedure TAAShadow.SetBlur(const Value: TBlurStrength);
begin
  if FBlur <> Value then
  begin
    FBlur := Value;
    Changed;
  end;
end;

//设置阴影色
procedure TAAShadow.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Changed;
  end;
end;

//设置水平偏移
procedure TAAShadow.SetOffsetX(const Value: TOffset);
begin
  if FOffsetX <> Value then
  begin
    FOffsetX := Value;
    Changed;
  end;
end;

//设置垂直偏移
procedure TAAShadow.SetOffsetY(const Value: TOffset);
begin
  if FOffsetY <> Value then
  begin
    FOffsetY := Value;
    Changed;
  end;
end;

{ TAAGradual }

//--------------------------------------------------------//
//渐变色参数类                                            //
//--------------------------------------------------------//

//赋值
procedure TAAGradual.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TAAGradual then
  begin
    FStyle := TAAGradual(Source).Style;
    FStartColor := TAAGradual(Source).StartColor;
    FEndColor := TAAGradual(Source).EndColor;
  end;
end;

//创建
constructor TAAGradual.Create(ChangedProc: TNotifyEvent);
begin
  inherited Create(ChangedProc);
  FStyle := gsLeftToRight;
  FStartColor := clWhite;
  FEndColor := clBlack;
end;

//设置结束色
procedure TAAGradual.SetEndColor(const Value: TColor);
begin
  if FEndColor <> Value then
  begin
    FEndColor := Value;
    Changed;
  end;
end;

//设置开始色
procedure TAAGradual.SetStartColor(const Value: TColor);
begin
  if FStartColor <> Value then
  begin
    FStartColor := Value;
    Changed;
  end;
end;

//设置渐变方式
procedure TAAGradual.SetStyle(const Value: TGradualStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Changed;
  end;
end;

{ TAATexture }

//--------------------------------------------------------//
//字体纹理参数类                                          //
//--------------------------------------------------------//

//赋值
procedure TAATexture.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TAATexture then
  begin
    FMode := TAATexture(Source).Mode;
    FPicture.Assign(TAATexture(Source).Picture);
  end;
end;

//创建
constructor TAATexture.Create(ChangedProc: TNotifyEvent);
begin
  inherited Create(ChangedProc);
  FPicture := TPicture.Create;
  FPicture.OnChange := PictureChanged;
  FMode := tmTiled;
end;

//释放
destructor TAATexture.Destroy;
begin
  FPicture.Free;
  inherited Destroy;
end;

//图像内容改变
procedure TAATexture.PictureChanged(Sender: TObject);
begin
  Changed;
end;

//设置显示模式
procedure TAATexture.SetMode(const Value: TTextureMode);
begin
  if FMode <> Value then
  begin
    FMode := Value;
    Changed;
  end;
end;

//设置图像
procedure TAATexture.SetPicture(const Value: TPicture);
begin
  FPicture.Assign(Value);
end;

{ TAAEffect }

//--------------------------------------------------------//
//字体特效参数类                                          //
//--------------------------------------------------------//

//赋值
procedure TAAEffect.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TAAEffect then
  begin
    FAlpha := TAAEffect(Source).Alpha;
    FBlur := TAAEffect(Source).Blur;
    FNoise := TAAEffect(Source).Noise;
    FOutline := TAAEffect(Source).Outline;
    FSpray := TAAEffect(Source).FSpray;
    FAngle := TAAEffect(Source).FAngle;
    FShadow.Assign(TAAEffect(Source).Shadow);
    FGradual.Assign(TAAEffect(Source).Gradual);
    FTexture.Assign(TAAEffect(Source).Texture);
  end;
end;

//创建
constructor TAAEffect.Create(ChangedProc: TNotifyEvent);
begin
  inherited Create(ChangedProc);
  FAlpha := 100;
  FBlur := 0;
  FNoise := 0;
  FSpray := 0;
  FAngle := 0;
  FOutline := False;
  FShadow := TAAShadow.Create(OnChildChanged);
  FGradual := TAAGradual.Create(OnChildChanged);
  FTexture := TAATexture.Create(OnChildChanged);
end;

//释放
destructor TAAEffect.Destroy;
begin
  FShadow.Free;
  FGradual.Free;
  FTexture.Free;
  inherited;
end;

const
  vsAlpha = 'Alpha';
  vsBlur = 'Blur';
  vsNoise = 'Noise';
  vsSpray = 'Spray';
  vsAngle = 'Angle';
  vsOutline = 'Outline';
  vsShadow = 'Shadow';
  vsShadowAlpha = 'ShadowAlpha';
  vsShadowBlur = 'ShadowBlur';
  vsShadowColor = 'ShadowColor';
  vsShadowOffsetX = 'ShadowOffsetX';
  vsShadowOffsetY = 'ShadowOffsetY';
  vsGradual = 'Gradual';
  vsGradualStartColor = 'GradualStartColor';
  vsGradualEndColor = 'GradualEndColor';
  vsGradualStyle = 'GradualStyle';
  vsTexture = 'Texture';
  vsTextureMode = 'TextureMode';
  vsTextPicture = 'TexturePicture';

// 从INI中装载参数
procedure TAAEffect.LoadFromIni(Ini: TCustomIniFile; const Section: string);
begin
  with Ini do
  begin
    FAlpha := ReadInteger(Section, vsAlpha, FAlpha);
    FBlur := ReadInteger(Section, vsBlur, FBlur);
    FNoise := ReadInteger(Section, vsNoise, FNoise);
    FSpray := ReadInteger(Section, vsSpray, FSpray);
    FAngle := ReadInteger(Section, vsAngle, FAngle);
    FOutline := ReadBool(Section, vsOutline, FOutline);
    FShadow.FEnabled := ReadBool(Section, vsShadow, FShadow.FEnabled);
    FShadow.FAlpha := ReadInteger(Section, vsShadowAlpha, FShadow.FAlpha);
    FShadow.FBlur := ReadInteger(Section, vsShadowBlur, FShadow.FBlur);
    FShadow.FColor := ReadInteger(Section, vsShadowColor, FShadow.FColor);
    FShadow.FOffsetX := ReadInteger(Section, vsShadowOffsetX, FShadow.FOffsetX);
    FShadow.FOffsetY := ReadInteger(Section, vsShadowOffsetY, FShadow.FOffsetY);
    FGradual.FEnabled := ReadBool(Section, vsGradual, FGradual.FEnabled);
    FGradual.FStartColor := ReadInteger(Section, vsGradualStartColor, FGradual.FStartColor);
    FGradual.FEndColor := ReadInteger(Section, vsGradualEndColor, FGradual.FEndColor);
    FGradual.FStyle := TGradualStyle(ReadInteger(Section, vsGradualStyle, Ord(FGradual.FStyle)));
    if not (FGradual.FStyle in [Low(TGradualStyle)..High(TGradualStyle)]) then
      FGradual.FStyle := Low(TGradualStyle);
    FTexture.FEnabled := ReadBool(Section, vsTexture, FTexture.FEnabled);
    FTexture.FMode := TTextureMode(ReadInteger(Section, vsTextureMode, Ord(FTexture.FMode)));
    if not (FTexture.FMode in [Low(TTextureMode)..High(TTextureMode)]) then
      FTexture.FMode := Low(TTextureMode);
  end;
end;

// 从保存参数到INI中
procedure TAAEffect.SaveToIni(Ini: TCustomIniFile; const Section: string);
begin
  with Ini do
  begin
    WriteInteger(Section, vsAlpha, FAlpha);
    WriteInteger(Section, vsBlur, FBlur);
    WriteInteger(Section, vsNoise, FNoise);
    WriteInteger(Section, vsSpray, FSpray);
    WriteInteger(Section, vsAngle, FAngle);
    WriteBool(Section, vsOutline, FOutline);
    WriteBool(Section, vsShadow, FShadow.FEnabled);
    WriteInteger(Section, vsShadowAlpha, FShadow.FAlpha);
    WriteInteger(Section, vsShadowBlur, FShadow.FBlur);
    WriteInteger(Section, vsShadowColor, FShadow.FColor);
    WriteInteger(Section, vsShadowOffsetX, FShadow.FOffsetX);
    WriteInteger(Section, vsShadowOffsetY, FShadow.FOffsetY);
    WriteBool(Section, vsGradual, FGradual.FEnabled);
    WriteInteger(Section, vsGradualStartColor, FGradual.FStartColor);
    WriteInteger(Section, vsGradualEndColor, FGradual.FEndColor);
    WriteInteger(Section, vsGradualStyle, Ord(FGradual.FStyle));
    WriteBool(Section, vsTexture, FTexture.FEnabled);
    WriteInteger(Section, vsTextureMode, Ord(FTexture.FMode));
  end;
end;

//设置不透明度
procedure TAAEffect.SetAlpha(const Value: TAlpha);
begin
  if FAlpha <> Value then
  begin
    FAlpha := Value;
    Changed;
  end;
end;

//设置模糊度
procedure TAAEffect.SetBlur(const Value: TBlurStrength);
begin
  if FBlur <> Value then
  begin
    FBlur := Value;
    Changed;
  end;
end;

//设置字体边缘
procedure TAAEffect.SetOutline(const Value: Boolean);
begin
  if FOutline <> Value then
  begin
    FOutline := Value;
    Changed;
  end;
end;

//设置噪声参数
procedure TAAEffect.SetNoise(const Value: Byte);
begin
  if FNoise <> Value then
  begin
    FNoise := Value;
    Changed;
  end;
end;

//设置喷溅
procedure TAAEffect.SetSpray(const Value: TSprayRange);
begin
  if FSpray <> Value then
  begin
    FSpray := Value;
    Changed;
  end;
end;

//设置旋转角度
procedure TAAEffect.SetAngle(const Value: TAngle);
begin
  if FAngle <> Value then
  begin
    FAngle := Value;
    Changed;
  end;
end;

//设置渐变色
procedure TAAEffect.SetGradual(const Value: TAAGradual);
begin
  FGradual.Assign(Value);
  Changed;
end;

//设置阴影参数
procedure TAAEffect.SetShadow(const Value: TAAShadow);
begin
  FShadow.Assign(Value);
  Changed;
end;

//设置字体纹理参数
procedure TAAEffect.SetTexture(const Value: TAATexture);
begin
  FTexture.Assign(Value);
  Changed;
end;

{ TFontLabel }

//--------------------------------------------------------//
//字体标签类                                              //
//--------------------------------------------------------//

//字体变动通知
procedure TFontLabel.Changed;
begin
  if Assigned(FontLabels) then
    FontLabels.Changed;
end;

//初始化
constructor TFontLabel.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FName := '';
  FFont := TFont.Create;
  FFont.OnChange := OnEffectChanged;
  FEffect := TAAEffect.Create(OnEffectChanged);
  FEffect.FOwner := Self;
end;

//释放
destructor TFontLabel.Destroy;
begin
  FFont.Free;
  FEffect.Free;
  inherited;
end;

//取显示名
function TFontLabel.GetDisplayName: string;
begin
  if Name <> '' then
    Result := Name
  else
    Result := inherited GetDisplayName;
end;

//取字体标签集
function TFontLabel.GetFontLabels: TFontLabels;
begin
  if Collection is TFontLabels then
    Result := TFontLabels(Collection)
  else
    Result := nil;
end;

//字体风格变动通知
procedure TFontLabel.OnEffectChanged(Sender: TObject);
begin
  Changed;
end;

//设置字体
procedure TFontLabel.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  Changed;
end;

//设置标签名
procedure TFontLabel.SetName(const Value: string);
begin
  if (Value <> '') and (AnsiCompareText(Value, FName) <> 0) and
    (Collection is TFontLabels) and (TFontLabels(Collection).IndexOf(Value) >= 0) then
    raise Exception.Create(SDuplicateString); //命名重复
  FName := Value;
  Changed;
end;

//设置字体显示风格
procedure TFontLabel.SetEffect(const Value: TAAEffect);
begin
  FEffect.Assign(Value);
  Changed;
end;

{ TFontLabels }

//--------------------------------------------------------//
//字体标签集类                                            //
//--------------------------------------------------------//

//新增标签
function TFontLabels.AddItem(AName, AFontName: string; AFontSize: Integer;
  AFontColor: TColor; AFontEffect: TFontStyles; Shadow: Boolean;
  OffsetX, OffsetY: Integer): TFontLabel;
begin
  if IndexOf(AName) < 0 then
  begin
    Result := TFontLabel(Add);
    with Result do
    begin
      FName := AName;
      FFont.Name := AFontName;
      FFont.Size := AFontSize;
      FFont.Color := AFontColor;
      FFont.Style := AFontEffect;
      FEffect.Shadow.Enabled := Shadow;
      FEffect.Shadow.OffsetX := OffsetX;
      FEffect.Shadow.OffsetY := OffsetY;
    end;
  end
  else
    Result := nil;
end;

//设置改变通知
procedure TFontLabels.Changed;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

//更新
procedure TFontLabels.Update(Item: TCollectionItem);
begin
  inherited;
  Changed;
end;

//标签检查
procedure TFontLabels.Check(var AText: string; AFont: TFont;
  AEffect: TAAEffect);
var
  StartPos, Index: Integer;
begin
  for Index := 0 to Count - 1 do
  begin                                 //查找字体标签
    StartPos := Pos('<' + UpperCase(Items[Index].Name) + '>',
      UpperCase(AText));
    if StartPos >= 1 then
    begin                               //切换字体
      if Assigned(AFont) then
        AFont.Assign(Items[Index].Font);
      if Assigned(AEffect) then
        AEffect.Assign(Items[Index].Effect);
      system.Delete(AText, StartPos, Length(Items[Index].Name) + 2);
    end;
  end;
end;

//初始化
constructor TFontLabels.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, TFontLabel);
end;

//取子项
function TFontLabels.GetItem(Index: Integer): TFontLabel;
begin
  Result := TFontLabel(inherited Items[Index]);
end;

//取索引
function TFontLabels.IndexOf(const Name: string): Integer;
begin
  for Result := 0 to Count - 1 do
    if AnsiCompareText(Items[Result].Name, Name) = 0 then Exit;
  Result := -1;
end;

//设置子项
procedure TFontLabels.SetItem(Index: Integer; const Value: TFontLabel);
begin
  inherited SetItem(Index, TCollectionItem(Value));
end;

{ TUserLabel }

//--------------------------------------------------------//
//用户标签类                                              //
//--------------------------------------------------------//

//变更通知
procedure TUserLabel.Changed;
begin
  if Assigned(UserLabels) then
    UserLabels.Changed;
end;

//初始化
constructor TUserLabel.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FName := '';
  FText := '';
  FStyle := lsCustom;
  FOnGetText := nil;
end;

//取显示名
function TUserLabel.GetDisplayName: string;
begin
  if Name <> '' then
    Result := Name
  else
    Result := inherited GetDisplayName;
end;

//取文本
function TUserLabel.GetText: string;
begin
  case Style of
    lsLeftJustify, lsCenter, lsRightJustify: Result := ''; //对齐标签
    lsRegOwner: Result := TUserLabels(Collection).RegOwner; //用户名
    lsRegOrganization: Result := TUserLabels(Collection).RegOrganization; //组织名
    lsAppTitle: Result := Application.Title; //应用程序标题
    lsDate: Result := DateToStr(Date);  //当前日期
    lsTime: Result := TimeToStr(Time);  //当前时间
  else
    Result := FText;                    //自定义
  end;
  if Assigned(OnGetText) then
    OnGetText(Self, Result);            //取文本事件
end;

//取标签集
function TUserLabel.GetUserLabels: TUserLabels;
begin
  if Collection is TUserLabels then
    Result := TUserLabels(Collection)
  else
    Result := nil;
end;

//文本是否存储
function TUserLabel.IsTextStored: Boolean;
begin
  Result := FStyle = lsCustom;
end;

//设置标签名
procedure TUserLabel.SetName(const Value: string);
begin
  if (Value <> '') and (AnsiCompareText(Value, FName) <> 0) and
    (Collection is TUserLabels) and (TUserLabels(Collection).IndexOf(Value) >= 0) then
    raise Exception.Create(SDuplicateString);
  FName := Value;
  Changed;
end;

//设置标签风格
procedure TUserLabel.SetStyle(const Value: TLabelStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Changed;
  end;
end;

//设置文本
procedure TUserLabel.SetText(const Value: string);
begin
  if (FStyle = lsCustom) and (FText <> Value) then
  begin
    FText := Value;
    Changed;
  end;
end;

{ TUserLabels }

//--------------------------------------------------------//
//用户标签集类                                            //
//--------------------------------------------------------//

//增加新标签
function TUserLabels.AddItem(AName, AText: string;
  AStyle: TLabelStyle): TUserLabel;
begin
  if IndexOf(AName) < 0 then
  begin
    Result := TUserLabel(Add);
    with Result do
    begin
      FName := AName;
      FText := AText;
      FStyle := AStyle;
    end;
  end
  else
    Result := nil;
end;

//标签变动通知
procedure TUserLabels.Changed;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self);
end;

//更新
procedure TUserLabels.Update(Item: TCollectionItem);
begin
  inherited;
  Changed;
end;

//标签检查
procedure TUserLabels.Check(var AText: string; var Align: TAlignment);
const
  csAlignArray: array[lsLeftJustify..lsRightJustify] of TAlignment =
  (taLeftJustify, taCenter, taRightJustify);
var
  StartPos, Index: Integer;
begin
  for Index := 0 to Count - 1 do
  begin                                 //查找用户标签
    StartPos := Pos('<' + UpperCase(Items[Index].Name) + '>',
      UpperCase(AText));
    if StartPos >= 1 then
    begin                               //删除标签
      system.Delete(AText, StartPos, Length(Items[Index].Name) + 2);
      case Items[Index].Style of        //对齐标签
        lsLeftJustify, lsCenter, lsRightJustify:
          begin
            Align := csAlignArray[Items[Index].Style];
          end;
      else                              //置换为文本
        system.insert(Items[Index].Text, AText, StartPos);
      end;
    end;
  end;
end;

//初始化
constructor TUserLabels.Create(AOwner: TComponent);
var
  Reg: TRegistry;
  UserName: array[0..255] of Char;
  Size: Cardinal;
begin
  inherited Create(AOwner, TUserLabel);
  Reg := TRegistry.Create;
  try                                   //从注册表中读取用户名和组织名
    Reg.Rootkey := HKEY_LOCAL_MACHINE;
    Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows\CurrentVersion');
    RegOwner := Reg.ReadString('RegisteredOwner');
    RegOrganization := Reg.ReadString('RegisteredOrganization');
    Reg.CloseKey;
    if RegOwner = '' then
    begin
      Size := 255;
      GetUserName(UserName, Size);
      RegOwner := UserName;
    end;
  finally
    Reg.Free;
  end;
end;

//取子项
function TUserLabels.GetItem(Index: Integer): TUserLabel;
begin
  Result := TUserLabel(inherited Items[Index]);
end;

//查找索引号
function TUserLabels.IndexOf(const Name: string): Integer;
begin
  for Result := 0 to Count - 1 do
    if AnsiCompareText(Items[Result].Name, Name) = 0 then Exit;
  Result := -1;
end;

//设置子项
procedure TUserLabels.SetItem(Index: Integer; const Value: TUserLabel);
begin
  inherited SetItem(Index, TCollectionItem(Value));
end;

{ TPackParam }

//--------------------------------------------------------//
//打包参数类                                              //
//--------------------------------------------------------//

//赋值
procedure TPackParam.Assign(Source: TPersistent);
begin
  if Source is TPackParam then
    FOwner := TPackParam(Source).Owner
  else
    inherited;
end;

//创建
constructor TPackParam.Create(AOwner: TControl);
begin
  FOwner := AOwner;
end;

{ TDrag }

//--------------------------------------------------------//
//拖动打包参数类                                          //
//--------------------------------------------------------//

function TDrag.GetDragCursor: TCursor;
begin
  Result := TMyControl(FOwner).DragCursor;
end;

function TDrag.GetDragKind: TDragKind;
begin
  Result := TMyControl(FOwner).DragKind;
end;

function TDrag.GetDragMode: TDragMode;
begin
  Result := TMyControl(FOwner).DragMode;
end;

procedure TDrag.SetDragCursor(const Value: TCursor);
begin
  TMyControl(FOwner).DragCursor := Value;
end;

procedure TDrag.SetDragKind(const Value: TDragKind);
begin
  TMyControl(FOwner).DragKind := Value;
end;

procedure TDrag.SetDragMode(const Value: TDragMode);
begin
  TMyControl(FOwner).DragMode := Value;
end;

{ TParentEffect }

//--------------------------------------------------------//
//Parent打包参数类                                        //
//--------------------------------------------------------//

function TParentEffect.GetParentBiDiMode: Boolean;
begin
  Result := TMyControl(FOwner).ParentBiDiMode;
end;

function TParentEffect.GetParentColor: Boolean;
begin
  Result := TMyControl(FOwner).ParentColor;
end;

function TParentEffect.GetParentFont: Boolean;
begin
  Result := TMyControl(FOwner).ParentFont;
end;

function TParentEffect.GetParentShowHint: Boolean;
begin
  Result := TMyControl(FOwner).ParentShowHint;
end;

procedure TParentEffect.SetParentBiDiMode(const Value: Boolean);
begin
  TMyControl(FOwner).ParentBiDiMode := Value;
end;

procedure TParentEffect.SetParentColor(const Value: Boolean);
begin
  TMyControl(FOwner).ParentColor := Value;
end;

procedure TParentEffect.SetParentFont(const Value: Boolean);
begin
  TMyControl(FOwner).ParentFont := Value;
end;

procedure TParentEffect.SetParentShowHint(const Value: Boolean);
begin
  TMyControl(FOwner).ParentShowHint := Value;
end;

{ TTimerThread }

//--------------------------------------------------------//
//高精度定时器定时线程                                    //
//--------------------------------------------------------//

{ TTimerThread }

constructor TTimerThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FStop := CreateEvent(nil, False, False, nil);
end;

procedure TTimerThread.Execute;
var
  WaitTime: DWORD;
begin
  repeat
    if FInterval = 0 then
      WaitTime := INFINITE
    else
      WaitTime := FInterval;
    if WaitForSingleObject(FStop, WaitTime) = WAIT_TIMEOUT then
      Synchronize(FOwner.DoTimer);
  until Terminated;
  CloseHandle(FStop);
end;

{ TTimerEx }

//--------------------------------------------------------//
//高精度定时器                                            //
//--------------------------------------------------------//

constructor TTimerEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := False;
  FInterval := 1000;
  FQuality := tqLow;
  FTimer := nil;
  FTimerThread := nil;
  CreateTimer;
end;

destructor TTimerEx.Destroy;
begin
  FreeTimer;
  FreeTimerThread;
  inherited Destroy;
end;

procedure TTimerEx.DoTimer;
begin
  if Assigned(FOnTimer) then
    FOnTimer(Self);
end;

procedure TTimerEx.OnTimerTimer(Sender: TObject);
begin
  DoTimer;
end;

procedure TTimerEx.CreateTimer;
begin
  if not Assigned(FTimer) then
  begin
    FTimer := TTimer.Create(Self);
    FTimer.OnTimer := OnTimerTimer;
    FTimer.Interval := FInterval;
    FTimer.Enabled := FEnabled;
  end;
end;

procedure TTimerEx.CreateTimerThread;
begin
  if not Assigned(FTimerThread) then
  begin
    FTimerThread := TTimerThread.Create(True);
    FTimerThread.FOwner := Self;
    FTimerThread.FreeOnTerminate := False;
    FTimerThread.Priority := tpNormal;
    FTimerThread.FInterval := FInterval;
    if FEnabled then
    begin
      SetEvent(FTimerThread.FStop);
      FTimerThread.Resume;
    end
    else
      FTimerThread.Suspend;
  end;
end;

procedure TTimerEx.FreeTimer;
begin
  if Assigned(FTimer) then
  begin
    FTimer.Free;
    FTimer := nil;
  end;
end;

procedure TTimerEx.FreeTimerThread;
begin
  if Assigned(FTimerThread) then
  begin
    FTimerThread.Terminate;
    SetEvent(FTimerThread.FStop);
    if FTimerThread.Suspended then FTimerThread.Resume;
    FTimerThread.WaitFor;
    FTimerThread.Free;
    FTimerThread := nil;
  end;
end;

procedure TTimerEx.SetQuality(const Value: TTimerQuality);
begin
  if FQuality <> Value then
  begin
    FQuality := Value;
    case FQuality of
      tqHighest, tqHigh:
        begin
          FreeTimer;
          CreateTimerThread;
          if Value = tqHighest then
            FTimerThread.Priority := tpHigher
          else
            FTimerThread.Priority := tpNormal;
        end;
      tqLow:
        begin
          FreeTimerThread;
          CreateTimer;
        end;
    end;
  end;
end;

procedure TTimerEx.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    if FQuality = tqLow then
      FTimer.Enabled := FEnabled
    else
    begin
      if FEnabled then
      begin
        SetEvent(FTimerThread.FStop);
        FTimerThread.Resume;
      end
      else
        FTimerThread.Suspend;
    end;
  end;
end;

procedure TTimerEx.SetInterval(Value: WORD);
begin
  if Value <> FInterval then
  begin
    FInterval := Value;
    Enabled := False;
    if FQuality = tqLow then
      FTimer.Interval := FInterval
    else
      FTimerThread.FInterval := FInterval;
    Enabled := True;
  end;
end;

{ TCustomParam }

//--------------------------------------------------------//
//控件定制参数类                                          //
//--------------------------------------------------------//

//初始化
constructor TCustomParam.Create(AOwner: TAAGraphicControl;
  ChangedProc: TNotifyEvent);
begin
  inherited Create(ChangedProc);
  FOwner := AOwner;
  FBackGround := TPicture.Create;
  FBackGround.OnChange := BackGroundChanged;
  FBackGroundMode := bmCenter;
  FAlignment := taLeftJustify;
  FTransparent := False;
  FLayout := tlTop;
  FWordWrap := False;
end;

//释放
destructor TCustomParam.Destroy;
begin
  FBackGround.Free;
  inherited;
end;

//赋值
procedure TCustomParam.Assign(Source: TPersistent);
begin
  inherited;
  if Source is TCustomParam then
  begin
    FAlignment := TCustomParam(Source).Alignment;
    FWordWrap := TCustomParam(Source).WordWrap;
    FTransparent := TCustomParam(Source).Transparent;
    FLayout := TCustomParam(Source).Layout;
    FOwner := TCustomParam(Source).Owner;
    FBackGround.Assign(TCustomParam(Source).BackGround);
    FBackGroundMode := TCustomParam(Source).BackGroundMode;
  end;
end;

//背景为空
function TCustomParam.IsBackEmpty: Boolean;
begin
  Result := not Assigned(FBackGround.Graphic) or
    FBackGround.Graphic.Empty;
end;

//取背景色
function TCustomParam.GetColor: TColor;
begin
  Result := FOwner.Color;
end;

//取字体
function TCustomParam.GetFont: TFont;
begin
  Result := FOwner.Font;
end;

//设置背景色
procedure TCustomParam.SetColor(const Value: TColor);
begin
  FOwner.Color := Value;
end;

//设置字体
procedure TCustomParam.SetFont(const Value: TFont);
begin
  FOwner.Font := Value;
end;

//背景图更新
procedure TCustomParam.BackGroundChanged(Sender: TObject);
begin
  Changed;
end;

//设置字体风格
function TCustomParam.GetFontEffect: TAAEffect;
begin
  Result := FOwner.FAAFont.Effect;
end;

//取字体风格
procedure TCustomParam.SetFontEffect(const Value: TAAEffect);
begin
  FOwner.FAAFont.Effect.Assign(Value);
  Changed;
end;

//设置垂直对齐
procedure TCustomParam.SetLayout(const Value: TTextLayout);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Changed;
  end;
end;

//设置缺省对齐方式
procedure TCustomParam.SetAlignment(const Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Changed;
  end;
end;

//设置自动换行
procedure TCustomParam.SetWordWrap(const Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    Changed;
  end;
end;

//设置背景图模式
procedure TCustomParam.SetBackGroundMode(const Value: TBackGroundMode);
begin
  if FBackGroundMode <> Value then
  begin
    FBackGroundMode := Value;
    Changed;
  end;
end;

//取显示精度
function TCustomParam.GetQuality: TAAQuality;
begin
  Result := FOwner.FAAFont.Quality;
end;

//设置显示精度
procedure TCustomParam.SetQuality(const Value: TAAQuality);
begin
  if FOwner.FAAFont.Quality <> Value then
  begin
    FOwner.FAAFont.Quality := Value;
    Changed;
  end;
end;

//设置透明
procedure TCustomParam.SetTransparent(const Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    Changed;
  end;
end;

//设置背景图
procedure TCustomParam.SetBackGround(const Value: TPicture);
begin
  FBackGround.Assign(Value);
end;

//存储背景色
function TCustomParam.IsColorStroed: Boolean;
begin
  Result := not FOwner.ParentColor;
end;

{ TCustomTextParam }

//--------------------------------------------------------//
//可定制的文本参数类                                      //
//--------------------------------------------------------//

//初始化
constructor TCustomTextParam.Create(AOwner: TAAGraphicControl;
  ChangedProc: TNotifyEvent);
begin
  inherited;
  FLines := TStringList.Create;
  TStringList(FLines).OnChange := LinesChanged;
  FFontEffect := TAAEffect.Create(OnChildChanged);
  FRowPitch := 20;
  FLabelEffect := leUntilNextLabel;
end;

//释放
destructor TCustomTextParam.Destroy;
begin
  FLines.Free;
  FFontEffect.Free;
  inherited;
end;

//赋值
procedure TCustomTextParam.Assign(Source: TPersistent);
begin
  inherited;
  if Source is TCustomTextParam then
  begin
    FRowPitch := TCustomTextParam(Source).RowPitch;
    FLabelEffect := TCustomTextParam(Source).LabelEffect;
    FLines.Assign(TCustomTextParam(Source).Lines);
  end;
end;

//文本内容是否存储
function TCustomTextParam.IsLinesStored: Boolean;
begin
  Result := True;
end;

//文本内容改变
procedure TCustomTextParam.LinesChanged(Sender: TObject);
begin
  Changed;
end;

//设置文本内容
procedure TCustomTextParam.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
  Changed;
end;

//设置行间距
procedure TCustomTextParam.SetRowPitch(const Value: TRowPitch);
begin
  if FRowPitch <> Value then
  begin
    FRowPitch := Value;
    Changed;
  end;
end;

//设置标签作用范围
procedure TCustomTextParam.SetLabelEffect(const Value: TLabelEffect);
begin
  if FLabelEffect <> Value then
  begin
    FLabelEffect := Value;
    Changed;
  end;
end;

//设置默认字体风格
procedure TCustomTextParam.SetFontEffect(const Value: TAAEffect);
begin
  FFontEffect.Assign(Value);
end;

{ TAAGraphicControl }

//--------------------------------------------------------//
//平滑字体控件基类                                        //
//--------------------------------------------------------//

//初始化
constructor TAAGraphicControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDrag := TDrag.Create(Self);
  FParentEffect := TParentEffect.Create(Self);
  FAAFont := TAAFontEx.Create(Canvas);
  FAAFont.Effect.OnChanged := OnEffectChanged;
{$IFNDEF COMPILER6_UP}
  FAutoSize := True;
{$ELSE}
  AutoSize := True;
{$ENDIF}
  FAutoUpdate := True;
  FBorder := 0;
  FUpdateCount := 0;
  FChangeCount := 0;
  Inited := False;
  Drawing := False;
  AHeight := 0;
  AWidth := 0;
end;

//释放
destructor TAAGraphicControl.Destroy;
begin
  FAAFont.Free;
  FDrag.Free;
  FParentEffect.Free;
  inherited;
end;

//参数改变
procedure TAAGraphicControl.Changed;
begin
  if Inited and AutoUpdate and ([csLoading, csDestroying, csReading,
    csUpdating, csWriting] * ComponentState = []) and (FUpdateCount
    = 0) then
    Reset;
end;

//重新设置
procedure TAAGraphicControl.Reset;
begin
  Invalidate;
end;

//运行时属性已装载
procedure TAAGraphicControl.Loaded;
begin
  inherited;
  Inited := True;
  LoadedEx;
end;

//属性已装载（设计时和运行时）供重载用
procedure TAAGraphicControl.LoadedEx;
begin
  Changed;
end;

//控件重绘
procedure TAAGraphicControl.Paint;
begin
  if [csLoading, csDestroying, csReading, csUpdating, csWriting] *
    ComponentState <> [] then
    Exit;
  if not Inited then
  begin
    Inited := True;
    LoadedEx;
  end;
  if Drawing then
    Exit;
  Drawing := True;
  PaintCanvas;
  Drawing := False;
end;

//重绘画布（子控件中重载该方法输出）
procedure TAAGraphicControl.PaintCanvas;
begin

end;

//消息处理
procedure TAAGraphicControl.WndProc(var message: TMessage);
begin
  case message.Msg of
    CM_COLORCHANGED, CM_TEXTCHANGED, CM_FONTCHANGED:
      Changed;
    CM_MOUSEENTER:
      if Assigned(FOnMouseEnter) then
        FOnMouseEnter(Self);
    CM_MOUSELEAVE:
      if Assigned(FOnMouseLeave) then
        FOnMouseLeave(Self);
  end;
  inherited;
end;

//大小变化
procedure TAAGraphicControl.Resize;
begin
  if (Height <> AHeight) or (Width <> AWidth) then
  begin
    AHeight := Height;
    AWidth := Width;
    Changed;
  end;
  inherited Resize;
end;

//字体风格变化
procedure TAAGraphicControl.OnEffectChanged(Sender: TObject);
begin
  Changed;
end;

//设置自动大小
{$IFDEF COMPILER6_UP}
procedure TAAGraphicControl.SetAutoSize(Value: Boolean);
begin
  inherited;
  Changed;
end;

{$ELSE}
procedure TAAGraphicControl.SetAutoSize(const Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    Changed;
  end;
end;
{$ENDIF}

//设置边界宽度
procedure TAAGraphicControl.SetBorder(const Value: TBorderWidth);
begin
  if FBorder <> Value then
  begin
    FBorder := Value;
    Changed;
  end;
end;

//设置拖动属性
procedure TAAGraphicControl.SetDrag(const Value: TDrag);
begin
  FDrag.Assign(Value);
end;

//设置属性
procedure TAAGraphicControl.SetParentEffect(const Value: TParentEffect);
begin
  FParentEffect.Assign(Value);
end;

//设置自动更新
procedure TAAGraphicControl.SetAutoUpdate(const Value: Boolean);
begin
  if FAutoUpdate <> Value then
  begin
    FAutoUpdate := Value;
    if FAutoUpdate and (csDesigning in ComponentState) then
      Changed;
  end;
end;

//开始更新
procedure TAAGraphicControl.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

//结束更新
procedure TAAGraphicControl.EndUpdate;
begin
  Dec(FUpdateCount);
end;

//图像混合
procedure TAAGraphicControl.Blend(DesBmp, BkBmp, ForeBmp: TBitmap;
  AProgress: TProgress);
var
  pMem, pHot, pBlend: PByteArray;
  x, y, i: Integer;
  Weight: Byte;
  AHeight, AWidth: Integer;
  Table: array[-255..255] of Byte;
begin
  AHeight := Min(BkBmp.Height, ForeBmp.Height);
  AWidth := Min(BkBmp.Width, ForeBmp.Width);
  DesBmp.Height := AHeight;
  DesBmp.Width := AWidth;
  if AProgress = 0 then
  begin
    DesBmp.Canvas.Draw(0, 0, BkBmp);
  end
  else if AProgress = csMaxProgress then
  begin
    DesBmp.Canvas.Draw(0, 0, ForeBmp);
  end
  else
  begin
    Weight := Round(AProgress * $FF / csMaxProgress);
    for i := Low(Table) to High(Table) do
      Table[i] := i * Weight shr 8;
    for y := 0 to AHeight - 1 do
    begin
      pMem := BkBmp.ScanLine[y];
      pHot := ForeBmp.ScanLine[y];
      pBlend := DesBmp.ScanLine[y];
      for x := 0 to AWidth * 3 - 1 do
        pBlend[x] := Table[pHot[x] - pMem[x]] + pMem[x];
    end;
  end;
end;

//从父控件复制背景
//这个过程来自RxLibrary VCLUtils
procedure TAAGraphicControl.CopyParentImage(Dest: TCanvas);
var
  I, Count, X, Y, SaveIndex: Integer;
  DC: HDC;
  R, SelfR, CtlR: TRect;
begin
  if Parent = nil then Exit;
  Count := Parent.ControlCount;
  DC := Dest.Handle;
  with Parent do
    ControlState := ControlState + [csPaintCopy];
  try
    SelfR := Bounds(Left, Top, Width, Height);
    X := -Left;
    Y := -Top;
    { Copy parent control image }
    SaveIndex := SaveDC(DC);
    try
      SetViewportOrgEx(DC, X, Y, nil);
      IntersectClipRect(DC, 0, 0, Parent.ClientWidth,
        Parent.ClientHeight);
      try
        with TParentControl(Parent) do
        begin
          Perform(WM_ERASEBKGND, DC, 0);
          PaintWindow(DC);
        end;
      except
        ;
      end;
    finally
      RestoreDC(DC, SaveIndex);
    end;
    { Copy images of graphic controls }
    for I := 0 to Count - 1 do
    begin
      if Parent.Controls[I] = Self then
        Break
      else if (Parent.Controls[I] <> nil) and
        (Parent.Controls[I] is TGraphicControl) then
      begin
        with TGraphicControl(Parent.Controls[I]) do
        begin
          CtlR := Bounds(Left, Top, Width, Height);
          if Bool(IntersectRect(R, SelfR, CtlR)) and Visible then
          begin
            ControlState := ControlState + [csPaintCopy];
            SaveIndex := SaveDC(DC);
            try
              SetViewportOrgEx(DC, Left + X, Top + Y, nil);
              IntersectClipRect(DC, 0, 0, Width, Height);
              Perform(WM_PAINT, DC, 0);
            finally
              RestoreDC(DC, SaveIndex);
              ControlState := ControlState - [csPaintCopy];
            end;
          end;
        end;
      end;
    end;
  finally
    with Parent do
      ControlState := ControlState - [csPaintCopy];
  end;
end;

//绘制平铺图
procedure TAAGraphicControl.DrawTiled(Canvas: TCanvas; Rect: TRect; G: TGraphic);
var
  R, Rows, C, Cols: Integer;
begin
  if (G <> nil) and (not G.Empty) then
  begin
    Rows := ((Rect.Bottom - Rect.Top) div G.Height) + 1;
    Cols := ((Rect.Right - Rect.Left) div G.Width) + 1;
    for R := 1 to Rows do
      for C := 1 to Cols do
        Canvas.Draw(Rect.Left + (C - 1) * G.Width, Rect.Top + (R - 1) * G.Height, G);
  end;
end;

//绘制背景图
procedure TAAGraphicControl.DrawBackGround(Canvas: TCanvas; Rect: TRect;
  G: TGraphic; Mode: TBackGroundMode);
var
  AStyle: TBrushStyle;
begin
  AStyle := Canvas.Brush.Style;
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(Rect);
  Canvas.Brush.Style := AStyle;
  case Mode of
    bmTiled:
      DrawTiled(Canvas, Rect, G);
    bmStretched:
      Canvas.StretchDraw(Rect, G);
    bmCenter:
      Canvas.Draw((Rect.Right + Rect.Left - G.Width) div 2,
        (Rect.Bottom + Rect.Top - G.Height) div 2, G);
    bmNormal:
      Canvas.Draw(Rect.Left, Rect.Top, G);
  end;
end;

//自动换行
function TAAGraphicControl.GetWrapText(const Line, BreakStr: string; BreakChars:
  TSysCharSet; MaxCol: Integer): string;
const
  QuoteChars = ['''', '"'];
var
  Col, Pos: Integer;
  LinePos, LineLen: Integer;
  BreakLen, BreakPos: Integer;
  QuoteChar, CurChar: Char;
  ExistingBreak: Boolean;
  DoubleCharBreak: Boolean;
begin
  if MaxCol < 2 then MaxCol := 2;
  Col := 1;
  Pos := 1;
  LinePos := 1;
  BreakPos := 0;
  QuoteChar := ' ';
  ExistingBreak := False;
  DoubleCharBreak := False;
  LineLen := Length(Line);
  BreakLen := Length(BreakStr);
  Result := '';
  while Pos <= LineLen do
  begin
    CurChar := Line[Pos];
    if CurChar in LeadBytes then
    begin
      if Col >= MaxCol - 1 then
      begin
        DoubleCharBreak := True;
        BreakPos := Pos - 1;
      end;
      Inc(Pos);
      Inc(Col);
    end
    else if CurChar = BreakStr[1] then
    begin
      if QuoteChar = ' ' then
      begin
        ExistingBreak := CompareText(BreakStr, Copy(Line, Pos, BreakLen)) = 0;
        if ExistingBreak then
        begin
          Inc(Pos, BreakLen - 1);
          BreakPos := Pos;
        end;
      end
    end
    else if CurChar in BreakChars then
    begin
      if QuoteChar = ' ' then
        BreakPos := Pos
    end
    else if CurChar in QuoteChars then
      if CurChar = QuoteChar then
        QuoteChar := ' '
      else if QuoteChar = ' ' then
        QuoteChar := CurChar;
    Inc(Pos);
    Inc(Col);
    if (not (QuoteChar in QuoteChars) and (ExistingBreak or
      ((Col > MaxCol) and (BreakPos > LinePos)))) or DoubleCharBreak then
    begin
      Col := Pos - BreakPos;
      Result := Result + Copy(Line, LinePos, BreakPos - LinePos + 1);
      if not (CurChar in QuoteChars) then
        while (Pos <= LineLen) and (Line[Pos] in BreakChars + [#13, #10]) do
          Inc(Pos);
      if not ExistingBreak and (Pos < LineLen) then
        Result := Result + BreakStr;
      Inc(BreakPos);
      LinePos := BreakPos;
      ExistingBreak := False;
      DoubleCharBreak := False;
    end;
  end;
  Result := Result + Copy(Line, LinePos, MaxInt);
end;

//文字自动换行
procedure TAAGraphicControl.WrapText(const S: string; Strs: TStrings;
  Col: Integer);
begin
  if not Assigned(Strs) then
    Strs := TStringList.Create;
  Strs.Clear;
  Strs.Text := GetWrapText(S, #13#10, ['.', ',', '?', '!', ' ', ';', ':',
    #9, '-'], Col);
end;

{ TAACustomText }

//--------------------------------------------------------//
//平滑文本控件基类                                        //
//--------------------------------------------------------//

//初始化
constructor TAACustomText.Create(AOwner: TComponent);
begin
  inherited;
  FFonts := TFontLabels.Create(Self);
  FFonts.OnChanged := OnLabelChanged;
  FLabels := TUserLabels.Create(Self);
  FLabels.OnChanged := OnLabelChanged;
  FFontsInited := False;
  FLabelsInited := False;
end;

//创建默认字体和标签
procedure TAACustomText.CreateDefault;
begin
  BeginUpdate;
  try
    if (csDesigning in ComponentState) and UseDefaultLabels
      and (Fonts.Count = 0) and not FFontsInited then
    begin
      FFontsInited := True;
      CreateDefFonts;
    end;
    if (csDesigning in ComponentState) and UseDefaultLabels
      and (Labels.Count = 0) and not FLabelsInited then
    begin
      FLabelsInited := True;
      CreateDefLabels;
    end;
  finally
    EndUpdate;
  end;
end;

//是否创建默认字体和标签
function TAACustomText.UseDefaultLabels: Boolean;
begin
  Result := True;
end;

//创建默认字体
procedure TAACustomText.CreateDefFonts;
begin
  with Fonts do
  begin
    AddItem('Title1', '黑体', 12, clBlack, [fsBold], True, 2, 2);
    AddItem('Title2', '黑体', 9, clBlue, [fsBold], True, 1, 1);
    AddItem('Title3', '楷体_GB2312', 11, clBlue, [], True, 2, 2);
    AddItem('Text1', '楷体_GB2312', 9, clBlack, [], False, 1, 1);
    AddItem('Text2', '楷体_GB2312', 8, clTeal, [], True, 1, 1);
  end;
end;

//创建默认标签
procedure TAACustomText.CreateDefLabels;
begin
  with Labels do
  begin
    AddItem('Left', '', lsLeftJustify); //左对齐
    AddItem('Center', '', lsCenter);    //中心对齐
    AddItem('Right', '', lsRightJustify); //右对齐
    AddItem('Owner', '', lsRegOwner);   //用户名
    AddItem('Organization', '', lsRegOrganization); //组织名
    AddItem('AppTitle', '', lsAppTitle); //应用程序标题
    AddItem('Date', '', lsDate);        //当前日期
    AddItem('Time', '', lsTime);        //当前时间
  end;
end;

//属性已装载
procedure TAACustomText.LoadedEx;
begin
  CreateDefault;
end;

//释放
destructor TAACustomText.Destroy;
begin
  FFonts.Free;
  FLabels.Free;
  inherited;
end;

//标签变动
procedure TAACustomText.OnLabelChanged(Sender: TObject);
begin
  Changed;
end;

//设置字体
procedure TAACustomText.SetFonts(const Value: TFontLabels);
begin
  FFonts.Assign(Value);
end;

//设置用户标签
procedure TAACustomText.SetLabels(const Value: TUserLabels);
begin
  FLabels.Assign(Value);
end;

initialization
  InitGrayPal;

finalization
  DeleteObject(HGrayPal);

end.

