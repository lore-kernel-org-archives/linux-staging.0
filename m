Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A15381BD;
	Tue, 17 Oct 2023 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctdo8nU1"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53d82bea507so9385905a12.2;
        Tue, 17 Oct 2023 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697532288; x=1698137088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmsMFOzw6DDo4sGJW291xAQW+LN+HB2lb3S1lOiqLbM=;
        b=ctdo8nU1J//TfEV2XdVnhiDQJPbzpg4GTZWO5Drxb2z1BduRbZIGgDsAWMksPg3V6z
         fovQ8PCstXnIa9I00grDr4LbUw0jijBn5gg5x2VWLq8RB03SfUeFyxwBAdsT4HhRwG4s
         v0TkuazJLsRuvrVIWxXqCPEa1mWaKqJIgJn0uElHUHnnB4wCgR5QFN9LcbW0cCwnQbdN
         XEZrcsspNJe7OFp08i9cVDC0MdbDw+BF86YLNmOZEGU5yvbK8y9lZqzcL+1jRUUvz6+H
         /GKd7Xb+nqWvBaU21HQXFE+sOcsItdGpOAmBY2bJvIR+lGXvPV/V7WmiRaVva6ZfBtlU
         l75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532288; x=1698137088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmsMFOzw6DDo4sGJW291xAQW+LN+HB2lb3S1lOiqLbM=;
        b=pAJkgGUjD8swAxfpq4FZzh1L6xHDuR5J1XXRkENBHlNSQ4EAUSFEWjibZq+PottOYR
         fOkDPLZlQ+lfTnapq+BFJjZOfioIyBaZspfhkapHVJL3fnBvMe4ypQqVFW37jskgvy7X
         LH6OaidmSmWGmmyie92yfzhKyNwMpE3gyuQ8IChfs54tTTFRD1Dhrjvf5D//XCQvWvAM
         YRPsAgQRi3c7/lX3jkYoPsxPEVPNl2CaSUV000kQ4wDotxNklkq5NpbRVkmz/BLynn5I
         2EWnr3/IavgHAbhO6rfpLGEqQIRU7/wsd8Lh3tPLDV8b1lJcevXSWNQeKotS2s0eykjH
         29WQ==
X-Gm-Message-State: AOJu0YxUWAOIo/HtWQ/M9U1EQ/VTcH6I5dTjnBhwMmC87alu0S4FdVDw
	X6ZwCpfKsmzJr7ofVh2UPg==
X-Google-Smtp-Source: AGHT+IH2TV8UJJYGPgu8FKx2WW718cPP7gAnkKjdnAT4ZmDMZY3hyupZUlDoPIAfIaxXivSpi3Hzjg==
X-Received: by 2002:a05:6402:40d0:b0:53e:2af1:e966 with SMTP id z16-20020a05640240d000b0053e2af1e966mr1533871edb.1.1697532287453;
        Tue, 17 Oct 2023 01:44:47 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id m23-20020a509317000000b0053e408aec8bsm813926eda.6.2023.10.17.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 01:44:47 -0700 (PDT)
Date: Tue, 17 Oct 2023 11:44:43 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: anonolitunya@gmail.com, outreachy@lists.linux.dev,
	julia.lawall@inria.fr, dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] Staging: sm750fb: Rename
 displayControlAdjust_SM750E
Message-ID: <ZS5JexVUSKZUuOd4@dorcaslitunya-virtual-machine>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
 <20231016201434.7880-2-anonolitunya@gmail.com>
 <2023101724-diagram-legwork-0e53@gregkh>
 <ZS5FlsCPETnr8T5D@dorcaslitunya-virtual-machine>
 <2023101712-grudge-overtime-1f43@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101712-grudge-overtime-1f43@gregkh>

On Tue, Oct 17, 2023 at 10:34:43AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 17, 2023 at 11:28:06AM +0300, Dorcas Litunya wrote:
> > On Tue, Oct 17, 2023 at 09:50:50AM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Oct 16, 2023 at 11:14:08PM +0300, Dorcas AnonoLitunya wrote:
> > > > Rename function displayControlAdjust_SM750E to
> > > > display_control_adjust_SM750E. This follows snakecase naming convention
> > > > and ensures a consistent naming style throughout the file. Issue found by
> > > > checkpatch.
> > > > 
> > > > Mutes the following error:
> > > > CHECK:Avoid CamelCase: <displayControlAdjust_SM750E>
> > > > 
> > > > Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> > > > ---
> > > >  drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > > > index e00a6cb31947..8708995f676c 100644
> > > > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > > > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > > > @@ -14,8 +14,8 @@
> > > >   * in bit 29:27 of Display Control register.
> > > >   */
> > > >  static unsigned long
> > > > -displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
> > > > -			     unsigned long dispControl)
> > > > +display_control_adjust_SM750LE(struct mode_parameter *pModeParam,
> > > > +			       unsigned long dispControl)
> > > >  {
> > > >  	unsigned long x, y;
> > > >  
> > > > @@ -125,7 +125,7 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
> > > >  			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
> > > >  
> > > >  		if (sm750_get_chip_type() == SM750LE) {
> > > > -			displayControlAdjust_SM750LE(pModeParam, tmp);
> > > > +			display_control_adjust_SM750LE(pModeParam, tmp);
> > > 
> > > Why is this function returning a value if it is just being ignored?
> > > 
> > > It's not the issue here in the patch, but for future changes.
> > >
> > Hi Greg,
> > 
> > I will do the correction in the next patchset to correct both functions
> > return value as this patchset was not focused on that. Does this mean
> > that this patchset has been accepted? Or should I submit another
> > patchset that includes the two changes suggested on function return
> > values?
> 
> You'll get an email from my system when it is accepted, wait a day or so
> before worrying about that.  And then send new patches on top of them
> then.
> 
Thanks for the clarification Greg. I will wait for the confirmation
email from your system then send the new patches shortly afterwards.

thanks,
Dorcas
> thanks,
> 
> greg k-h
