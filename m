Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EE63BF665;
	Sat, 22 Aug 2026 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787392682; cv=none; b=Qmy5OLoLGbi1++za5vTGXNdgf+irB+7ENcQJf+8ewDoFaCSnBA+J2oYYziFsDzg6ypVX9m9oT3Y5kjlM80P5LND6+UC2tao7BRDj2ORzTz2IEeGvbKbfSuXOQJpe2vPo5am2gU8KxOaahGt8lnD0b+9KMD+VxueBphq+o4WvKJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787392682; c=relaxed/simple;
	bh=xCxRS1JcGXJeS4uZuL7ciGAJqxiOyP9cpVdNhI4KXC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok/iY6YeZ8cxc6qNx9mL3ZoG3KPlR07DcdGk5E31y7nDpSGy0gNUGlB/L4tL/Cj4z34gxXeERdMAKI/wbh98efBpoW7MR78reBS9JiSoXqoZ/bk0dQvq8X5HuqiNNbr7ICNYOowfct2QapdyCFlx/A6eu67jkZKPPIKigBRcMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NCFR1knF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NCFR1knF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69781F000E9;
	Sat, 22 Aug 2026 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787392680;
	bh=4gjBgjsHgXhqUIEobk0P0l72J/yKc9ubGvseLXmaR1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCFR1knF4UCFkG69bvkb+0DvG0B4Qh40YZPGDf7Jp11FEwQIBJlYms5nlLw2dj62C
	 XX+YKwzwwZrSlft0SKqr6q+3J3INsmGpc65cZIBcaLT6WE0a2bdWe8Hq6rnT3iyf5b
	 6GLDuTQvOFWkz8hc+FiQbJiS/HE4azbmRTGaPoOo=
Date: Sat, 22 Aug 2026 11:56:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtl8723bs: remove misleading comment
Message-ID: <2026082253-confound-matchless-8169@gregkh>
References: <20260822093943.94739-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822093943.94739-1-omer.e.idrissi@gmail.com>

On Sat, Aug 22, 2026 at 11:39:42AM +0200, Omer El Idrissi wrote:
> The comment says that rtw_unregister_cmd_alive function is called by
> the ISR while it is called by rtw_cmd_thread which runs in the kernel
> thread context, which is why it's being removed.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index b9f8cf1014ed..a0ae2849f2d7 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -891,8 +891,6 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
>  }
>  
>  /*
> - * Caller: ISR
> - *
>   * If all commands have been done,
>   * and no more command to do,
>   * then driver shall call this fun. to power down firmware again.
> -- 
> 2.53.0
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
