Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2626D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:53:53 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id l4so35899268ejc.10
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 02:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YBd8uxEa0vBCgQGvq97K/EtYMlg6W5HWp8ZX5EJtosA=;
        b=IwB+9hnUqaIdNRb1tnuE3ZEJjCiCd0wVhTc6uqtjhUMKZV5pZ0ikggYratkEgkFaIq
         /sUA9P5pa4J4mIf9XeOl3lAcFEabQxKV9hTVej7CM4ppz4lTGGUv6LETz/oc+Ld77eE6
         ZN0Pk/g3M7oor9ceC+hK91HitxilPQ0hF3/CSY/ayyl7xE5rmuFT/5Bq8P4VGug3wNZl
         izxw1/gnGH8JrShnmckZCTgCU42nSi5ERvLT68S5XrSc8q72nDRBMGorZiMHTzAHTyRf
         iVhUyyOuT0qp/l/+DPF0+vNihgJ0cQ6mocMrAj7i7ogHFxeI3TURk8v4tiUXQQCpRzCe
         32pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YBd8uxEa0vBCgQGvq97K/EtYMlg6W5HWp8ZX5EJtosA=;
        b=I9ftdMXJCEo4o/JTkvFY+AECkOMwi4Z2wzbQp1H4QZ22MkmiGx6YPsLZ78n+M5PXjp
         HQmllD/c/zMas76E/O1nL9+UVVI/xqzTEGVLdBpvXe+J9a01O5W0bL22jVxORyWk2kCe
         L3PujfPe/cJcE/WqZtCqRDP0xR1plvaip6/tp6enbAgjw+4E8Lb60Z4Iu58bOuUTYvkM
         uWrEkh8ASUUj2JOQz2vjMFGdnHEWEeMDPdIMi2nqr6n7nE/Cx3oL6AvZ3t182udXS0uc
         JWk5bRHvCBjTLVrEwi36KqwdV2JQOecaNtjCvAQKZ67Z1RWxKwupLXW4olKzxBEWSJ4X
         atmA==
X-Gm-Message-State: AOAM532x4BI76+yDo6tKprKyGbsB+tFwHA8A54wQKJYz+PYNU4xcR/n6
	7i/FkMFCUbsyGt8AAgFi+3jOWw==
X-Google-Smtp-Source: ABdhPJz45PrYAR/WsBEJ1e9qmX5fxR0QuUdzOvqGzGMSs93mYpEHQDRzOvywMwgtkCsdvkzZHm9Kvg==
X-Received: by 2002:a17:906:6d8e:: with SMTP id h14mr2532963ejt.410.1618480431915;
        Thu, 15 Apr 2021 02:53:51 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id d10sm1513187ejw.125.2021.04.15.02.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:53:51 -0700 (PDT)
Date: Thu, 15 Apr 2021 10:53:49 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stanley@bb.sd3,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 57/57] staging: rtl8723bs: hal: sdio_halinit: Remove
 unused variable 'ret'
Message-ID: <20210415095349.GX4869@dell>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-58-lee.jones@linaro.org>
 <20210415091622.GC1431@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415091622.GC1431@agape.jhs>

On Thu, 15 Apr 2021, Fabio Aiuto wrote:

> On Wed, Apr 14, 2021 at 07:11:29PM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
> > Cc: Stanley@BB.SD3
> > Cc: linux-staging@lists.linux.dev
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > index f6d734dd1a24f..60d3d6d1ba678 100644
> > --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > @@ -878,10 +878,9 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
> >  {
> >  	u8 u1bTmp;
> >  	u8 bMacPwrCtrlOn;
> > -	u8 ret = _FAIL;
> >  
> >  	/*  Run LPS WL RFOFF flow */
> > -	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
> > +	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
> >  
> >  	/* 	==== Reset digital sequence   ====== */
> >  
> > @@ -909,9 +908,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
> >  	/* 	==== Reset digital sequence end ====== */
> >  
> >  	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
> > -	ret = false;
> >  	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
> > -	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
> > +	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
> >  }
> >  
> >  static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
> 
> perhaps it's better to check the return value and return it
> to the caller if something goes wrong,

No problem.  Will fix.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
