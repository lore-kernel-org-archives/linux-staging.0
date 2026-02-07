Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33735823DD;
	Sat,  7 Feb 2026 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770466077; cv=none; b=dDaJJFGt7ZLBtSarBRXBbRXNx6URco5aMHkBkzmRlssCg9+OMDWT/v6IppG8mdWxbFlYu0svhqWX2oSqYEcB5GeT9XnxBQQOWQeK70OlQmbCk01Tfd7XDLDhipgQm4VLER6kd84YRO/7la/4KglWeBOfYRh5V4APZRTbavCwOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770466077; c=relaxed/simple;
	bh=Uv7qdB4ZIuOyfK8CbjcF1nflubvpJiXCzZhKr3YH0X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtYLy2F3rUDXIXzCu3E45voP9L7eyUWvdK1zgHHbcmxhAC7lBUn9ApiJhwjGCP8s7hC3CXaCwaD60gZYxb9/ZJiR6Y/ZykGyck1gckiqwU0RimOb+9Q/rgjOvmfk7EYwpqhOW2j96djyEpBy5lV3NSSLN+nxUCw5LT3SSsOSF9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DdqPxRHZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DdqPxRHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9ADC116D0;
	Sat,  7 Feb 2026 12:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770466076;
	bh=Uv7qdB4ZIuOyfK8CbjcF1nflubvpJiXCzZhKr3YH0X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdqPxRHZznSvwdFk5Xse9lYjs7EoOcHeQaZj3QS8TKVknX9PSVi8xebgtgkfUMFtv
	 zCmTHc8mpzP10/s1zPCSBzQ9iZY33BiDZVvIoeiVACzMCNYy2dI2jP75w9Gy5v1Mof
	 83DY2aQrzVTGlto7BeFpxdoTy3YcX6/IkyxLrjfI=
Date: Sat, 7 Feb 2026 13:07:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Madhab Sharma <madhabsharma94@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use usleep_range over msleep for
 short delays
Message-ID: <2026020720-afternoon-fasting-8edb@gregkh>
References: <20260129145625.17918-1-madhabsharma94@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129145625.17918-1-madhabsharma94@gmail.com>

On Thu, Jan 29, 2026 at 02:56:25PM +0000, Madhab Sharma wrote:
> msleep() is not suitable for short delays. Use usleep_range()
> to avoid excessive sleep time.
> 
> Signed-off-by: Madhab Sharma <madhabsharma94@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 21690857f..6a8b57564 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -128,7 +128,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>  		/* Tx buf allocation may fail sometimes, so sleep and retry. */
>  		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
>  		if (res == _FAIL) {
> -			msleep(10);
> +			usleep_range(10000, 11000);
>  			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
>  			if (res == _FAIL)
>  				goto exit;
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent a patch that has been sent multiple times in the past, and is
  identical to ones that has been recently rejected.  Please always look
  at the mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
