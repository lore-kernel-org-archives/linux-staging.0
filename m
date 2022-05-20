Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B7933C3
	for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 21:44:11 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id w4so13075008wrg.12
        for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 14:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IzGzA+yh9SksfN5PIuMihNbMewTTi3EccGQw+Clkiu4=;
        b=foYATmd1RKdylPsEWAhM44IiLkq8ozZdIlx/rz59ujVWTJtQItDKcjc/WjxETayczl
         UoUCwyalfBSvNn7GdGiVRf5wq7H4Kq9WnR4a0miOHxPNmnXCxNkq9JHn85OLN6WcD9h4
         dsGRwS5zRFXzf6aWNFPTndqWggMaFh1Luj+2dxDIRFaeNTCEJ9/EqQoJfRoaWJP0Le7K
         xiSMhdrQbSf9n3Z/2xOCcY5vSHJ/bR1UD1oc1ZTLIzUWMc9zTatpiMEhtUTeqvDH8Auj
         u4zIQIGxmK2Wo8rTMP53epas2sHpfaG9czzc57b6dYWLgGkmDmlXcW4r8OeR7U5V8n6d
         OW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IzGzA+yh9SksfN5PIuMihNbMewTTi3EccGQw+Clkiu4=;
        b=ohMF6+VIsBsyJ9rcfmhAsX8A4WLswdFZ3gHncRF2g8BZW4feTKU+LOsmwLH6funCwN
         hX/mqT4R9O4DMj13kX8E5MSriBfMdj5KoPGL9E9m0eljlWQrZJN+F7tnGbrgOeRjd6co
         3gBc36bcppR8/jhn/sT9cEI+KExX9xexkRlvMFwiK+n+/kD+UmOuNboRL4tOgf9yTreS
         k0cC8140SgxJIByA7wnF5J+3CdEU6m/IPM6kFu78+ee7MZRsEjj+eHrZmVVdome708vF
         IsDJyq1QKnKmEzr41KoLO2i/B12guKWXCD5vbekQz1jiAV27syODcLM8y9wuNjeCiXt7
         2v3g==
X-Gm-Message-State: AOAM533tXww97vcRE71qEHYGNYmP5WbT1HVAttA4tpNuymYWCHZIbSKU
	SkxyJaCYvY+WzsADr3UHRqeDQg==
X-Google-Smtp-Source: ABdhPJysnghgnS8LjetKJyGo16CPlEka360A32ksJ6PUoC0FMqoibBrTG1Q97T9veiwnXw7XstzNpA==
X-Received: by 2002:a05:6000:1f94:b0:20e:744a:214 with SMTP id bw20-20020a0560001f9400b0020e744a0214mr6032740wrb.65.1653083050066;
        Fri, 20 May 2022 14:44:10 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id ay28-20020a05600c1e1c00b003973c4bb19bsm1844030wmb.16.2022.05.20.14.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 14:44:09 -0700 (PDT)
Date: Fri, 20 May 2022 22:44:07 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: straube.linux@gmail.com, martin@kaiser.cx, saurav.girepunje@gmail.com,
	abdun.nihaal@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: remove include/rtw_debug.h
Message-ID: <YogLpztabN6PkIT/@equinox>
References: <20220519221047.6940-1-phil@philpotter.co.uk>
 <44d12b0f-3ce0-42d2-a475-31d70dd4d699@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44d12b0f-3ce0-42d2-a475-31d70dd4d699@gmail.com>

On Sat, May 21, 2022 at 12:04:54AM +0300, Pavel Skripkin wrote:
> Hi Phillip,
> 
> On 5/20/22 01:10, Phillip Potter wrote:
> > Remove include/rtw_debug.h, as all it now has are:
> > 
> > (1) A load of unused preprocessor definitions that expand to BIT(x)
> >      variants.
> > (2) A preprocessor definition that expands to the name of the driver
> >      and is only used in one place inside a pr_info_once call in
> >      core/rtw_fw.c.
> > 
> > It is now surplus to requirements after fixing up the few places that
> > include the file.
> > 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >   drivers/staging/r8188eu/core/rtw_fw.c        |  4 +-
> >   drivers/staging/r8188eu/include/drv_types.h  |  1 -
> >   drivers/staging/r8188eu/include/rtw_debug.h  | 45 --------------------
> >   drivers/staging/r8188eu/os_dep/ioctl_linux.c |  1 -
> >   4 files changed, 2 insertions(+), 49 deletions(-)
> >   delete mode 100644 drivers/staging/r8188eu/include/rtw_debug.h
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
> > index bf077876ed3d..0451e5177644 100644
> > --- a/drivers/staging/r8188eu/core/rtw_fw.c
> > +++ b/drivers/staging/r8188eu/core/rtw_fw.c
> > @@ -259,8 +259,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
> >   	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
> >   	if (IS_FW_HEADER_EXIST(fwhdr)) {
> > -		pr_info_once("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
> > -			     DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
> > +		pr_info_once("R8188EU: Firmware Version %d, SubVersion %d, Signature 0x%x\n",
> > +			     le16_to_cpu(fwhdr->version), fwhdr->subversion,
> >   			     le16_to_cpu(fwhdr->signature));
> 
> What about converting this macro to dev_info_once()? IMO, looks cleaner:
> 
> [   27.985218] r8188eu 2-1:1.0: Firmware Version 11, SubVersion 1, Signature
> 0x88e1
> 
> 
> 
> 
> With regards,
> Pavel Skripkin

Hi Pavel,

Yes, good idea, I like it. This patch has been merged now, but I will
submit another to do this. Many thanks for the suggestion.

Regards,
Phil
