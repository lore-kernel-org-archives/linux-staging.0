Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32668227BB9;
	Sat, 11 Jul 2026 05:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783746734; cv=none; b=Y8cua4aNo5imJGWjWiDBAzxVYvsqH9bkLgZzSX+rYdLJHRsGh5xCrLz9ht0jOnQM36CKWWf57QLtTUcq6LHfkA9WFRGScElFZFLQ1xRCjBNEnVXgJCoVpVsw4nEpEgpFMCKaVtnXWhMVc2aULeotzQl5kNAuBCAZ3u/4BP3u+Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783746734; c=relaxed/simple;
	bh=G1Iq23K0B4gfo4ne4iszMQr87JXtykYhHLMX2A5L2KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbDZaZdBIIvQtVyZ9Z9QMwbDrlv9WLTq7DGtnX2kw2WfLOInQlD67JWwLNKPeDCxa9y75GiglayoPJnGhNcfHO5pEJy7qLeaCTJ/aiWqp59zH7C2FGCH70TDlgpK0Rk7YL8vrwz13dJivAAXymZep3RehXM3r8HSqr3R+5qPC6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NF92WcgX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NF92WcgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8EA1F000E9;
	Sat, 11 Jul 2026 05:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783746732;
	bh=LyUfgqTOVya5vsYhV6H/mg0sjCeVfo0YhOEWY0Jzps0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NF92WcgXLsgdDYsmJSrzWs5uOW3EVCIZwqmgf8yBVMpq0d/tLSAVWnJdKjrrUtRbN
	 7txX6QCsvWZmThbQdpfynMwcMTYJh4mD8krbcGc6eq1fREpC70cugLehhx9Wh0isNQ
	 45A+F260zaM2+fxU/Tw3CmfjEVy6rJtEAv/UhMEY=
Date: Sat, 11 Jul 2026 07:11:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ananthan <ananthanr.off@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace magic number in
 InitBeaconParameters
Message-ID: <2026071157-ovary-property-4427@gregkh>
References: <20260711024005.19900-2-ananthanr.off@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711024005.19900-2-ananthanr.off@gmail.com>

On Sat, Jul 11, 2026 at 08:10:06AM +0530, Ananthan wrote:
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
> Signed-off-by: Ananthan <ananthanr.off@gmail.com>

We need a full name please.

> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index bcaf63b2893c..9609ae025736 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -11,6 +11,9 @@
>  #include <rtl8723b_hal.h>
>  #include "hal_com_h2c.h"
>  
> +#define TBTT_PROHIBIT_SETUP     0x04  /* bits 3:0: setup time, unit 32us */
> +#define TBTT_PROHIBIT_HOLD_LOW  0x64  /* bits 15:8: low byte of 12-bit hold time, unit 32us */

Where did that information come from?  Please document that.

thanks,

greg k-h
