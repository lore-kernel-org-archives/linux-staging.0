Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F573A1682
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360072; cv=none; b=BG1CUSZjMLMbRY6y/Z3E3wrHPiTHar9yuLw1yMDVkU4y63wrRJY1Wc4pzULk7NqUCBgoQ78NbrNuMaHdw6URyq3WnOvBMlvEzYs04HCGyePWqZMNWLiUWhqleg6OOs1iNrrBgB77MaBF/XGpxZT1LH+X1XM7L4WW8q1oJ18gwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360072; c=relaxed/simple;
	bh=EUCH3fjZFrzBj2Y08qYtYPKHQFMg7jg2mialfg78jn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdrwS9WeJp89ccwHnFzdRWVC2R2YtrDxai4r0B51FwoNQmFwtf1mOzBmDP6L3Rw9JKeTiHtOoATLZV/Z2qbbJWNkcRsxEcF35jYu0mktCFPWZZEfAPWSdmVH+Lj+Qxz8IGelMJEREy0PSQQLtzVQrj7sMlojQin7uuy+V3R5yf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jyc7+Dax; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jyc7+Dax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02141F000E9;
	Thu, 21 May 2026 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779360071;
	bh=kXXcI+EVMlblFCzRL4vbrQUH3Qf3LreO1BKchrakVD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jyc7+DaxvcIoBneOwUdItPb0IBATmuVVOch+ZTGpKmWBgCXqv6ERCAvxBom1qyRQW
	 FAb3J17C2GgpTxtiuDuAb++PmhUSlt4CCPJEi/nqddyMZKA5mHeEzBTV2hlxPVY3jC
	 SV3720a6dnwIVot2+6sJZt9cVsGHpnV8z0Sd26/E=
Date: Thu, 21 May 2026 12:41:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant comparison with true
Message-ID: <2026052157-drew-rocker-59c0@gregkh>
References: <20260517043520.47423-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517043520.47423-1-diegomancera.dev@gmail.com>

On Sat, May 16, 2026 at 10:35:20PM -0600, Diego Fernando Mancera Gómez wrote:
> Clean up the checkpatch.pl check: "Using comparison to true is
> error prone". Evaluating the boolean variable directly is preferred
> and more idiomatic in the Linux kernel.
> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index 07a6db1d2..349b27f91 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -531,7 +531,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr)
>  		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
>  
>  		if (!memcmp(paclnode->addr, mac_addr, ETH_ALEN))
> -			if (paclnode->valid == true) {
> +			if (paclnode->valid) {
>  				match = true;
>  				break;
>  			}
> -- 
> 2.43.0
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
