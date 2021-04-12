Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80F72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 11:57:22 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id x15so12648021wrq.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=26Z5+AmQkQeLw9JlKRYpbSMEomtaV7uiUzdp3tF/h3M=;
        b=QAHqM7KtRWGaWyiVCAKHTW2n3QGFWLMbRDJsG5wuUJqDMRPZPh9ojwb8/tvpQUCCEV
         rJku7h1V3GZXTEZIe8Cgxtw8rffogTunu7W7ND4cPloyb1PF1e0GUrI3Fh+OcPWw2MTs
         3RMdQJ+RaoFPxouPWZ+LvyRouvZwJdxoVulvwoipA8sbNQHXol287cyIW0LVW5Ggllsb
         HGnmGXRayG2YXMXHE2MXBPfFIfTp4kvnSSM400FEgOErBHbWvbG81LXE/AUIHIle8cmk
         qSEzOMhxwcqiIVlqGN30YilqID37lcUM07Te7rZtO7T0Kr7ZT/1BoZTvSOWkIanbtwWn
         Yi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=26Z5+AmQkQeLw9JlKRYpbSMEomtaV7uiUzdp3tF/h3M=;
        b=T8FQ1ncweVIlpS8He83eY8ediuNiaOmDnltuNM6B8Dwmrao2gjXrJJNX4ePnVZT1Cq
         aE8PqWCamc+iIiiGBt5FKKcaMeY6esIyeoXBujBr2zocWivyXSLdVng/pSilLtg6fWlO
         7moMoNocRfhgeF+Ro6xyIR+btcOFIWKEkYIX66zCX7oZnIR5VqLs9uVzm2zYqdnGixL8
         oPpa/1RVHpRfDIjhkO9LUI8Kr+Vl9meOnyIQEuvIU7ALWeWlENB7r8mZt9ULGQwQiKSX
         d5+ZBAZK6AuOwUmWcwmNUcAuoF1Oxd+o6BSiQH+h5vhHYnjERyLuMMh0r/3ql/QfhtPb
         1r8A==
X-Gm-Message-State: AOAM5335lsA1XnXfrrMWX5JqZyRr71nWyZ+Uh0x9/VGdUGIKucPC0+o/
	5pbcrEGwqAizYw3nQ8MGHIo=
X-Google-Smtp-Source: ABdhPJzECpBATP6pixPwCmw6QQc3EYzQxea8Rcf5D2cpeRFwqgeCxZexC0oGlzoXDGHHIcixFzV9Kw==
X-Received: by 2002:a05:6000:24f:: with SMTP id m15mr8982690wrz.226.1618228640852;
        Mon, 12 Apr 2021 04:57:20 -0700 (PDT)
Received: from agape.jhs ([5.171.81.2])
        by smtp.gmail.com with ESMTPSA id s64sm8909285wmf.2.2021.04.12.04.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 04:57:20 -0700 (PDT)
Date: Mon, 12 Apr 2021 13:57:17 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH 1/3] staging: rtl8723bs: remove unused variable ret in
 hal/sdio_halinit.c
Message-ID: <20210412115716.GA1415@agape.jhs>
References: <cover.1618145345.git.fabioaiuto83@gmail.com>
 <fbba90b0c8fb9f65b0dc7bc0b02560724a5502ab.1618145345.git.fabioaiuto83@gmail.com>
 <YHQVKPOoGS3auAeQ@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHQVKPOoGS3auAeQ@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Apr 12, 2021 at 11:38:48AM +0200, Greg KH wrote:
> On Sun, Apr 11, 2021 at 02:57:35PM +0200, Fabio Aiuto wrote:
> > fix following compiler warning issue:
> > 
> >    drivers/staging/rtl8723bs/hal/sdio_halinit.c:
> >  In function 'CardDisableRTL8723BSdio':
> > >> drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5:
> > warning: variable 'ret' set but not used [-Wunused-but-set-variable]
> >      881 |  u8 ret = _FAIL;
> >          |     ^~~
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> > index 2098384efe92..936181a73d73 100644
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
> 
> Why isn't the return value being checked and returned to the caller if
> something goes wrong?  Ignoring it feels wrong to me.
> 
> thanks,
> 
> greg k-h

ok, I will propagate the return value to the whole caller chain.
CardDisableRTL8723BSdio returns void, will change this to u8...

thank you,

fabio
