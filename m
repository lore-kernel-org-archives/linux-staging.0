Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AA117F
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 06:44:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E70D611C9;
	Tue, 25 May 2021 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621925087;
	bh=q6tOHwTA4eDVLl4udWhI+70kGQYWA5Na2JU2YzoQU3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=le2y4GBJxU7DL/LOy5iyliI7ru8t6R0W6f/EcC9TiKODTFPs5Ocj61HA0POMdvz8Z
	 rc/QC9qnU5L6FrbjW3/MlNhbRck4jD6KX3mC8+wjik9u39WP1oUyeUcEOGREjA8s/v
	 NEa9XknBTuK1BFArpp8oWCAPTaAPYr8I+HN52+rA=
Date: Tue, 25 May 2021 08:44:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: remove ASSERT and ODM_RT_ASSERT
 macros
Message-ID: <YKyc3AM51xODwW0Q@kroah.com>
References: <20210524224532.1230-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524224532.1230-1-phil@philpotter.co.uk>

On Mon, May 24, 2021 at 11:45:32PM +0100, Phillip Potter wrote:
> Remove the ASSERT and ODM_RT_ASSERT macros from include/odm_debug.h
> as they are unnecessary.
> 
> ASSERT does nothing, compiling to a single empty statement.
> ODM_RT_ASSERT is used in only one place, in the ODM_RAStateCheck
> function with hal/odm.c - it seems to have been intended as an
> assertion of some kind, but given it is always called with false
> here, there is little point in it not just being a pr_info() call.
> 
> Also, the lines relating to the file, function and line number are
> not needed as the pr_info() with the function name and error message
> is sufficient should anyone wish to track down this error at a source
> level, within what is currently a relatively small function.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/rtl8188eu/hal/odm.c           |  2 +-
>  drivers/staging/rtl8188eu/include/odm_debug.h | 13 -------------
>  2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
> index 4d659a812aed..b800d0c6dff5 100644
> --- a/drivers/staging/rtl8188eu/hal/odm.c
> +++ b/drivers/staging/rtl8188eu/hal/odm.c
> @@ -824,7 +824,7 @@ bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate
>  		LowRSSIThreshForRA += GoUpGap;
>  		break;
>  	default:
> -		ODM_RT_ASSERT(pDM_Odm, false, ("wrong rssi level setting %d !", *pRATRState));
> +		pr_info("%s(): wrong rssi level setting %d!\n", __func__, *pRATRState);

I know you're just copying what the existing code does, but this really
should just be a dev_err() call instead.  It's not "info", and as this
is a driver, dev_*() should be called instead.

So I'll take this one, but for future cleanups, consider changing the
pr_*() calls to the correct ones.

thanks,

greg k-h
