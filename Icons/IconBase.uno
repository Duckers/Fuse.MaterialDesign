using Uno.IO;
using Uno.UX;
using Fuse;
using Fuse.Elements;
using Fuse.Controls;

namespace Material
{
	public class IconBase: LayoutControl
	{
		static Font _iconFont = new Font(new BundleFileSource(import BundleFile("materialdesignicons-webfont.ttf")));
	
		readonly Fuse.Controls.Text _text;

		public IconBase() 
		{
			_text = new Fuse.Controls.Text();
			_text.Font = _iconFont;
			Children.Add(_text);

			Icon = IconName.Menu;
			_text.FontSize = 20;
		}

		IconName _icon;
		public IconName Icon 
		{
			get { return _icon; }
			set 
			{
				if (_icon != value)
				{
					_icon = value;
					_text.Value = new string(new char[] { (char)(int)_icon });
				}
			}
		}

		public float4 Color
		{
			get 
			{
				return _text.Color;
			}
			set
			{
				_text.Color = value;
			}
		}

		public float Size 
		{
			get 
			{ 
				return _text.FontSize; 
			}
			set 
			{
				_text.FontSize = value;
			}
		}
	}
}