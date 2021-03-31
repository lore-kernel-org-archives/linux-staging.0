Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A96F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 10:27:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3ED1061985;
	Wed, 31 Mar 2021 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617186442;
	bh=At+KgA3+yqtYvjyHzeiOYBunO6Ha+W24cy9kRqbtE14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9ACvFXjLPyr6CUODgOstCfZ60GfhvGKEArB2wH+vHXEbQg2zvoB7toAXDbKqyxRM
	 cU5P5QQJ8pKq+ybmQyeIpcjWcU5wsaAeNZvBx/LjjhNQs4MRxgSEv8CQZpnc91ROoD
	 VTWXEHFJ49tI+PBuYhKbmeRLhyJTiVhCC+lTM40E=
Date: Wed, 31 Mar 2021 12:27:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/40] staging: rtl8723bs: replace RT_TRACE with public
 printk wrappers in core/rtw_eeprom.c
Message-ID: <YGROiD19tgF8XnK6@kroah.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
 <39c2cd878bc914a00e71ea988c3cacb651670822.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39c2cd878bc914a00e71ea988c3cacb651670822.1617183374.git.fabioaiuto83@gmail.com>

On Wed, Mar 31, 2021 at 11:39:31AM +0200, Fabio Aiuto wrote:
> replace private macro RT_TRACE for tracing with in-kernel
> pr_* printk wrappers
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_eeprom.c | 26 ++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> index 3cbd65dee741..6176d741d60e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
> @@ -36,7 +36,7 @@ void shift_out_bits(_adapter *padapter, u16 data, u16 count)
>  _func_enter_;
>  
>  	if (padapter->bSurpriseRemoved == true) {
> -		RT_TRACE(_module_rtl871x_eeprom_c_, _drv_err_, ("padapter->bSurpriseRemoved==true"));
> +		pr_err("%s padapter->bSurpriseRemoved==true", DRIVER_PREFIX);

As Dan said, this is not the same thing.  You are now always printing
out this mess, when before you were not unless you explicitly enabled
"tracing".

And you are sending it to the error log?

And finally, drivers should never be using pr_*() for messages, they
should be using dev_*() instead as they are a driver and have access to
a device pointer.

thanks,

greg k-h
