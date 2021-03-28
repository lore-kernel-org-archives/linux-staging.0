Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F285F
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 12:08:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14DA160232;
	Sun, 28 Mar 2021 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616933324;
	bh=XtGZd3bNPgaiElFYXcnf/Q4Cl7Hd4Zr72qj0OGHshHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kloGpqS8f+lUXnoy68FFx4ShbX17+KVIjoxKaDPIHU/MTk+b4ZvfRX/gRHj+UmEFR
	 vWsZrfZRndy1YBpihWnTX9THblMlWEjMtLutIkpZK/GyDesLONhn5emot4DQ6qmzjK
	 BkRk/zhorWnu992x9+/gr72f7HdjmmI3cG1oD4yI=
Date: Sun, 28 Mar 2021 14:08:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: dan.carpenter@oracle.com, david.laight@aculab.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/20] staging: rtl8723bs: put parentheses on macros
 with complex values in include/rtw_debug.h
Message-ID: <YGBxyZyj3o6fT//G@kroah.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
 <f36448ddc1553a018f700983b5d436eacaef9cb3.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f36448ddc1553a018f700983b5d436eacaef9cb3.1616854134.git.fabioaiuto83@gmail.com>

On Sat, Mar 27, 2021 at 03:24:08PM +0100, Fabio Aiuto wrote:
> fix the following checkpatch warning:
> 
> ERROR: Macros starting with if should be enclosed by a
> do - while loop to avoid possible if/else logic defects
> +	#define RT_PRINT_DATA(_Comp, _Level,
> 	_TitleString, _HexData, _HexDataLen)			\
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtw_debug.h | 28 ++++++++++---------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
> index d1c557818305..b00f8a6c4312 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_debug.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
> @@ -236,19 +236,21 @@
>  #if	defined(_dbgdump)
>  	#undef RT_PRINT_DATA
>  	#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData, _HexDataLen)			\
> -		if (((_Comp) & GlobalDebugComponents) && (_Level <= GlobalDebugLevel))	\
> -		{									\
> -			int __i;								\
> -			u8 *ptr = (u8 *)_HexData;				\
> -			_dbgdump("%s", DRIVER_PREFIX);						\
> -			_dbgdump(_TitleString);						\
> -			for (__i = 0; __i < (int)_HexDataLen; __i++)				\
> -			{								\
> -				_dbgdump("%02X%s", ptr[__i], (((__i + 1) % 4) == 0)?"  ":" ");	\
> -				if (((__i + 1) % 16) == 0)	_dbgdump("\n");			\
> -			}								\
> -			_dbgdump("\n");							\
> -		}

This whole nightmare needs to just be deleted and any callers of it need
to use the in-kernel functions for this instead.

thanks,

greg k-h
