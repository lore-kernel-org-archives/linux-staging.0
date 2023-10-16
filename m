Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF1381A7;
	Mon, 16 Oct 2023 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOeVAbnt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so27307085e9.2;
        Mon, 16 Oct 2023 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697488254; x=1698093054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yP03Yjd+YrRnUI9Z4/vJQB7dAVo1TlzSZV/Wwx+jtHQ=;
        b=MOeVAbntcmeAd1223P2KaJyfDWK8s4jdTc6iDYbcVSZQDPMm9qP898Lvas9AO8tDRz
         wsweU+IiXXdqEgLf47G8se4MJKnINR3rl1NA9ElLBYLc94bn/MKrUr8HUS1Sd+4Sd5wM
         QVQTZLK8caPDF4HdDMgscVVUaAdNpPLzNbtG8RlWfL2oNu/GHqwe3I9iSqTH/Glv3u8B
         x1M+oMUAp4wlwDtEdyY7Rr17Es0ppidRr68/p/Bm4/6XrJmWAbBJ+PR7jVYVgrmhd1k1
         q4r6J3DaW+XOP4Lm8Lxv5SrzjfrAnE2vdfSjXqZnOnpcKqE6bVLb6VYpUMkY5ZUzY3wL
         bdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697488254; x=1698093054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yP03Yjd+YrRnUI9Z4/vJQB7dAVo1TlzSZV/Wwx+jtHQ=;
        b=XrwMO317AfZPhJmWXaxICVlk4ZdWsc6kqZQpD5IdZ1+0sZE/aPFLORQhAiJ0VTTxIs
         QpJ9KIUBxTb45hxQW2ZXdOJ0MVCEV5OybFr51JKtm1BjYYNCho8snt8nMBnCqUwsax4N
         Q4SXUqizXSQSIKQCQSm4tWwPG1pmYGfFjKqpVbjf2pMdiWjXD51AbUk+Q+7gD3XYjPXe
         /Mza/AmD7XCsMCz/Df1atYCEDKdL3mohmlXr4whrz1ZGGr8yN/0aBFXeWBig9S2fezmS
         hBzLQ0LrDywTJjgiy6Vpp88XFsX3x1IVvsEGameE0KBSEmQynR017M1CKNdc1vMEAAGR
         KZWg==
X-Gm-Message-State: AOJu0YyNBJbUohVc7QewnWUakJ6JYan5j4xD2H8OYU6z1VjKo+ut1ula
	mFDX0iLzaxKRfLVGDwKFsqfpsdRvwulgUys=
X-Google-Smtp-Source: AGHT+IGR2WYyvQGDSVWvcnP9TKmfjCt0gbYLkfoAC0FYqIYNl1BRisa6qK/vHorshbbX/iwXh4QmBw==
X-Received: by 2002:a05:600c:19cd:b0:405:1baf:cedf with SMTP id u13-20020a05600c19cd00b004051bafcedfmr172204wmq.24.1697488254326;
        Mon, 16 Oct 2023 13:30:54 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c230d00b004068495910csm7946115wmo.23.2023.10.16.13.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:30:54 -0700 (PDT)
Date: Mon, 16 Oct 2023 23:30:50 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] Staging: sm750fb: Rename displayControl
Message-ID: <ZS2deicLPyamwb5T@dorcaslitunya-virtual-machine>
References: <cover.1697400022.git.anonolitunya@gmail.com>
 <596de9b4cf3483d872b1ba25e1b02194aec34bac.1697400022.git.anonolitunya@gmail.com>
 <a5cbf027-7990-c54d-8bfc-dc042ac166f@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5cbf027-7990-c54d-8bfc-dc042ac166f@inria.fr>

On Sun, Oct 15, 2023 at 10:23:54PM +0200, Julia Lawall wrote:
> 
> 
> On Sun, 15 Oct 2023, Dorcas AnonoLitunya wrote:
> 
> > Rename variable displayControl to display_control. This follows
> > snakecase naming convention and ensures consistent naming style
> > throughout the file.Issue by checkpatch.
> 
> Actually, the variable seems to be dispControl?
> 
I had actually missed this. Thanks for the correction. Its now corrected
in v2.

Dorcas
> julia
> 
> >
> > Mutes the following checkpatch error:
> > CHECK: Avoid CamelCase: <dispControl>
> >
> > Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_mode.c | 32 +++++++++++++--------------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > index 431b273a347a..fc3db09de9ae 100644
> > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > @@ -15,7 +15,7 @@
> >   */
> >  static unsigned long
> >  display_control_adjust_SM750LE(struct mode_parameter *mode_param,
> > -			       unsigned long dispControl)
> > +			       unsigned long disp_control)
> >  {
> >  	unsigned long x, y;
> >
> > @@ -36,42 +36,42 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
> >  	       ((x - 1) & CRT_AUTO_CENTERING_BR_RIGHT_MASK));
> >
> >  	/*
> > -	 * Assume common fields in dispControl have been properly set before
> > +	 * Assume common fields in disp_control have been properly set before
> >  	 * calling this function.
> > -	 * This function only sets the extra fields in dispControl.
> > +	 * This function only sets the extra fields in disp_control.
> >  	 */
> >
> >  	/* Clear bit 29:27 of display control register */
> > -	dispControl &= ~CRT_DISPLAY_CTRL_CLK_MASK;
> > +	disp_control &= ~CRT_DISPLAY_CTRL_CLK_MASK;
> >
> >  	/* Set bit 29:27 of display control register for the right clock */
> >  	/* Note that SM750LE only need to supported 7 resolutions. */
> >  	if (x == 800 && y == 600)
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL41;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL41;
> >  	else if (x == 1024 && y == 768)
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL65;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL65;
> >  	else if (x == 1152 && y == 864)
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
> >  	else if (x == 1280 && y == 768)
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
> >  	else if (x == 1280 && y == 720)
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL74;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL74;
> >  	else if (x == 1280 && y == 960)
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
> >  	else if (x == 1280 && y == 1024)
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
> >  	else /* default to VGA clock */
> > -		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL25;
> > +		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL25;
> >
> >  	/* Set bit 25:24 of display controller */
> > -	dispControl |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
> > +	disp_control |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
> >
> >  	/* Set bit 14 of display controller */
> > -	dispControl |= DISPLAY_CTRL_CLOCK_PHASE;
> > +	disp_control |= DISPLAY_CTRL_CLOCK_PHASE;
> >
> > -	poke32(CRT_DISPLAY_CTRL, dispControl);
> > +	poke32(CRT_DISPLAY_CTRL, disp_control);
> >
> > -	return dispControl;
> > +	return disp_control;
> >  }
> >
> >  /* only timing related registers will be  programed */
> > --
> > 2.42.0.345.gaab89be2eb
> >
> >
> >
