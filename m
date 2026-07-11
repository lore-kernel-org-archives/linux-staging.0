Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83091A0BF3;
	Sat, 11 Jul 2026 06:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783751475; cv=none; b=Ah7eADflYK+dtV4K3Dkv+DmkudPs/J3hr1Fy5Dp/Udteoh6YRSbLBK3geWcs9AV0L4t+pQfvVJs1f8WR7W5qxzfxaHAohRTR2AdL0lcnHNoiwqLnbuu4ox4BmeEQmAOtrEPBqLZsBFtvTnPfHepg0PB75gER97gwbbmzs6YAcUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783751475; c=relaxed/simple;
	bh=NFe9Ic/1NVlYz+tcyjqOhJclzm/vtDUrxdcT6ozgIO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjbxYIivlRyR2p0IIGazwC/FU9CujrX1nUP6PmCEOL1+kC+aSUo96+WCgo8Gk4kaKe8ZGSZkNNFvCpZlWF6N0hsGl9DGt+SL6M4Ih2+3NFNdwD/k8m4LeNyLR99u9g35CyHjWXBkw/y2D3mNsxbe0WfJeI7Cb3RT8wIOrW95JXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EBDCRVaz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EBDCRVaz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5251F000E9;
	Sat, 11 Jul 2026 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783751473;
	bh=aQY445B4G/ooeOCF95wJ8R+4836ZegncFETW960mkQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EBDCRVazkhNsIwHtU1UPwYg5om4pW1bUHrYyLjjsO3Dfy2ATWr8Zy72QpRh/cyUEB
	 OhJ2KSv0OHSewgWBQNmV8Kk0KU/yh/XrY3kBCBe5Xr7FGodFmLUOwV+7KacDPjNJaX
	 ILFRPULr32E0FgE6ERs6BXY0GIP3OQaN57AIhXVA=
Date: Sat, 11 Jul 2026 08:29:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anantha Krishnan <ananthanr.off@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace magic number in
 InitBeaconParameters
Message-ID: <2026071142-alongside-game-9869@gregkh>
References: <2026071157-ovary-property-4427@gregkh>
 <20260711062248.28968-3-ananthanr.off@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711062248.28968-3-ananthanr.off@gmail.com>

On Sat, Jul 11, 2026 at 11:52:49AM +0530, Anantha Krishnan wrote:
> Per the bitfield comment in hal_com_reg.h, REG_TBTT_PROHIBIT packs
> a "setup" time in bits 3:0 and a "hold" time in bits 19:8. The
> rtw_write16() call here only writes the low 16 bits of that
> register, covering the full setup field and the low byte of the
> hold field.
> 
> Replace the magic number 0x6404 with two named constants
> representing these fields.
> 
> No functional change.
> 
> Bit-field positions are documented in the comment above
> REG_TBTT_PROHIBIT in drivers/staging/rtl8723bs/include/hal_com_reg.h.
> 
> Signed-off-by: Anantha Krishnan <ananthanr.off@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index bcaf63b2893c..699e24f52392 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -11,6 +11,13 @@
>  #include <rtl8723b_hal.h>
>  #include "hal_com_h2c.h"
>  
> +/*
> + * Bitfield layout per the comment above REG_TBTT_PROHIBIT in
> + * drivers/staging/rtl8723bs/include/hal_com_reg.h.
> + */
> +#define TBTT_PROHIBIT_SETUP     0x04  /* bits 3:0: setup time, unit 32us */
> +#define TBTT_PROHIBIT_HOLD_LOW  0x64  /* bits 15:8: low byte of 12-bit hold time, unit 32us */
> +
>  static void _FWDownloadEnable(struct adapter *padapter, bool enable)
>  {
>  	u8 tmp, count = 0;
> @@ -861,8 +868,8 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  
>  	rtw_write16(padapter, REG_BCN_CTRL, val16);
>  
> -	/*  TODO: Remove these magic number */
> -	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
> +	rtw_write16(padapter, REG_TBTT_PROHIBIT,
> +		    (TBTT_PROHIBIT_HOLD_LOW << 8) | TBTT_PROHIBIT_SETUP);/*  ms */
>  	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
>  	/*  so don't set this register on STA mode. */
>  	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
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
