Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25653D647F;
	Tue, 31 Mar 2026 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946143; cv=none; b=bF6Wd7ffb04QDpukg+C6K21N63mytKtZVwBaRypOYZjnoH/EmtmhiU7FtGqT840Q1J/CEmElE1M0CwXMadPbASLr9V1ny9bUan70GsYSn8Gq1FH5IKYkjeAQHjidThNfZRDWVy71FvtJN6G2ZUBrdTWJYHMP5wX+uqWcxDh8Hg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946143; c=relaxed/simple;
	bh=hiJWiUO121BSFMlZzk+2OPZFXDUonnyo9KqOUM/4hMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu041ryF9VDhfb7N/Zyc0i66c4Hd7lObj2KpBnc/UQHUmrlcjsqFuxV+nRKkG9ZvyZb7mG9191vuIlRXbgxqXJ8r6C/pvzUjhnXhY0lLep8+4Phy1PCMw0fMteksRQiBNG+NQ1u2RGzQXW+OCznpazh6l1n519a5YLFjWnqq1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vcikmHj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vcikmHj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFB8C19423;
	Tue, 31 Mar 2026 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774946142;
	bh=hiJWiUO121BSFMlZzk+2OPZFXDUonnyo9KqOUM/4hMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vcikmHj3ylGmogH+mSXoCzAjzbIjTgmQ3fUD5LqZaNcm1MiEsb4oqLmlAlVS/IAv1
	 RZTD7kICmCvbanBN94OHx8qUDo9Ybe71pWXkRGftKXbuno2zYl2wKcrw5LR0oZrozg
	 +V/O9sRwM/4kKkAFtuD+mz8f6rrhirRLilzt2Z0Y=
Date: Tue, 31 Mar 2026 10:35:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: AyushMukkanwar <ayushmukkanwar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com, azpijr@gmail.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1) with fsleep(1000)
Message-ID: <2026033135-strangle-wobbly-1957@gregkh>
References: <20260320180257.40243-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320180257.40243-1-ayushmukkanwar@gmail.com>

On Fri, Mar 20, 2026 at 11:32:57PM +0530, AyushMukkanwar wrote:
> checkpatch.pl flagged that msleep() is inaccurate for short durations
> under 20ms.
> 
> Replace msleep(1) with fsleep(1000) to resolve the warning and align
> with modern kernel timer API standards.
> 
> Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index f074ea6e0f38..32a5e26bf6bc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -414,7 +414,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  			err = -1;
>  			break;
>  		}
> -		msleep(1);
> +		fsleep(1000);
>  	}
>  
>  	return err;
> @@ -567,7 +567,7 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
>  			break;
>  
> -		msleep(1);
> +		fsleep(1000);
>  	}
>  }
>  
> -- 
> 2.53.0
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
