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
	
		readonly Text _text;

		public IconBase() 
		{
			_text = new Text();
			_text.Font = _iconFont;
			Children.Add(_text);

			Symbol = IconName.Menu;
			_text.FontSize = 20;
		}

		IconName _symbol;
		public IconName Symbol 
		{
			get { return _symbol; }
			set 
			{
				if (_symbol != value)
				{
					_symbol = value;
					_text.Value = new string(new char[] { (char)(int)_symbol });
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