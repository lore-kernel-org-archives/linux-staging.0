Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F01A9FB8
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761467608; cv=none; b=p9fm1vbxQi31/UjvSKDUbOW15S46rI9eWsTC1TsX5sLI//1qsApWT1Lsix6KZk2M8WFY3RE2rF6YV1YbVCm38Afyoa4LFCldUS23RajFBonIExYajKALp2xF/1BNvYPN1GCA0h3eiqZjBWxE3Uj0l1gdDmDrIBBxhM+q0F+qsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761467608; c=relaxed/simple;
	bh=pKOalrzGwUSDSFJYcAc+eiZNmXxTjSeJsTeYfrJsUag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmWg+jNkmQqlrp+GReDfTLQ2EgX6FLIexl5vlzLe8X3DREbasqmh7GfRM60tGq9mwiuYSD8+zdky2WXe1FzmwXSImR9VqWdbqZ0EgQ2SlDPWtf6pNIDYpiAgPYQfyzMoEOhVePXk99D/NGb8A2cqxSrmTITN9fst1Um6dPBN9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cnhYY5Ln; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cnhYY5Ln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1091C4CEE7;
	Sun, 26 Oct 2025 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761467608;
	bh=pKOalrzGwUSDSFJYcAc+eiZNmXxTjSeJsTeYfrJsUag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnhYY5LnylkKDROLbgh+6g9DOx4/y8fxRqramiE3tKCm1NKERJkRfrHm1wUHuEVi+
	 Ex8t5vsczTWsZ2UV6lopRsqmSAVUoHQ1J2WPVmQRiYb6NYQcC8GzjoIlxfngvMxBHS
	 F2Z0Rpncpb+vNPsmy1N5c2VCJb0/CajR74ZGBCPc=
Date: Sun, 26 Oct 2025 09:33:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace rtw_sprintf with scnprintf
Message-ID: <2025102649-dreamboat-dominoes-52a3@gregkh>
References: <20251025193658.175399-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025193658.175399-1-rafiqul713@gmail.com>

On Sat, Oct 25, 2025 at 09:36:58PM +0200, rafiqul713 wrote:
> Signed-off-by: rafiqul713 <rafiqul713@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index 8b1634f4091e..019792d0595a 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -119,6 +119,6 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
>  /*
>   * Write formatted output to sized buffer
>   */
> -#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
> +#define rtw_sprintf(buf, size, fmt, ...) scnprintf(buf, size, fmt, ##__VA_ARGS__)
>  
>  #endif
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
