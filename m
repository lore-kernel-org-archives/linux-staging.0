Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C730E853
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783752069; cv=none; b=gSlxKO78Xb7D+JZ5D1h8MDVtSG8KLnJeaeYsGEN/mDzJTUjV6H92K0QslZboqGj1t2yioD+znk23ILmYK8gZzy0MgKx/UUQl8pcVJx10ZSTAgx9MeLclOHGkgqUQACK4j4XLVeFhNC5xWTacuJErFm4kp0pzAm60UlRiRzRwLm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783752069; c=relaxed/simple;
	bh=A6B0Zxih+I7Rq3c9g10x1h4S8Rws1f/k8/e8dgPeCdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o84ugrv8ytDSp129ID3WQ3qFNCQxc8TwodrS236MxGSAT4cucfunplty/ETFlcuJMYsacpqp/ONKh89/nuFfDOOifktneMTlcpRgvU4NZMAuqjQdkq9oNAaEt2lzugV9bC0NbG93273xMYPyOwek8ghjNJP8nohiCOhkINmBUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyhQSFIS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyhQSFIS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1192487f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783752066; x=1784356866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EhxKKwuF4Pn/rSdF0cvkbK8KjRQV5qcC8u/my848Gjo=;
        b=nyhQSFISJmNQcgbYpOJIhyoEva6jJ4IlmTVVC+2nVJsQm6b8M5ANpcPMc6cvPGpPEo
         Ydi5t25z+4XMYtNZsCoCRTnqEeesFb3tAFzH8EIxEfHHJNQhpOdpZRSb1sE0t+Dpfz8D
         QkNHEkOjGGbvSuBuPR70LqQ9k1DiIutrQaJAa+PCQaUz8GgYKgnGeZnEN6b/m5XYzTxM
         KLS6dxn7iKYyB6BfnEISXk5FpdNZJyuh/RTRJB1ccAzrN7YZH6/b8HfoAd3UGaftaZQg
         NQhlHk7L7+wDrlkQVkAEPw5heXNbjSiTJwEazhrxPmLwUNzbhgfwQhgGXAj5ZD/a8vhp
         iB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783752066; x=1784356866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhxKKwuF4Pn/rSdF0cvkbK8KjRQV5qcC8u/my848Gjo=;
        b=SZnWGxlKHpv6OBATuKtg66kEprX6IQOKSqjgg3Ve8Gj21etAVRngDdB0Du0JkQx9l3
         qnajag+gbKxJSyFcSTIjeja4SZI5JBSMbEsVyeFODHf3nhD+s6DLDpFNzzMI1HeiBqJo
         BqtcBr29ZmJn/CnHodfB7pOZmGp9LfYSkdDcOjKMf4v6EoGb4mIbQs6sL6ftKqNWIA/o
         /ST0fRClddpVd4DAyWazF6j/mLywUYrnFvkxmcvZoWQ271HN6bKuxftDqgpKSqpt/PuF
         g5U9vNudR0wNn8GsjsnGjApEuSmiLDMfLIS+k68m5/3y4utmGfAIqFuI/r+xps8qZ93S
         gMPw==
X-Forwarded-Encrypted: i=1; AHgh+RqzaRMpnwRBgkwsGl9eH+e/kYyNxsHbCXgkGq3DAkNj/Kk7p/spGNtNGVEb2A8Y7FNkDnBA8vQiaCALYY+n@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7cvuv0rnm8afMOYOmK3BfjurcRyfyJXsbRBDBu1u1Jq1Xk4u0
	jcAAqiYgMtMal+PEBXJ/HK1LUFMnPu2aq9nWylWUEQS9hyKG9rYvOBc8
X-Gm-Gg: AfdE7ckOb+YeQQZaSgFPsck34FXys2cb+M9V491jiAm2Sdoo0TmqD8hii/AeGqqUQtm
	tLwzZMK9caA2NStWZcnFy+K+uXx+943/OuoVLHBd0dH8Hucogud4jcM+dmWtanHhewonmcz2ETL
	XqsVjb1mYIMAra9U6Z74JKE7/2Q8XTj2pQhy5BRMpTdL1ba/fuq1Qq5QaJkCRkaYBYw0H7Ste31
	BzjvD6EvZcKjvDtGzHearPx1GPibC4RkLHiF2sRRndGqrhUC2Z1M8ClllJ+Kbg/wlgkdqdUZjh3
	1RSVAVx+p5AWKC7MCjXtAZV+xSvEwzyuyIWm3FPXuJYiRJJTOvxw7gkSnNc8oD0MM8zJr79NHQW
	UBeXBbciSeXnF3691w8srPHrzwSSTJjRdpuJqGle7ss+QC72bqJ5HapgOHXT5gMZicLHJSDb2kI
	aRq1GJk+u3
X-Received: by 2002:a5d:5846:0:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47f2dceac0cmr1625900f8f.39.1783752066448;
        Fri, 10 Jul 2026 23:41:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm65223828f8f.14.2026.07.10.23.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 23:41:05 -0700 (PDT)
Date: Sat, 11 Jul 2026 09:41:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Anantha Krishnan <ananthanr.off@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace magic number in
 InitBeaconParameters
Message-ID: <alHlffn9rB4HV0gN@stanley.mountain>
References: <2026071157-ovary-property-4427@gregkh>
 <20260711062248.28968-3-ananthanr.off@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711062248.28968-3-ananthanr.off@gmail.com>

On Sat, Jul 11, 2026 at 11:52:49AM +0530, Anantha Krishnan wrote:
> Per the bitfield comment in hal_com_reg.h, REG_TBTT_PROHIBIT packs
> a "setup" time in bits 3:0 and a "hold" time in bits 19:8. The
> rtw_write16() call here only writes the low 16 bits of that
> register, covering the full setup field and the low byte of the
> hold field.
> 
> Replace the magic number 0x6404 with two named constants
> representing these fields.
> 
> No functional change.
> 
> Bit-field positions are documented in the comment above
> REG_TBTT_PROHIBIT in drivers/staging/rtl8723bs/include/hal_com_reg.h.
> 
> Signed-off-by: Anantha Krishnan <ananthanr.off@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index bcaf63b2893c..699e24f52392 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -11,6 +11,13 @@
>  #include <rtl8723b_hal.h>
>  #include "hal_com_h2c.h"
>  
> +/*
> + * Bitfield layout per the comment above REG_TBTT_PROHIBIT in
> + * drivers/staging/rtl8723bs/include/hal_com_reg.h.
> + */
> +#define TBTT_PROHIBIT_SETUP     0x04  /* bits 3:0: setup time, unit 32us */
> +#define TBTT_PROHIBIT_HOLD_LOW  0x64  /* bits 15:8: low byte of 12-bit hold time, unit 32us */

Jad already sent a version of this.
https://lore.kernel.org/all/20260708150930.1813224-1-inasj268@gmail.com/

The "_LOW", I guess, means "low byte" which is misleading because
it suggests that this is a low byte and that a high byte exists...
The 15 should really be 19.

> +
>  static void _FWDownloadEnable(struct adapter *padapter, bool enable)
>  {
>  	u8 tmp, count = 0;
> @@ -861,8 +868,8 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  
>  	rtw_write16(padapter, REG_BCN_CTRL, val16);
>  
> -	/*  TODO: Remove these magic number */
> -	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
> +	rtw_write16(padapter, REG_TBTT_PROHIBIT,
> +		    (TBTT_PROHIBIT_HOLD_LOW << 8) | TBTT_PROHIBIT_SETUP);/*  ms */

The comments still say "ms" when really it's in units of 32us.

regards,
dan carpenter

>  	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
>  	/*  so don't set this register on STA mode. */
>  	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
> -- 
> 2.43.0
> 
