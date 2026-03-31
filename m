Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337803DFC72;
	Tue, 31 Mar 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946137; cv=none; b=YJQZDKyZxOBqmKc1gMHZfdlKkoPcd/uiTGKuyZZzcP8wuU63nveZx6W3ATeinw5IE9cqh/CW6CMuuLrOi/1XJZH9IwpjupqMbzvd68tUB8qJEwVaoUPQ4cU33/9bTueR4zXqBppgoySe4esm5/9llHRCAzF/1AE36ePjIUIO4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946137; c=relaxed/simple;
	bh=GJ0hqSyWAKYFrKOhdArLUnc1UbyIHksLl2GR85bh/bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7LgtCgMkrChIE8eZbVoAW1ONvCkIH21kl2GvRqn8NKYDYLIQ5rHZsL7rBT7N6NQP/ajw7pKxJBxRVKtWCGHLDtphWWuBvZCQJRerDwV5lk7fRCjjJOqv4Z+EwoGdKs9w0+MEpkyu4TmxFLsNOKalpo6G76PzggCVGfKtbELNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RcrlSGj7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RcrlSGj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3E3C19423;
	Tue, 31 Mar 2026 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774946136;
	bh=GJ0hqSyWAKYFrKOhdArLUnc1UbyIHksLl2GR85bh/bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcrlSGj77RsQjiO8YfzTSYhnoT89cAMLxkMnIs6cVu6QRyWKQm9EvMmLVF6RVqj5N
	 tp7fASgFBl3DyyMvsqucfaGa2iJ9nTQnPu9q2NWKEd1GZvyiO1HIwWr7mTFhLyO1KZ
	 dpnc7ABuN2Lnv7IxrBZfMJgwJ8GAl9NbQU4tyx/4=
Date: Tue, 31 Mar 2026 10:35:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zile Xiong <xiongzile99@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep(1) with fsleep()
Message-ID: <2026033117-emit-deport-008b@gregkh>
References: <20260319191309.64198-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319191309.64198-1-xiongzile99@gmail.com>

On Fri, Mar 20, 2026 at 03:13:09AM +0800, Zile Xiong wrote:
> msleep(1) is not suitable for short delays due to scheduler
> granularity.
> 
> Use fsleep(USEC_PER_MSEC) instead, which provides a more
> appropriate delay for 1 ms sleeps.
> 
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      | 5 +++--
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c        | 3 ++-
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 +++--
>  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 3 ++-
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 5 +++--
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c       | 3 ++-
>  6 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index f074ea6e0f38..5751584b0f18 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -4,6 +4,7 @@
>   * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
>   *
>   ******************************************************************************/
> +#include <linux/delay.h>
>  #include <drv_types.h>
>  #include <hal_data.h>
>  #include <linux/jiffies.h>
> @@ -414,7 +415,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  			err = -1;
>  			break;
>  		}
> -		msleep(1);
> +		fsleep(USEC_PER_MSEC);
>  	}
>  
>  	return err;
> @@ -567,7 +568,7 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
>  			break;
>  
> -		msleep(1);
> +		fsleep(USEC_PER_MSEC);
>  	}
>  }
>  
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> index 2a2dd60be8bb..596a775329d9 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -5,6 +5,7 @@
>   *
>   ******************************************************************************/
>  
> +#include <linux/delay.h>
>  #include <hal_data.h>
>  #include <hal_btcoex.h>
>  #include <Mp_Precomp.h>
> @@ -98,7 +99,7 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
>  		if (utime > timeout)
>  			break;
>  
> -		msleep(1);
> +		fsleep(USEC_PER_MSEC);
>  	} while (1);
>  }
>  
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e794fe3caf9d..8159ad278a6b 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -5,6 +5,7 @@
>   *
>   ******************************************************************************/
>  
> +#include <linux/delay.h>
>  #include <linux/firmware.h>
>  #include <linux/slab.h>
>  #include <drv_types.h>
> @@ -28,7 +29,7 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
>  			if (tmp & 0x01)
>  				break;
>  			rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
> -			msleep(1);
> +			fsleep(USEC_PER_MSEC);
>  		} while (count++ < 100);
>  
>  		/*  8051 reset */
> @@ -1157,7 +1158,7 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
>  		if (passing_time > 1000)
>  			break;
>  
> -		msleep(1);
> +		fsleep(USEC_PER_MSEC);
>  	} while (1);
>  
>  	return ret;
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> index 7fac1c2ba8e0..14a14eeaf9d2 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> @@ -5,6 +5,7 @@
>   *
>   ******************************************************************************/
>  
> +#include <linux/delay.h>
>  #include <drv_types.h>
>  #include <rtl8723b_hal.h>
>  
> @@ -391,7 +392,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
>  
>  	rtw_write8(Adapter, REG_RF_CTRL, RF_EN|RF_RSTB|RF_SDMRSTB);
>  
> -	msleep(1);
> +	fsleep(USEC_PER_MSEC);
>  
>  	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
>  
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index f50726d2ed0c..bb6d6d7544b7 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -5,6 +5,7 @@
>   *
>   ******************************************************************************/
>  
> +#include <linux/delay.h>
>  #include <drv_types.h>
>  #include <rtl8723b_hal.h>
>  
> @@ -23,7 +24,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
>  		HalQueryTxOQTBufferStatus8723BSdio(padapter);
>  
>  		if ((++n % 60) == 0) {
> -			msleep(1);
> +			fsleep(USEC_PER_MSEC);
>  			/* yield(); */
>  		}
>  	}
> @@ -386,7 +387,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
>  		/* here sleep 1ms will cause big TP loss of TX */
>  		/* from 50+ to 40+ */
>  		if (padapter->registrypriv.wifi_spec)
> -			msleep(1);
> +			fsleep(USEC_PER_MSEC);
>  		else
>  			yield();
>  		goto next;
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 7ba689f2dfc8..895c47e987c4 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -4,6 +4,7 @@
>   * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
>   *
>   ******************************************************************************/
> +#include <linux/delay.h>
>  #include <drv_types.h>
>  #include <hal_data.h>
>  #include <rtl8723b_xmit.h>
> @@ -1091,7 +1092,7 @@ void rtw_suspend_common(struct adapter *padapter)
>  	pwrpriv->bInSuspend = true;
>  
>  	while (pwrpriv->bips_processing)
> -		msleep(1);
> +		fsleep(USEC_PER_MSEC);
>  
>  	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
>  		return;
> -- 
> 2.39.5
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
