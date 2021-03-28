Received: from smtprelay.hostedemail.com (smtprelay0195.hostedemail.com [216.40.44.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70B95F
	for <linux-staging@lists.linux.dev>; Mon, 29 Mar 2021 02:38:30 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave03.hostedemail.com (Postfix) with ESMTP id A88F518025623
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 08:39:09 +0000 (UTC)
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay07.hostedemail.com (Postfix) with ESMTP id 64608181D1A04;
	Sun, 28 Mar 2021 08:39:03 +0000 (UTC)
Received: from [192.168.1.159] (unknown [47.151.137.21])
	(Authenticated sender: joe@perches.com)
	by omf17.hostedemail.com (Postfix) with ESMTPA id 31F8027DD24;
	Sun, 28 Mar 2021 08:39:02 +0000 (UTC)
Message-ID: <cc86b15eb81f55ce69da3b1169a083dc7ce9d85c.camel@perches.com>
Subject: Re: [PATCH v2 09/20] staging: rtl8723bs: put parentheses on macros
 with complex values in include/rtw_debug.h
From: Joe Perches <joe@perches.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, david.laight@aculab.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sun, 28 Mar 2021 01:39:01 -0700
In-Reply-To: <f36448ddc1553a018f700983b5d436eacaef9cb3.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
	 <f36448ddc1553a018f700983b5d436eacaef9cb3.1616854134.git.fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 31F8027DD24
X-Spam-Status: No, score=0.10
X-Stat-Signature: y3e6yff38rg3subzikg88eh5hgsjiy39
X-Rspamd-Server: rspamout04
X-HE-Tag: 1616920742-151709

On Sat, 2021-03-27 at 15:24 +0100, Fabio Aiuto wrote:
> fix the following checkpatch warning:
> 
> ERROR: Macros starting with if should be enclosed by a
> do - while loop to avoid possible if/else logic defects
> +	#define RT_PRINT_DATA(_Comp, _Level,
> 	_TitleString, _HexData, _HexDataLen)			\
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>

It's good to use checkpatch as a guide to improve code, but this
particular code is just a mess to begin with and it makes a
complete mess of the the dmesg log if it's actually enabled.

Try substituting print_hex_dump_debug for this instead.

> ---
>  drivers/staging/rtl8723bs/include/rtw_debug.h | 28 ++++++++++---------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
> index d1c557818305..b00f8a6c4312 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_debug.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
> @@ -236,19 +236,21 @@
>  #if	defined(_dbgdump)
>  	#undef RT_PRINT_DATA
>  	#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData, _HexDataLen)			\
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
> +		do { \
> +			if (((_Comp) & GlobalDebugComponents) && (_Level <= GlobalDebugLevel))	\
> +			{									\
> +				int __i;								\
> +				u8 *ptr = (u8 *)_HexData;				\
> +				_dbgdump("%s", DRIVER_PREFIX);						\
> +				_dbgdump(_TitleString);						\
> +				for (__i = 0; __i < (int)_HexDataLen; __i++)				\
> +				{								\
> +					_dbgdump("%02X%s", ptr[__i], (((__i + 1) % 4) == 0)?"  ":" ");	\
> +					if (((__i + 1) % 16) == 0)	_dbgdump("\n");			\
> +				}								\
> +				_dbgdump("\n");							\
> +			} \
> +		} while (0)
>  #endif /* defined(_dbgdump) */
>  #endif /* DEBUG_RTL871X */
>  
> 


