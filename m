Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5394C6D;
	Fri, 22 May 2026 04:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779424910; cv=none; b=CbskBlG3UqbzLwP1hGBK+h/lA3uVg3tO2EliO9wKGfQBWlnUm3+jGD9Nzu9I0ATa7Zrwgsgy/KnlblpJyZgKVtMifYVJutNdycOf/TnuC7HpIJjmVbFo4BZfIBALz5hQ4o30vrU18jwR2I4d2eizYLHZsccUCVKb41iuUQg7RtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779424910; c=relaxed/simple;
	bh=TM3MYvRZw70fC8bQts7rPyH1bbcxWlzNmm5vMbbYY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0RaCgW+4DcvyYG1l/PvUH6Ym0+Z6eEuEvGd0xgAjFSiIlXdY60BSzZfttem3P1GKlKjnECrZyRrTlaZ8m6MHguCjEutyH+kfb2BppVAxgVy26lKj9GWaF8YXQizUjKSZnfxokI045SKee+w5QCr1X78+PCSD5p8P5BsYq7tzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HUiUXLZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HUiUXLZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1558B1F000E9;
	Fri, 22 May 2026 04:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779424908;
	bh=JcE9pH0cbJLosd9ETnCq8+IrNwH4snFEWRZoB16WjXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HUiUXLZak7TNdSf5P4kHj2EsYa08a1I7tCA2gNE66XTSlJV9A46Tx8GFYdvq4kbqQ
	 rHGDyUg1mkFoX2wL0pSXKFIb6Nf3MPShcxwk2/Yk6OvITWZIpsofQzQKAh9+NAJ+dH
	 8gzwzCYFkH0l49JAbY8FriaMCFkUMvXRMDZG/0BI=
Date: Fri, 22 May 2026 06:41:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: omkarbhor4011@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix operator spacing
Message-ID: <2026052222-dosage-correct-31ba@gregkh>
References: <20260522003013.69238-1-omkarbhor4011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522003013.69238-1-omkarbhor4011@gmail.com>

On Fri, May 22, 2026 at 06:00:13AM +0530, omkarbhor4011@gmail.com wrote:
> From: omkarbhor4011 <Omkarbhor4011@gmail.com>
> 
> Signed-off-by: omkarbhor4011 <Omkarbhor4011@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e794fe3ca..3bb1533e1 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -21,23 +21,23 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
>  		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, tmp | 0x04);
>  
>  		tmp = rtw_read8(padapter, REG_MCUFWDL);
> -		rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
> +		rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
>  
>  		do {
>  			tmp = rtw_read8(padapter, REG_MCUFWDL);
>  			if (tmp & 0x01)
>  				break;
> -			rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
> +			rtw_write8(padapter, REG_MCUFWDL, tmp | 0x01);
>  			msleep(1);
>  		} while (count++ < 100);
>  
>  		/*  8051 reset */
> -		tmp = rtw_read8(padapter, REG_MCUFWDL+2);
> -		rtw_write8(padapter, REG_MCUFWDL+2, tmp&0xf7);
> +		tmp = rtw_read8(padapter, REG_MCUFWDL + 2);
> +		rtw_write8(padapter, REG_MCUFWDL + 2, tmp & 0xf7);
>  	} else {
>  		/*  MCU firmware download disable. */
>  		tmp = rtw_read8(padapter, REG_MCUFWDL);
> -		rtw_write8(padapter, REG_MCUFWDL, tmp&0xfe);
> +		rtw_write8(padapter, REG_MCUFWDL, tmp & 0xfe);
>  	}
>  }
>  
> @@ -70,8 +70,8 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
>  	if (remainSize_p1) {
>  		offset = blockCount_p1 * blockSize_p1;
>  
> -		blockCount_p2 = remainSize_p1/blockSize_p2;
> -		remainSize_p2 = remainSize_p1%blockSize_p2;
> +		blockCount_p2 = remainSize_p1 / blockSize_p2;
> +		remainSize_p2 = remainSize_p1 % blockSize_p2;
>  	}
>  
>  	/* 3 Phase #3 */
> @@ -104,8 +104,8 @@ static int _PageWrite(
>  	u8 value8;
>  	u8 u8Page = (u8) (page & 0x07);
>  
> -	value8 = (rtw_read8(padapter, REG_MCUFWDL+2) & 0xF8) | u8Page;
> -	rtw_write8(padapter, REG_MCUFWDL+2, value8);
> +	value8 = (rtw_read8(padapter, REG_MCUFWDL + 2) & 0xF8) | u8Page;
> +	rtw_write8(padapter, REG_MCUFWDL + 2, value8);
>  
>  	return _BlockWrite(padapter, buffer, size);
>  }
> @@ -124,7 +124,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
>  
>  	for (page = 0; page < pageNums; page++) {
>  		offset = page * MAX_DLFW_PAGE_SIZE;
> -		ret = _PageWrite(padapter, page, bufferPtr+offset, MAX_DLFW_PAGE_SIZE);
> +		ret = _PageWrite(padapter, page, bufferPtr + offset, MAX_DLFW_PAGE_SIZE);
>  
>  		if (ret == _FAIL) {
>  			netdev_dbg(padapter->pnetdev, "page write failed at %s %d\n",
> @@ -136,7 +136,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
>  	if (remainSize) {
>  		offset = pageNums * MAX_DLFW_PAGE_SIZE;
>  		page = pageNums;
> -		ret = _PageWrite(padapter, page, bufferPtr+offset, remainSize);
> +		ret = _PageWrite(padapter, page, bufferPtr + offset, remainSize);
>  
>  		if (ret == _FAIL) {
>  			netdev_dbg(padapter->pnetdev, "remaining page write failed at %s %d\n",
> @@ -195,7 +195,7 @@ static s32 polling_fwdl_chksum(
>  		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->bDriverStopped)
>  			break;
>  		yield();
> -	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
> +	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
>  
>  	if (!(value32 & FWDL_ChkSum_rpt)) {
>  		goto exit;
> @@ -1888,7 +1888,7 @@ void rtl8723b_fill_fake_txdesc(
>  	if (IsPsPoll) {
>  		SET_TX_DESC_NAV_USE_HDR_8723B(pDesc, 1);
>  	} else {
> -		SET_TX_DESC_HWSEQ_EN_8723B(pDesc, 1); /*  Hw set sequence number */
> +		SET_TX_DESC_HWSEQ_EN_8723B(pDesc, 1);
>  		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
>  	}
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

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
