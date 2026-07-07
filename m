Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0319D3BD225;
	Tue,  7 Jul 2026 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422697; cv=none; b=cAGx6yFfHC1fndaD2WlflI4chQM1AnjB8UgDe16N5AzrZyG1blJrDXHtPw54F0k9JNEs0s3OAonM2tOKQOyO8/Jjeu0waloq0zegxn735ayl2nIrjosDqiffaKrPUsaYVw1E4tkEV8FXFoHg9k2suEvtObxX8Nn+1MPVxzhvtMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422697; c=relaxed/simple;
	bh=fmqrbjhhvkxKLyNxh3pN+d0U2+NEdAo4PlqJdeUennk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8sTy8Xum5qMYvAgNjCRUd0k8dMpKpFV5yr11FaY6TC+bu9KpF0RGYfsWsFhoc54lIiG4NSTnc84VbST/9rCyZ4b8tnRnuE7E8Hu6Vc1H7GEdl9euGdJVx+elKivVP4cUvJ0O8QrComag907kREwe+/qcTw63dfan5wkan1oSvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uuzuv8tJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uuzuv8tJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BDE1F000E9;
	Tue,  7 Jul 2026 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422695;
	bh=S0Alviu2TTT/2XOeJO1jnZN0zaxdKG6KEtxKHtF/6C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uuzuv8tJfjxA7lX0UlqYUOLQ3mloPyOmXg6Zd75MGlbfu5+pb84kXBRYlKKPfwnkE
	 OTkrVOi/87ELZ1qLkwvEFzRHVxd5sdA0ToJ9TsmBKhM+twGL6nGH5Hwqc412IqGbIU
	 jkqV79LieBGRqJbxfiA25U/VHFaqPWNhtMTi7nPY=
Date: Tue, 7 Jul 2026 13:11:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: remove unused rtl8192c function
 declarations
Message-ID: <2026070721-retorted-geologist-02e3@gregkh>
References: <20260619083736.577096-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619083736.577096-1-inasj268@gmail.com>

On Fri, Jun 19, 2026 at 09:37:34AM +0100, Jad Keskes wrote:
> Remove two function declarations from rtl8192c_recv.h that have no
> implementation and are never called in the rtl8723bs driver:
> 
>   - rtl8192c_translate_rx_signal_stuff()
>   - rtl8192c_query_rx_desc_status()
> 
> These are leftovers from the original Realtek multi-chip codebase
> and relate to the RTL8192C family, not the RTL8723B.
> 
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> index 1f86654f0403..b63625ab4e45 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> @@ -30,7 +30,4 @@ struct phy_stat {
>  /*  Rx smooth factor */
>  #define	Rx_Smooth_Factor (20)
>  
> -void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
> -void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
> -
>  #endif
> -- 
> 2.54.0
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
