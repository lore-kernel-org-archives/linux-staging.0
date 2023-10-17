Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091614121D;
	Tue, 17 Oct 2023 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnVft0xP"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507a936f4a9so3665309e87.1;
        Tue, 17 Oct 2023 11:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697568450; x=1698173250; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmICwmBoI0nNKZqKDeA/2U9n80tXqZ7792F42uyLv0o=;
        b=UnVft0xP0j4FvBLzjxNUZhbYBi+HbfJ6iKRIW9ol8kadylw3TxY6s9+bQhED/gG9Cq
         wuowyJubFTzhVxxWz932YZ+Bmv5dF+6o+jWnXTSPus3O3NXeNGRlpVnOsxINxeIc8ZON
         nOvEAOIu/9dXMiyP23sf+DEYBzgfZNkbBLrRhb3XI8mQXRZsA0+Xw39WBa+XLpFMSM+5
         i3K8/wKSC3E5yMuEAsjzDomQZ4PM7e20YhNWTFDcDzGGJLf8mGQ+vHcG3f2+z+3qIeuE
         c3Y0mxEH2TSrE7OWDS2MTFl76jAJ4uN+ia1f/thZWn2D28C+HK0Fsem0c03WGsd9veUv
         RqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568450; x=1698173250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmICwmBoI0nNKZqKDeA/2U9n80tXqZ7792F42uyLv0o=;
        b=OzP000qNSItR5ClVITF1c8DsWXkkpRNOBQkRTc4SorEMG2UyAbHajcnqaXIIFvL0tJ
         wJ73MKwg7pe9gRAYfRu2+s/zaIvtSDG2JhdXRLP9zmrLAhPCmcfurjKCIIZNNhTbWBu+
         UlGduRittAzlGPMgexmrJEBx9HVrYDhwhvDhYwq+Auq01233qWcORPv/CoQ9hmPAqCph
         q/mcs634+I06KZAHYJ80BuYTQSMDfD1HkrKdzNrZznLRJeUVP0ryVwVhql2YkM3w8d+q
         MlQp1y0VdAZqi2xwkcxR7M5RWbpP8mzbBZ5sXyX9OARtUMM5ukdtCz0cAJcqPZVvwv/u
         RfWA==
X-Gm-Message-State: AOJu0YxbKe9RotdnBH+5w8lM9ttyU5OQIGNdDLbfZ++F9GOH098AbUtL
	gtDVo/oq2atF4GecUGZDZw==
X-Google-Smtp-Source: AGHT+IESZslQNyusElFBWo5mcRJLUnBIRNn71W/9mZybzHHY5GQR5etWw70lNAmSc1d5t4t4sq4ExQ==
X-Received: by 2002:ac2:4206:0:b0:507:a16d:6699 with SMTP id y6-20020ac24206000000b00507a16d6699mr2208709lfh.13.1697568449638;
        Tue, 17 Oct 2023 11:47:29 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.158.206])
        by smtp.gmail.com with ESMTPSA id ee16-20020a056402291000b0053e8f1f79afsm1635197edb.30.2023.10.17.11.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:47:29 -0700 (PDT)
Date: Tue, 17 Oct 2023 21:47:25 +0300
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
Message-ID: <ZS7WvaM65awtILqk@dorcaslitunya-virtual-machine>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
 <20231016201434.7880-2-anonolitunya@gmail.com>
 <2023101724-diagram-legwork-0e53@gregkh>
 <ZS5FlsCPETnr8T5D@dorcaslitunya-virtual-machine>
 <2023101712-grudge-overtime-1f43@gregkh>
 <ZS5JexVUSKZUuOd4@dorcaslitunya-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS5JexVUSKZUuOd4@dorcaslitunya-virtual-machine>

On Tue, Oct 17, 2023 at 11:44:43AM +0300, Dorcas Litunya wrote:
> On Tue, Oct 17, 2023 at 10:34:43AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 17, 2023 at 11:28:06AM +0300, Dorcas Litunya wrote:
> > > On Tue, Oct 17, 2023 at 09:50:50AM +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Oct 16, 2023 at 11:14:08PM +0300, Dorcas AnonoLitunya wrote:
> > > > > Rename function displayControlAdjust_SM750E to
> > > > > display_control_adjust_SM750E. This follows snakecase naming convention
> > > > > and ensures a consistent naming style throughout the file. Issue found by
> > > > > checkpatch.
> > > > > 
> > > > > Mutes the following error:
> > > > > CHECK:Avoid CamelCase: <displayControlAdjust_SM750E>
> > > > > 
> > > > > Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> > > > > ---
> > > > >  drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > > > > index e00a6cb31947..8708995f676c 100644
> > > > > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > > > > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > > > > @@ -14,8 +14,8 @@
> > > > >   * in bit 29:27 of Display Control register.
> > > > >   */
> > > > >  static unsigned long
> > > > > -displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
> > > > > -			     unsigned long dispControl)
> > > > > +display_control_adjust_SM750LE(struct mode_parameter *pModeParam,
> > > > > +			       unsigned long dispControl)
> > > > >  {
> > > > >  	unsigned long x, y;
> > > > >  
> > > > > @@ -125,7 +125,7 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
> > > > >  			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
> > > > >  
> > > > >  		if (sm750_get_chip_type() == SM750LE) {
> > > > > -			displayControlAdjust_SM750LE(pModeParam, tmp);
> > > > > +			display_control_adjust_SM750LE(pModeParam, tmp);
> > > > 
> > > > Why is this function returning a value if it is just being ignored?
> > > > 
> > > > It's not the issue here in the patch, but for future changes.
> > > >
> > > Hi Greg,
> > > 
> > > I will do the correction in the next patchset to correct both functions
> > > return value as this patchset was not focused on that. Does this mean
> > > that this patchset has been accepted? Or should I submit another
> > > patchset that includes the two changes suggested on function return
> > > values?
> > 
> > You'll get an email from my system when it is accepted, wait a day or so
> > before worrying about that.  And then send new patches on top of them
> > then.
> > 
> Thanks for the clarification Greg. I will wait for the confirmation
> email from your system then send the new patches shortly afterwards.
> 
> thanks,
> Dorcas
> > thanks,
> > 
> > greg k-h
Hello,
 I have realised there was an error in the commit message subject and body for this patch. I had put "Staging: sm750fb: Rename displayControlAdjust_SM750E" instead of "Staging: sm750fb: Rename displayControlAdjust_SM750LE".I had forgotten the L in SM750LE. I have modified the commit message using git commit --amend to correct the mistake. I have seen the patch has been accepted, however, I am not sure whether the change in the commit message will reflect once the patch is merged. Please guide on what to do next. I am really sorry for the inconvenience.

 Best,
 Dorcas
