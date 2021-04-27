Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9108972
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 11:04:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 513F461059;
	Tue, 27 Apr 2021 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619521452;
	bh=cqPRQBwFdJsS+yR4cI8L7m7kv5wtmCh0H022sKhkUcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJXwR/TeTiSvcYz/LUHCnFGUuuwehU1xawHu4FgOksv7XU07iD0hT4hwG62rfSr9i
	 4aQcVZ3eFDQKzOVQ9XhRqT/KAsX2TvUHEs0j7pii3zCT38eKY1dXvpF1qtltOTDvM8
	 FKrZig1N2/DCib39F6OtxtCzKj5P2AbIXgnjc47s=
Date: Tue, 27 Apr 2021 13:04:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 50/50] staging: rtl8723bs: macro DRIVER_PREFIX expands
 to lowercase driver name
Message-ID: <YIfvqU2bEpDSj/hK@kroah.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
 <c986e9a3c9b2f73cb784bd5dc7c877eb9a669c89.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c986e9a3c9b2f73cb784bd5dc7c877eb9a669c89.1619254603.git.fabioaiuto83@gmail.com>

On Sat, Apr 24, 2021 at 11:02:33AM +0200, Fabio Aiuto wrote:
> macro DRIVER_PREFIX expands to lowercase driver name.
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtw_debug.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
> index 189f02a8300a..3a5b083e95a1 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_debug.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
> @@ -7,7 +7,7 @@
>  #ifndef __RTW_DEBUG_H__
>  #define __RTW_DEBUG_H__
>  
> -#define DRIVER_PREFIX "RTL8723BS: "
> +#define DRIVER_PREFIX "rtl8723bs: "

KBUILD_MODNAME should be used here, in the future.

But really, this shouldn't be needed at all, it's kind of pointless (if
it is being used, then odds are the places it is being used is wrong...)

thanks,

greg k-h
