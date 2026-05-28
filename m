Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD662F691F
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951744; cv=none; b=kxef4495HPpqPKOldOeafovLCOX5vwJJrbj8+lV8YSBsK2B7YqUxNZ7tO2K9A5iaNBNSLjq0VUPbmyaDtOYjfAXmre3umOhIa4OyN5cITCO0y2PDJLUbva/YiVY0VTD6Ivkx5Cu/TjbQF4KhFrYRSbOgJcyP8/X3E4cwa+okbuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951744; c=relaxed/simple;
	bh=e9Lb0CoCa4leur1hEyRfDAKKqlZiJz4bwiahoYSAusY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0PhodxtJKWCuOlvxRdsfa8CH8o5KnawcN6F/wNnTMR+sEPD+pvhtcvFZscqGWYrceKkUcA85fAPLsLDY2M5nPjtPslzzps7MsKpQUkLXrg/ykVDGWvuK4xUghAv4+IuOlTpaZ+hl+8xDSpQY4YxYtrxpHTK44Vc9412vunEy5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7+ECOex; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7+ECOex"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso79598075e9.1
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951741; x=1780556541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kddLaMA8IcndWsqCrq1f5OLSXtJVYrdIsNecb2wRb38=;
        b=c7+ECOexAJq4N7idxm8P3Prud5c0oo1bqj+yf6p3oARfAVTn3eAbsvV2mMjQuChy7Z
         SdFK+mlWC33hNlJaqpZAaZjbxFGNLkDg9tkGsR6vl/+DHWz6Hbr0mAeOeUgz/O4w2pZ6
         9FH0N/0nmKTXtKZkJMWChctRidwy+5wINMuKzIEgb5U1n8Uv37L4cd5+gn+Ld1d+qWoe
         ijEIJJmWBFk0d7YqkyFB/RJGra9U0xOLMkCxlrO6OwtcygXr/+knQmX1usMJpoiyxDRw
         tdtv5Npams0paviLTUOK1ZqVMHMh5jlDanqyKB94jzPeM+WAIFRVhaJQHsibgxyxsn2Y
         GlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951741; x=1780556541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kddLaMA8IcndWsqCrq1f5OLSXtJVYrdIsNecb2wRb38=;
        b=WGIZiTuYdck3Kf0icArEACAXThS4VjDXOYO+e6gn0w9ICMxLLehoE4mXjC58/7mKFT
         D+Y7QamiDeU2kdMrrOe8xgzouMAvPPd2c5gaYEgmBsq2J+lChF1ctobL/vxLWNFQ6QG7
         NvEm3b9djl2+FdyVqaavGi1gl70AQ5LJmszvLFVcSX3e137BHfwDQ+yPGTo8PK8nz4VN
         TL2otlMfnTWw2YFTrfmjNwfTiY3V8g1ajtccRB5LTcm7eCl1YsWQj6ZquHu6q7vTUjXe
         1V8n/5tenDuGywEfW97/Vytj3iuT3toCIYgQXjkS2Ll3pqe0m3R/Us6fwkAmJqExe+wg
         dDTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZSUAlT9iz7CavxAHpqBctikb/T98EXzqmZrLxnKX28a254DLLWKJkSmLvp/zuzvJjZTZKKiM2DQpmnBBY@lists.linux.dev
X-Gm-Message-State: AOJu0YxBbnerP5nFZCulu936nvRQr1mMvealXeI+YE25YlsrZWkE/s+v
	bV7aIua51oLno2j+QyRSvd+P10Ll2p2wDbEfrVXvDlSTt5jqLCZPph5L
X-Gm-Gg: Acq92OFyEj9zMqcnzgjvhYjR/HBAQqLq5AoP6C6fR1dCEiEUQ83qj9wEqagor2zefV6
	432kLq14v/bZZUeGropOKzFtCarYrh2TVFNcXxADv8lLgrVvELHkedbX3aTGWYTBgcCVtu3z7EQ
	23aRoxc3EmrDYm7DkUyF3pYJ69x2f+V286ObQxf5Niofj3pcaVPDR/q18OeEZ2g9LJPd0CanlSx
	JhOib3RCxfv2qiXgoiLzXa7Wtscs3FK4jxCmY2Pky/68vf5tTHQH2LJFKcGWjk4i3mY8vZs9jbJ
	GpfaiUtHRK2oVIBamnUXeupf23DDzARy6D+nv/OmbmhPxDrqqXAPwUKFaSwRi+emB39QO2GaeNo
	iC9N6TxPDvbNCBQs+4+ROq0dKfLVNFVY035uVQiVG1zcq2RE5YgyK2eNR3uw16Bcwbv4OzAuJIb
	HH7yba65LxheYAJYHYcf/Y1PIzneHZeT2Z+SJ1xZU94IQJ
X-Received: by 2002:a05:600c:458b:b0:490:47e3:929a with SMTP id 5b1f17b1804b1-49047e394a6mr405117725e9.6.1779951741199;
        Thu, 28 May 2026 00:02:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a82ea2sm40433145e9.9.2026.05.28.00.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:02:20 -0700 (PDT)
Date: Thu, 28 May 2026 10:02:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bastien Cossette <bastiencossette29@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary NULL check before
 vfree
Message-ID: <ahfoeKvdmnaOpzjH@stanley.mountain>
References: <20260528065723.39968-1-bastiencossette29@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528065723.39968-1-bastiencossette29@icloud.com>

On Thu, May 28, 2026 at 02:57:23AM -0400, Bastien Cossette wrote:
> The vfree() function handles NULL pointers natively. Cleaning up the
> redundant if check simplifies the code and adheres to core kernel
> coding styles.
> 
> Signed-off-by: Bastien Cossette <bastiencossette29@icloud.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 728a2171fbcb..24dfae2dd759 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -23,14 +23,10 @@ u8 rtw_hal_data_init(struct adapter *padapter)
>  
>  void rtw_hal_data_deinit(struct adapter *padapter)
>  {
> -	if (padapter->HalData) {
> -		vfree(padapter->HalData);
> -		padapter->HalData = NULL;
> -		padapter->hal_data_sz = 0;
> -	}
> +	vfree(padapter->HalData);
> +	padapter->hal_data_sz = 0;


You can't delete the "padapter->HalData = NULL;" assignment.

>  }
>  
> -

Do white space changes in their own patch.

regards,
dan carpenter


