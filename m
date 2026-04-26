Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C236EAAD;
	Mon, 27 Apr 2026 03:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261891; cv=none; b=bvcmnBML+XD/njF+9Im4Q+jkiaRG9MUlbzOv/vAPsKTPm5cCXTIRf5IScEuywohKJIYZnymmvdmv9pazOacrNNLoXGmjVQ4iAPOD/Sp9T/jg5mHp+oHEVgFsX7jATdq9B0Z/JrLLlYVBARMg/NMQGfSnIxR2KHD81tlQZfBD1oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261891; c=relaxed/simple;
	bh=kgrZhrDsNdZCAEWzjqJ/9ea/hZ8lrp+fXLwdM8dcJuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZt4QTWfGnYCasfDi0T3h9LX/1xiqfQXlzQ307SZnDXGuZ2F2bKMRqjsaaOkLvzMAbCI2Y5SYVuJexhvPLBe92tBn/xG2wCGlvrXjbpx7SPvWnB3J21UqWMnjnTqAFItfzFdefoOKFtoAE9q2YZ028BRkSkT2Rd+1/3PxqVSuzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Iyzf3+Bk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Iyzf3+Bk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F68C2BCB5;
	Mon, 27 Apr 2026 03:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261891;
	bh=kgrZhrDsNdZCAEWzjqJ/9ea/hZ8lrp+fXLwdM8dcJuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iyzf3+BkADEisYzVxNWe65q9mjeak/SNxir3cgYPjTXAGNlMLsXYCsUfqFiqH6Kwa
	 bexvW3AWIEyuLiiW6qB6OwRLoktTpy/Lpr2alvPxDUoPkOIJOcjlZhLT2K0lBEttB0
	 R6T3/ZZEjhaK5NzMHTgR7p5qFaRYed3tp0N2A+lg=
Date: Sun, 26 Apr 2026 22:11:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: mgcvale <miguelcvalealt@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: rtl8723bs: replace NULL comparison with NOT
 operator
Message-ID: <2026042613-oasis-unbeaten-addc@gregkh>
References: <20260423184219.827694-1-miguelcvalealt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423184219.827694-1-miguelcvalealt@gmail.com>

On Thu, Apr 23, 2026 at 03:42:02PM -0300, mgcvale wrote:
> Fix checkpatch error "Comparison to NULL could be written
> "!psta"" in ioctl_cfg80211.c:2432
> 
> Signed-off-by: mgcvale <miguelcvalealt@gmail.com>
> 
> ---
> Hey, this is my first patch, so I appreciate any feedback.
> Thanks!
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index fd3bae31b0ed..8ae3adecafd9 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
>  	spin_lock_bh(&pstapriv->asoc_list_lock);
>  	psta = rtw_sta_info_get_by_idx(idx, pstapriv);
>  	spin_unlock_bh(&pstapriv->asoc_list_lock);
> -	if (psta == NULL) {
> +	if (!psta) {
>  		ret = -ENOENT;
>  		goto exit;
>  	}
> -- 
> 2.52.0
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
