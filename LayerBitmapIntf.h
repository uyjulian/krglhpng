
// Shim class for compatibilty purposes.
#ifndef __LAYERBITMAPINTF_H__
#define __LAYERBITMAPINTF_H__

class tTVPBaseBitmap
{
	tjs_uint width;
	tjs_uint height;
	void * callbackdata;
	tTVPGraphicSaveScanLineCallback scanlinecallback;
	bool is_32bit;
public:
	tTVPBaseBitmap(tjs_uint in_width, tjs_uint in_height, void * in_callbackdata, tTVPGraphicSaveScanLineCallback in_scanlinecallback, bool in_is_32bit = true)
	{
		width = in_width;
		height = in_height;
		callbackdata = in_callbackdata;
		scanlinecallback = in_scanlinecallback;
		is_32bit = in_is_32bit;
	}

	/* metrics */
	tjs_uint GetWidth() const
	{
		return width;
	}
	tjs_uint GetHeight() const
	{
		return height;
	}

	/* scan line */
	const void * GetScanLine(tjs_uint l) const
	{
		return scanlinecallback(callbackdata, l);
	}
	bool Is32BPP() const
	{
		return is_32bit;
	}
};

#endif
