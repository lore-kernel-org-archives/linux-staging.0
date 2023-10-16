Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C2629425;
	Mon, 16 Oct 2023 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRfexw8r"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso50288395e9.3;
        Mon, 16 Oct 2023 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697488192; x=1698092992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwRWv8WzXK7ulsIjQYcQ2H5E6aNrsXzP3LLjUnpeYMY=;
        b=TRfexw8rT89q/OIIjWihS65d/XHy/ARVUAUXsl1m0/N9OPxCa6s6GqxyXR0KqfqNpd
         JCfp+SRbKzpq84Kxt2de5tOmFpSnXGJNLqSlIc3KlRNLxJo1yvmUXyxVMx/VWsWE6WB6
         d5050ZKDF9P7eslSNFLNBdB0cUZu3glkCV2BbMo0EyfkQyM3wOgy8gChLhYF+fU+dvhV
         VBN0waelECxphZuEGwq9snP/BSsYG2+SLCOdQn8mUOGWdui9XfWN1GXgQKgvSEJf90ma
         woIWUzHpbfykgDixXM7LOqzW/5tnb/7QLcGG7pvdzH9RBeu6mnlfWpuhSbZWZyhjpDGp
         HVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697488192; x=1698092992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwRWv8WzXK7ulsIjQYcQ2H5E6aNrsXzP3LLjUnpeYMY=;
        b=r2/2+8bAtqVky9ms4EvtCjkH+EHrVqwZT2nb23YPkgCmJSsirDNKr1weF0l1G9BPXO
         kMkgYDR2vvyhPsZK/nWPuvHdb/eS0dDF9bAQuxSlY0cpbBl0vfsiazrbpVlzTX3TM1r0
         70p8WuIDXmZkWWNwsqIprqoFyMPCz14kxNUPLOzRte2LlbgpmtQIe9txOt3eoF8zbhJT
         2s1aQ6QPzOU72ND2u1kaEPgc1YvF9kEOXXeG4Ezix5S1nYxy4Jlrx2WD3s+WmmFlVBMv
         NAtUoJo1QuCAI1i/TFQ9ZvMfJm+qe0uJol5breGcoGwtGMPxQRCsKyQtZGAgfQchKlRV
         EVmg==
X-Gm-Message-State: AOJu0Yy4cSoEax3P8BxdXcwAUS55Zde7IFK0q6Hq536JMhjfPBgjGtBs
	FFK3Isw42dSoYq7ffLinNQ==
X-Google-Smtp-Source: AGHT+IGHR6pm/ebcyjCzv/iEasWkYG4F4GvkqOo2vIn6DGhR2AerZFfF4bL0VTU13lVA7nWMfdiv1w==
X-Received: by 2002:a5d:6885:0:b0:32d:a022:8559 with SMTP id h5-20020a5d6885000000b0032da0228559mr397043wru.47.1697488191736;
        Mon, 16 Oct 2023 13:29:51 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id i5-20020adffc05000000b0032dab20e773sm73834wrr.69.2023.10.16.13.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:29:51 -0700 (PDT)
Date: Mon, 16 Oct 2023 23:29:47 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Staging: sm750fb: Rename displayControlAdjust_SM750E
Message-ID: <ZS2dO4oirsQlM+TU@dorcaslitunya-virtual-machine>
References: <cover.1697400022.git.anonolitunya@gmail.com>
 <16a9ad33ef67993482da0d350d7239aee3f0dd22.1697400022.git.anonolitunya@gmail.com>
 <d4fb378f-7446-cf16-2d14-3623e313d6ac@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4fb378f-7446-cf16-2d14-3623e313d6ac@inria.fr>

On Sun, Oct 15, 2023 at 10:22:29PM +0200, Julia Lawall wrote:
> 
> 
> On Sun, 15 Oct 2023, Dorcas AnonoLitunya wrote:
> 
> > Rename function displayControlAdjust_SM750E to
> > display_control_adjust_SM750E.This follows snakecase naming convention
> > and ensures consistent naming style throughout the file.Issue by
> > checkpatch.
> 
> The period at the end of a sentence should have a space after it.
> 
> ensures -> ensures a
> 
> Issue -> Issue found
> 
This is corrected. Thanks Julia!

> julia
> 
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
> >  		} else {
> >  			reg = peek32(CRT_DISPLAY_CTRL) &
> >  				~(DISPLAY_CTRL_VSYNC_PHASE |
> > --
> > 2.42.0.345.gaab89be2eb
> >
> >
> >
