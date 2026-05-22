Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94D299959;
	Fri, 22 May 2026 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779426305; cv=none; b=U2jPQ002BpPIsTKlRDHfAxKBE+Dw/sqYu3DHhN1ZcrcozpmaqGZs/Ff2HZX2kjXJP9ng0fFZJdxbiZymaJNftB+zJbb0HMFWZk80I1vCbYswDGE+hKVC74jqbTU2hj1tbFWushtzGGlkf84/V9HZmbs2v8R4dfs0PPPEc5VGXpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779426305; c=relaxed/simple;
	bh=ynP3XPOZUghl/2T4x2+zpzMkua/KZ4Uk5oFm0AYiuw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5mUAgyvrzvrnP6yjPtJoI/fDmT/L4q8KiV63zc3xxV5kco7udLGi2gYbm53y+OEN5uJwyJxVRnnUX+EQlzDjArZc6BFObHrfHg7QUuXL34GMqOtjpN0YDE6XVAVGXQThiYAcfyudz/kxMbLhjgGc5ED0EqzHC0XkRJGeSPE+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NeIKkA67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NeIKkA67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8811F000E9;
	Fri, 22 May 2026 05:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779426303;
	bh=wAFBqh+8xo35HifCIWhB9I7osg1yWOcerTBpYytAX+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NeIKkA67DzgbImPtjc3dT3akjr4bWRi73IWHg2LfPjNIzZHgiIJE5BbZ435loMKWz
	 9KtLQwwiW6lBFQu1N53Om/cpn5jPsjR7oGR5JPz11sgGhJmVZDMHCseo7K75jbl7Co
	 AfbKTVHOzRgaBhpHcBDozCf8cOSnmCw6m/gKSIS0=
Date: Fri, 22 May 2026 07:04:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: cleanup of sdio_intf.c
Message-ID: <2026052258-carefully-guts-014b@gregkh>
References: <20260521183931.176951-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521183931.176951-2-manuelebner@mailbox.org>

On Thu, May 21, 2026 at 08:39:32PM +0200, Manuel Ebner wrote:
> removed unused argument of rtw_sdio_if1_init()
> removed empty lines, added linew where appropriate
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d0feb28b7043..32a0ee08f175 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -47,7 +47,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
>  {
>  	struct dvobj_priv *psdpriv;
>  
> -
>  	psdpriv = sdio_get_drvdata(func);
>  
>  	if (!psdpriv->if1)
> @@ -144,13 +143,13 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
>  		sdio_claim_host(func);
>  		sdio_disable_func(func);
>  
> -		if (dvobj->irq_alloc) {
> +		if (dvobj->irq_alloc)
>  			sdio_release_irq(func);
> -		}
>  
>  		sdio_release_host(func);
>  	}
>  }
> +
>  static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
>  {
>  	struct dvobj_priv *dvobj = NULL;
> @@ -216,8 +215,7 @@ static void sd_intf_stop(struct adapter *padapter)
>  	rtw_hal_disable_interrupt(padapter);
>  }
>  
> -
> -static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
> +static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
>  {
>  	int status = _FAIL;
>  	struct net_device *pnetdev;
> @@ -250,7 +248,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  	/* 4 3.1 set hardware operation functions */
>  	rtw_set_hal_ops(padapter);
>  
> -
>  	/* 3 5. initialize Chip version */
>  	padapter->intf_start = &sd_intf_start;
>  	padapter->intf_stop = &sd_intf_stop;
> @@ -336,9 +333,8 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
>   * notes: drv_init() is called when the bus driver has located a card for us to support.
>   *        We accept the new device by returning 0.
>   */
> -static int rtw_drv_init(
> -	struct sdio_func *func,
> -	const struct sdio_device_id *id)
> +static int rtw_drv_init(struct sdio_func *func,
> +			const struct sdio_device_id *id)
>  {
>  	int status = _FAIL;
>  	struct adapter *if1 = NULL;
> @@ -348,7 +344,7 @@ static int rtw_drv_init(
>  	if (!dvobj)
>  		goto exit;
>  
> -	if1 = rtw_sdio_if1_init(dvobj, id);
> +	if1 = rtw_sdio_if1_init(dvobj);
>  	if (!if1)
>  		goto free_dvobj;
>  
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
