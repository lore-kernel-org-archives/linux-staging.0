Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486983B8920;
	Mon, 11 May 2026 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486796; cv=none; b=ioc1e8gg+ZRfYLYI6McWY4jLLUM+FHjA149HNe7isixKlkO8nb6/yjXFmlNABSAp52VpGQRREstXw26/w+bm9wkquNjWl+Cnktjb5rDfScaB7W2WpUjATBdgUnLjPziSORbeqHBA2A63RVJAgDESt6hLuFUoXAD+qfJME6dbJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486796; c=relaxed/simple;
	bh=7UR8iYVQj51AXUDNtE6iLgmDJkABXjrzAFvHt5Z4YlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lz5VJVLnlCtj9ZgyKNMUqmnFEXAqsqa7+UWseoAtokALEsaU1SDuH90y8zfLPHf+0jSzYfzlc9AYyXEicTh3aYLLUZyLYPC9w+f09hLUkcJ92cqr2bj2a9Ic4XYx2hgBeRUci1jl21SzkaxkUVegB7hD6m3pIF3PaqJB44LVarc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PUcc0wd5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PUcc0wd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B95C2BCB0;
	Mon, 11 May 2026 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486793;
	bh=7UR8iYVQj51AXUDNtE6iLgmDJkABXjrzAFvHt5Z4YlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUcc0wd5B1V0B/DsPtAjtV9B8ae86zvREBxoi1Hy5T71hP5ewpwTPeGuDMoD7kL5a
	 EJ+/AnXpoq5trYZaD5ZvaVAuaZ95W5Fz17Bh1xucyvLRfNPcz9yXFNWjiQQFqN5Zur
	 y4mcQLq6U35XsbfRDS+bnYUti7nrU9FnGVIPUIFU=
Date: Mon, 11 May 2026 10:06:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sridhar Arra <sridhar.arra.dev@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range for
 1ms delay
Message-ID: <2026051118-device-paralegal-daf7@gregkh>
References: <20260509094059.22101-1-sridhar.arra.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509094059.22101-1-sridhar.arra.dev@gmail.com>

On Sat, May 09, 2026 at 03:10:59PM +0530, Sridhar Arra wrote:
> The checkpatch.pl tool warns that msleep() for values less than 20ms
> can be inaccurate and oversleep. This patch converts the 1ms msleep
> to usleep_range(1000, 2000) to ensure more precise timing in the
> power control path.
> 
> Signed-off-by: Sridhar Arra <sridhar.arra.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index f074ea6e0f38..cdbdcb7bde32 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -414,7 +414,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  			err = -1;
>  			break;
>  		}
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  
>  	return err;
> @@ -567,7 +567,7 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
>  			break;
>  
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  }
>  
> -- 
> 2.34.1
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

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
