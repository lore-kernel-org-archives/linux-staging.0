Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9C3FF1AE;
	Mon, 27 Jul 2026 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163773; cv=none; b=ZiErPJevPFqh4zusyr6xTw9fwi/+3GGe1Kqge7U/LLkP0sznhiKIYgoda8YGzp87l4He0ZlUPky44tq9UEXzynRRYW2J0zVRAM9YjecIUOBkJXtzVpLTZMEkB+lXOjmfwcT+wrtKFsBuZ/CymKU4jvIDe/iu1QJQvsXMORm1x1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163773; c=relaxed/simple;
	bh=h/7G7ghTinD7dqEYwR9JZgQwVZbWDnGJ6mfB4ruLgf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bS2XXSxKoWx2gMYy+HcZO+jqbSVnUDuR8FEnoFvgRh/JkxZboaOGNp+3ihyN/8KRTv2HNAnBBtQvVIBfcuWh9/0m62zB8KXxqCeCqlSOeGQ9xYfTmvFEVNoc7wfb1aRfOVXYEugW6dhMmK71ZJxbWCeKnb4RIDNf6zqxi2tdUy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JRJ/fcvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JRJ/fcvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F361F000E9;
	Mon, 27 Jul 2026 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785163771;
	bh=shr8DQ3kKhyJGlHSFs4oXZBcBCRu4dXzR4Qiyxc41ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JRJ/fcvLJjcX3z/poAXIQFejyjEy0vTn+phjcU/EXziAuJV3xmVcWqoAkA8lXkgbh
	 P/npqKKvOYJRRrqyIYdmZaqHm1caWp5aMYSm0Ip19Qi3xXXKSjxUBTUartxXq6aNgw
	 ukmWV/RlHQCZpx2lxxRW7a9T6MkTL0sdlOE5SkHg=
Date: Mon, 27 Jul 2026 16:49:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Max Raulea <max.raulea@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename camelcase variable psurveyPara
Message-ID: <2026072701-crewman-scrimmage-9cb8@gregkh>
References: <amdioVP1iDimngb5@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amdioVP1iDimngb5@archlinux>

On Mon, Jul 27, 2026 at 03:52:33PM +0200, Max Raulea wrote:
> Reported style issue by checkpatch in the rtl8723bs driver.
> 
> changed the variable name to psurvey_para to adhere to Linux Kernel
> coding style.
> 
> Signed-off-by: Max Raulea <max.raulea@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index d8ad1c75195b..6304b218bc2d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -525,7 +525,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
>  {
>  	u8 res = _FAIL;
>  	struct cmd_obj *ph2c;
> -	struct sitesurvey_parm *psurveyPara;
> +	struct sitesurvey_parm *psurvey_para;

Wait, sorry, no, this isn't right.

The leading "p" here is from the windows-style Hungarian notation,
trying to say this is a pointer.  When really, we know this as the
compiler knows and enforces it, so there's no need to add it to the
name.

So this really should just be survey_para, right?

thanks,

greg k-h
