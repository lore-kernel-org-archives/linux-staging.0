Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F5377544;
	Wed, 18 Mar 2026 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848869; cv=none; b=RgZqCZNuak9oygkNPtB7T+j43EaeTU2CslEUUHcQknp/vp+PpUrZjVac6fZx7IlCtYtDMAAQYnEunWwgWRKWB62LlBzDyx39/bAFsoNLVPCDc+Q14XFeXps0iLSA3y84L+b7EEKUEQOv6s3RSSLMFpVeLgqM/Mhkwi1YD4t2aqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848869; c=relaxed/simple;
	bh=0pTP29DY4hB0ua91bZ0LyiPqmHcjZa9Au5Ezl/PHQqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS+15sVFLBgWDYRc+f06w7IE+5R2cQEFBzO/beQBwmWakEPCHodOXBB3WX81ee28KO143eoa2Crfi8LerCApf4RGjG3BkGvm+Dg2JZvuyMfTd+yurADkCSoZrl5YKEHejUiZ4Ot2apZgRjuXOFUKASZ+ob+F0tRZqxG4lOnXNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZzMoXoXk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZzMoXoXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA3DC19421;
	Wed, 18 Mar 2026 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773848868;
	bh=0pTP29DY4hB0ua91bZ0LyiPqmHcjZa9Au5Ezl/PHQqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzMoXoXkqLLKrPJIpIEm3wvhxmHTJgXDintgrIF3FGuKWyL2XliBTr5SItXTj4atW
	 8EZC/39KxdvEumPCzxj+ZWMsKHOBp5aQfhhUAhswPGiDLuqJ4sq+e50RicU0cccVfl
	 KNzTYMKyRuHeYXbxgeJqMNCECS1nHFRwYn/DUxX4=
Date: Wed, 18 Mar 2026 16:47:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dipesh Chaudhary <me@dipeshchaudhary.in>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: add missing blank line after
 declarations
Message-ID: <2026031832-truth-crumb-752d@gregkh>
References: <c34f031c-3271-47cc-9a06-fc3406a25aac@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34f031c-3271-47cc-9a06-fc3406a25aac@smtp-relay.sendinblue.com>

On Mon, Mar 09, 2026 at 05:49:04PM +0000, Dipesh Chaudhary wrote:
> 
> Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
> to satisfy checkpatch warnings and improve code readability.
> 
> Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
> ---
> v3:
>  - Corrected the changelog location to be below the --- line.
> v2:
>  - Capitalized name in Signed-off-by.
>  - Wrapped commit description to 72 characters.
>  - Fixed duplicate submission issues.
> 
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 666e241704d9..bd295bdd73f6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -991,6 +991,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
>  inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
>  {
>  	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
> +
>  	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
>  }
>  
> -- 
> 2.47.3
> 
> 
> 
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
