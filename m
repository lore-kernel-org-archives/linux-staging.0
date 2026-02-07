Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73C23090EE;
	Sat,  7 Feb 2026 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770469775; cv=none; b=LXKufgn2uzMY1apKzEqJBerbLwDtqMSx+kdAnNml+LUSbfX75W7SwM0Z/n+0DxNdg9hBnEeNf93Zt7ObVi9MAYdb86c5wKBfeRtNGZGoZI2z+hXCtzwXxW9Jnm7H0LZ0sQ2KP8u3NXDW6MXNceA2H1AnBVOzUlZfj5uodK5kXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770469775; c=relaxed/simple;
	bh=VWbBJM3NhfTdSEHndiJwQ5eHgZ2n4Vrsj+ATccfFj7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLE5lDhIiYcrVb224WV5kpHEqt9f4z6RSCr8wKShhgZNDP+zq4OWA9qhHQWp+OUqZLqfhIhAELsv2vY9E/hU8LDhlOOoBEBrm2Mbv6jZkbWBMKWTWaDG/JGNcVKVwoohMV5QPQBYe4uhsTFeiDd86JETqO8wWwasD1Am3r29WVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XgwjGw1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XgwjGw1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5659C116D0;
	Sat,  7 Feb 2026 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770469775;
	bh=VWbBJM3NhfTdSEHndiJwQ5eHgZ2n4Vrsj+ATccfFj7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgwjGw1lGzr3rru/rLEaaZQ+Q+AjxTYuIlp6lLtDmCEf8BwNxkgcfUOHTKzg5aEmF
	 PoNbpJNYQm1WYiopChYSkcvFfDEAXTiTaMFcOgWhRsHEjno9652pCjcXysinHubGst
	 UWpe3Rs1QECu92xVbe+V7zPB50EeWgrMPb2SWGIM=
Date: Sat, 7 Feb 2026 14:09:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fu Zang <t1468150755@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove dead code in rtw_mlme_ext.c
Message-ID: <2026020719-oxymoron-untrue-43a7@gregkh>
References: <20260131071507.32677-1-t1468150755@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131071507.32677-1-t1468150755@gmail.com>

On Sat, Jan 31, 2026 at 03:15:07PM +0800, Fu Zang wrote:
> This patch removes a block of code guarded by if (0).
> It appears to be leftover debug code that manually prints
> packet hex dumps.
> 
> The kernel has standard facilities for hex dumps (print_hex_dump),
> and keeping dead code with manual loops serves no purpose.
> 
> Signed-off-by: Fu Zang <t1468150755@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index ac49bfbaa5bb..0700d4318cd8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1865,14 +1865,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
>  	default:
>  		break;
>  	}
> -	if (0) {
> -		int pp;
> -
> -		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
> -		for (pp = 0; pp < pattrib->pkt_len; pp++)
> -			pr_cont(" %02x ", pframe[pp]);
> -		pr_cont("\n");
> -	}
>  
>  	return _SUCCESS;
>  }
> -- 
> 2.43.0
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
