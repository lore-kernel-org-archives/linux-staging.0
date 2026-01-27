Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41E28F50F
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523003; cv=none; b=JcQAuRp6umGcH1U6nJKu/QY4W0dbcvKa2QTkXvT1fTQmhDh5J/bo9pkbRSqQBYH4qJQ0iH2SyQqHaBkQauMehBHDYFP9oaW5/KaoInVizAmq/XIqwSWVp+UT2l0d2m28NlhOqF+gIBUHqhQPqaYsHzkGMFt+WC/rLd8ycMuLHBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523003; c=relaxed/simple;
	bh=tZJjbluGQF/XPXHM1AFr1JR6QFy2cgHLJ34XYoHq/pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5Q2kfETtt3gAV8RwG6UnQtpMlZWs34oh+0N4PSXxSLgFZPVOwPTVvuNwMyCM4mamebgJieJR2eGqELwcIGtFsoutD+oaT92Bhl9eOhEs2w/zzUGHYW0nvqn/XSm1g2i9G03dHt2aKS/bLlartSZbSVcVWVFYWUnjj3r356B93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MI16owAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MI16owAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406CAC116C6;
	Tue, 27 Jan 2026 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769523002;
	bh=tZJjbluGQF/XPXHM1AFr1JR6QFy2cgHLJ34XYoHq/pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MI16owAetnphOPARFuMuYIWXrqahvt6/CwakEsPDQqzlXDjp5caud7jwIgFzV6mxX
	 FO5rThTKcVPcCObhFJgzOsLzShjIaLF4uXIM5uKv/2vAx4Ai/ZkGni6qDCTtAEiIFY
	 zZndD9QEaiA57S5AduSCEKvCsvEj7tA0sN9fc9kU=
Date: Tue, 27 Jan 2026 15:09:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace and
 parentheses in rtw_mlme.c
Message-ID: <2026012736-herbal-grievance-fe20@gregkh>
References: <20260127140455.52887-1-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127140455.52887-1-giorgitchankvetadze1997@gmail.com>

On Tue, Jan 27, 2026 at 06:04:55PM +0400, Giorgi Tchankvetadze wrote:
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 98704179ad35..555d00da0456 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -710,7 +710,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
>  	rtw_set_signal_stat_timer(&adapter->recvpriv);
>  
>  	if (pmlmepriv->to_join) {
> -		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
> +		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
>  			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
>  				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
>  
> @@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
>  	return ielength;
>  }
>  
> -/* Ported from 8185: IsInPreAuthKeyList(). 
> +/* Ported from 8185: IsInPreAuthKeyList().
>   * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
>   * Added by Annie, 2006-05-07.
>   *
> -- 
> 2.52.0
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
