Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8A291C09
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667217; cv=none; b=ToFPf1fuvGHJJdOzazI4wwueL6zXG6U2sp1m5UaZ5jQWLH+GCy0RyrdPkSonlKr6fEvHCskr9nJ2JA20XJflzxdtCfcfxkMpMCy4lw1s65oQpIzhOSJEXJrIfownTlVt3WzlqISr/eViUuxHWQXg+LOxoA+FRPGjSbAAni1ZF6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667217; c=relaxed/simple;
	bh=9J6L7nD5y/l9QYLzuxnlujD/YX9mrzTzB85d/jCYy7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQKV08qh4qg6HPQboqdjjy/QDLDTxCfQmwdIYOX80f+uK1uoN0Wi5chYwZ3nBdx0VCqIzMbrGcGuHvixGLNWs4v+abmS2BqKDuuBEX+FSCCR7Hokx2uyoxONqH54d90AumqTgAnY3RAIxO13/a+leXC3YejTWN4A47hKwWoc+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DxcKQ7NF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DxcKQ7NF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4F1C4CEF0;
	Wed, 16 Jul 2025 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752667216;
	bh=9J6L7nD5y/l9QYLzuxnlujD/YX9mrzTzB85d/jCYy7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DxcKQ7NFejD2UUMN4Nnr5i9E23UJP14r4w01Mdl43gSMhpT69dI62F2/E87/Zg9gu
	 0G3VlnUBesfeS90B9KEOIhzENbCyYbgTiQqPYWD0gpHRj+L1USgKapyZq0deqftaNz
	 Ez7Rdp1YGcghOztDfdWQL+1fpTdjVeE964G03Tao=
Date: Wed, 16 Jul 2025 14:00:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/3] staging: rtl8723bs: add missing blank line after
 declaration
Message-ID: <2025071610-level-puritan-d840@gregkh>
References: <20250716113740.73025-1-ignacio.pena87@gmail.com>
 <20250716113740.73025-2-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113740.73025-2-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:37:39AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Fix checkpatch warning by adding required blank line after variable
> declaration in Efuse_CalculateWordCnts function.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index abc123def..def456abc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -84,6 +84,7 @@ u8
>  Efuse_CalculateWordCnts(u8 word_en)
>  {
>  	u8 word_cnts = 0;
> +
>  	if (!(word_en & BIT(0)))
>  		word_cnts++; /*  0 : write enable */
>  	if (!(word_en & BIT(1)))
> -- 
> 2.39.5
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
