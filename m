Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F341C2CD;
	Tue, 17 Oct 2023 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ID5K6/yc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9c603e2354fso87497766b.1;
        Tue, 17 Oct 2023 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697531292; x=1698136092; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3/wMuFLDLQySrQ1vNWs6CM5lnw8VddXrmIygItc0fo=;
        b=ID5K6/ycei96F3HZmyOtcIx0fK+EJXQ/b4DObNEyXR8NK1yeCdjmui3bL4+spE+nDv
         8FhQUwVUYTCSrM9M9+s/Ri57+V1UgaRiIf6UfmFI8/oQSnuZxtAabXwbp7Zge49m4M3I
         wekl4/TXl5U+KpsHEfua8dMUtVcH7ejZjFcfnmB7Au9PfkwkOYlWPkTbnUBPmW2VOY6F
         LJvJTMKq+zkmTwzwyvo8K1lB3ItozTaUdF7i7jdvjGk/2PPKb7BLLPSMfaFvmylIVqai
         qFojS3lnnhn4AYZiD+eiOAskm2z6s496wPnrcO3MBn9Ka4IxttMmvhyYu9kFBiy0Elhw
         Owrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697531292; x=1698136092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3/wMuFLDLQySrQ1vNWs6CM5lnw8VddXrmIygItc0fo=;
        b=JOjxGMC6DDuJ/n4bmJZ2NhshuiToHEyy4plMwL5PpEfyR+IXjuC4iE0mlWY3xJtQsU
         rJBDRd9z40BMqfYF+IRlje40gELgX9Bhlc826VhnmkvSUGaCl5rkusWFUaOHI8vGJlnh
         vi6an+dQrYRUcneV17oEPsTV0Sg7PPSGFRTri3Jt+eylOfghWktyRRWpIQElDq2ieLfw
         M4GkoEJsmjTJsTl6/rzbELe7H+socJcDXTz7hTMfCHzqhczMelcKOeiOK9Ru/ZTc2FNC
         1qhRT2E4gxXiVi4D8g8F5hoxsNkUQGVXhhRR2eR3QtGNbhFnkWpoXWPx3GC0kObbLyrI
         bjlg==
X-Gm-Message-State: AOJu0Yy5X7seU8bv2MkVcpLNnB9uonhHU0ByUjdUrhy5bnCdXznvRzlz
	bFrBHfZ1pUceeUnbUyIjQg==
X-Google-Smtp-Source: AGHT+IE5+yPNJCUjbAr15GkqYf43d4kmr1CxhVlh2iRhKG68i11ikT+sqUupHp7/AZLASdaSTXYfJw==
X-Received: by 2002:a17:907:86ac:b0:9ad:8641:e91b with SMTP id qa44-20020a17090786ac00b009ad8641e91bmr1091481ejc.11.1697531291363;
        Tue, 17 Oct 2023 01:28:11 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id b21-20020a170906195500b009adc7733f98sm777452eje.97.2023.10.17.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 01:28:10 -0700 (PDT)
Date: Tue, 17 Oct 2023 11:28:06 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, andi.shyti@linux.intel.com
Subject: Re: [PATCH v2 1/5] Staging: sm750fb: Rename
 displayControlAdjust_SM750E
Message-ID: <ZS5FlsCPETnr8T5D@dorcaslitunya-virtual-machine>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
 <20231016201434.7880-2-anonolitunya@gmail.com>
 <2023101724-diagram-legwork-0e53@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101724-diagram-legwork-0e53@gregkh>

On Tue, Oct 17, 2023 at 09:50:50AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Oct 16, 2023 at 11:14:08PM +0300, Dorcas AnonoLitunya wrote:
> > Rename function displayControlAdjust_SM750E to
> > display_control_adjust_SM750E. This follows snakecase naming convention
> > and ensures a consistent naming style throughout the file. Issue found by
> > checkpatch.
> > 
> > Mutes the following error:
> > CHECK:Avoid CamelCase: <displayControlAdjust_SM750E>
> > 
> > Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > index e00a6cb31947..8708995f676c 100644
> > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > @@ -14,8 +14,8 @@
> >   * in bit 29:27 of Display Control register.
> >   */
> >  static unsigned long
> > -displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
> > -			     unsigned long dispControl)
> > +display_control_adjust_SM750LE(struct mode_parameter *pModeParam,
> > +			       unsigned long dispControl)
> >  {
> >  	unsigned long x, y;
> >  
> > @@ -125,7 +125,7 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
> >  			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
> >  
> >  		if (sm750_get_chip_type() == SM750LE) {
> > -			displayControlAdjust_SM750LE(pModeParam, tmp);
> > +			display_control_adjust_SM750LE(pModeParam, tmp);
> 
> Why is this function returning a value if it is just being ignored?
> 
> It's not the issue here in the patch, but for future changes.
>
Hi Greg,

I will do the correction in the next patchset to correct both functions
return value as this patchset was not focused on that. Does this mean
that this patchset has been accepted? Or should I submit another
patchset that includes the two changes suggested on function return
values?

thanks,

Dorcas
> thanks,
> 
> greg k-h
