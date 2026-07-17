Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D413F12EE;
	Fri, 17 Jul 2026 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290530; cv=none; b=Cr2kFmK9wdld8W8Lh8VUH+G1r29wNF9vGcIQytpE74ZEdwCNxElFcfsbuhMf3mct03GruRaU/yvn4/P7BPekqGqxky0XA/XvWkd8PTUFb/CQ/tv3RIh2UiC3fKDWdguppIwZLzuCyCVU/PIF1IRUd8vNdNwQlvYFTT9mby8hxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290530; c=relaxed/simple;
	bh=C6TjuoVAPsgn+X2OIB6hsXxljhktJd7RHFNIO9o8G1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4EOkS0cfF7oEJgKmhjz+xm4r3J0dKZIDngOAGrIzhE5PSkqDG8LyOlB4ZXKPF+zGBmlOLrmewXc5hr0RarPj9Pzc5wQvxa/vGqW2a264Tb0ZmwQSXslKi3ux+pbFRwZtVEErA36O1e2AIyBEsj6nLTfjx4oe6c9Cjyw1aumT2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gp7ZwrHg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gp7ZwrHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247E11F000E9;
	Fri, 17 Jul 2026 12:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784290518;
	bh=Vxmb9PzCPg79eQXP+9/yoEeoVh/vzwKATMC3xG08tP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gp7ZwrHghxK0Esc2Ui7SooqK5+fm5a8Xsm2cUYMkV2q+sFiPbIwPtcyh4nsnq7Brn
	 5MIaln3UPzks1296MAIokmgDhlkzKl2hNqP5CiMkz/y0+cdHH2WwnUS7VomAZ+Haya
	 Gh7agGkdX3HMKw8ENzSVn44j5h2oULGuaM2fNt5Q=
Date: Fri, 17 Jul 2026 14:15:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v7] staging: rtl8723bs: reformat rtw_efuse_read_1_byte()
 signature
Message-ID: <2026071700-legume-bleep-dae8@gregkh>
References: <20260713043448.27132-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713043448.27132-1-mokshpanicker.7@gmail.com>

On Mon, Jul 13, 2026 at 04:34:48AM +0000, Moksh Panicker wrote:
> Reformat the multi-line function signature to a single line to fix
> the following checkpatch.pl warning:
> 
> WARNING: function definition argument 'struct adapter *Adapter'
> should also have an identifier name
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index a0f5b4b7ab39..168ecb7a998f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>   * 09/23/2008	MHC		Copy from WMAC.
>   *
>   */
> -u8
> -rtw_efuse_read_1_byte(
> -struct adapter *Adapter,
> -u16		Address)
> +u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  {
>  	u8 Bytetemp = {0x00};
>  	u8 temp = {0x00};
> -- 
> 2.34.1
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
