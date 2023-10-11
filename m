Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7773993F
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zpJ7a9gW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CA8C433C7;
	Wed, 11 Oct 2023 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697045736;
	bh=v/0RyzBSPeGro8PJjMXCX43C+fKD4T/PcYqHUjy05Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zpJ7a9gWJPUQDEUbH+Iu3lFtT9l6UT6h1KLMl4gP2qvkq7epyZWmAcwR6uOrc8KI6
	 MgV6dcCmIIp/uoRxn/eZMfPGaKNkuLXX2a9N5dFzc3wyhIHIHI4VkU3cYmsNqjbs1d
	 Jczo1Gx9HbZorSTAbJPFQUqkDCnrqMAPf4yhFq8k=
Date: Wed, 11 Oct 2023 19:35:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: drosdeck <edson.drosdeck@gmail.com>
Cc: hdegoede@redhat.com, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs:Fix coding style errors and warning
Message-ID: <2023101124-wilder-unchanged-df2f@gregkh>
References: <20231011164232.28866-1-edson.drosdeck@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011164232.28866-1-edson.drosdeck@gmail.com>

On Wed, Oct 11, 2023 at 01:42:32PM -0300, drosdeck wrote:
> Warning found by checkpatch.pl script. Fixes warning replacing printk to
> pr_crit and fixes conding style.
> 
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 21 +++++++++-----------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 490431484524..e178a6881e0c 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -48,7 +48,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
>  {
>  	struct dvobj_priv *psdpriv;
>  
> -
>  	psdpriv = sdio_get_drvdata(func);
>  
>  	if (!psdpriv->if1)
> @@ -73,7 +72,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
>  	err = sdio_claim_irq(func, &sd_sync_int_hdl);
>  	if (err) {
>  		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
> -		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
> +		pr_crit("%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
>  	} else {
>  		dvobj->drv_dbg.dbg_sdio_alloc_irq_cnt++;
>  		dvobj->irq_alloc = 1;
> @@ -81,7 +80,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
>  
>  	sdio_release_host(func);
>  
> -	return err?_FAIL:_SUCCESS;
> +	return err ? _FAIL : _SUCCESS;
>  }
>  
>  static void sdio_free_irq(struct dvobj_priv *dvobj)
> @@ -102,8 +101,9 @@ static void sdio_free_irq(struct dvobj_priv *dvobj)
>  				netdev_err(dvobj->if1->pnetdev,
>  					   "%s: sdio_release_irq FAIL(%d)!\n",
>  					   __func__, err);
> -			} else
> +			} else {
>  				dvobj->drv_dbg.dbg_sdio_free_irq_cnt++;
> +			}
>  			sdio_release_host(func);
>  		}
>  		dvobj->irq_alloc = 0;
> @@ -169,6 +169,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
>  		sdio_release_host(func);
>  	}
>  }
> +
>  static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
>  {
>  	int status = _FAIL;
> @@ -239,8 +240,8 @@ static void sd_intf_stop(struct adapter *padapter)
>  	rtw_hal_disable_interrupt(padapter);
>  }
>  
> -
> -static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
> +static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj,
> +					 const struct sdio_device_id  *pdid)
>  {
>  	int status = _FAIL;
>  	struct net_device *pnetdev;
> @@ -273,7 +274,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  	/* 4 3.1 set hardware operation functions */
>  	rtw_set_hal_ops(padapter);
>  
> -
>  	/* 3 5. initialize Chip version */
>  	padapter->intf_start = &sd_intf_start;
>  	padapter->intf_stop = &sd_intf_stop;
> @@ -290,7 +290,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  
>  	rtw_hal_chip_configure(padapter);
>  
> -	hal_btcoex_Initialize((void *) padapter);
> +	hal_btcoex_Initialize((void *)padapter);
>  
>  	/* 3 6. read efuse/eeprom data */
>  	rtw_hal_read_chip_info(padapter);
> @@ -359,9 +359,7 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
>   * notes: drv_init() is called when the bus driver has located a card for us to support.
>   *        We accept the new device by returning 0.
>   */
> -static int rtw_drv_init(
> -	struct sdio_func *func,
> -	const struct sdio_device_id *id)
> +static int rtw_drv_init(struct sdio_func *func, const struct sdio_device_id *id)
>  {
>  	int status = _FAIL;
>  	struct adapter *if1 = NULL;
> @@ -501,6 +499,5 @@ static void __exit rtw_drv_halt(void)
>  	rtw_ndev_notifier_unregister();
>  }
>  
> -
>  module_init(rtw_drv_entry);
>  module_exit(rtw_drv_halt);
> -- 
> 2.39.2
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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your correct name for the patch on
  either the Signed-off-by: line, or the From: line (both of which have
  to match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
