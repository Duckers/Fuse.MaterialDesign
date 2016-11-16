using Uno;
using Uno.UX;
using Uno.Graphics;

using Fuse.Drawing;
using Fuse.Internal;
using Fuse.Elements;
using Fuse.Resources;

namespace Material
{
	public class CircleFill : DynamicBrush
	{
		static Selector _colorName = "Color";
		float4 _color = float4(1);
		[UXOriginSetter("SetColor")]
		public float4 Color
		{
			get { return _color; }
			set { SetColor(value, null); }
		}

		public void SetColor(float4 value, IPropertyListener origin)
		{
			if (_color != value)
			{
				_color = value;
				OnPropertyChanged(_colorName, origin);
			}
		}

		static Selector _centerName = "Center";
		float2 _center;
		public float2 CircleCenter
		{
			get { return _center; }
			set
			{
				if (_center != value)
				{
					_center = value;
					OnPropertyChanged(_centerName);
				}
			}
		}

		static Selector _radiusName = "Radius";
		float _radius = 10;
		public float Radius
		{
			get { return _radius; }
			set
			{
				if (_radius != value)
				{
					_radius = value;
					OnPropertyChanged(_radiusName);
				}
			}
		}

		//translate to/from element position to get the correct UV coordinates based on _container.Sizing
		float2 ElementPosition: req(TexCoord as float2)
			CanvasSize * TexCoord;
		FinalColor : float4(Color.XYZ, Color.W * Math.Clamp(Radius - Vector.Distance(pixel ElementPosition, CircleCenter), 0, 1));
	}
}