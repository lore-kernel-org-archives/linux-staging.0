Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC11C293;
	Fri, 13 Oct 2023 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wr5MtVTW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31f71b25a99so2115841f8f.2;
        Fri, 13 Oct 2023 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697212830; x=1697817630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfHYWVeXZkEiH4m2tnI9YIZClF3r0QNLYgJ4gF7eXfw=;
        b=Wr5MtVTW40hL0M4jbjWZH//EIoa8NLmwBdS0+TkCKGXQD1z9VR7qkHt/OP1VyPFxE8
         QRf00LQo3vshCVJvwaIBhoehpFGGX843liocGqv6/GqJRHuUqPp74CwEeIfh54aanR/8
         G6/NF7D7CxvInh4Bozk1/AlLrSMeiUAjPVdhgGZvofnBQscbkT90w4Jy40SwuobWhDVy
         ygHi82tNwo52HONP1aGlXbSQ5ayrllFc+3QHhqYnvemXJFo7+90co3YxrG5FkE6PuSPs
         9QkjpHIZuFRm0ZYKFFuQxqi7kYRBa801rBG1C8EJAWng/WcA5Qb3siJUU/2eAGs+LuGb
         ORaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697212830; x=1697817630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfHYWVeXZkEiH4m2tnI9YIZClF3r0QNLYgJ4gF7eXfw=;
        b=Q5bbqf1YSp10KgwQhV8RTeRa3HBEwIOiS1JSlAy5Em9VPil3X+PHbyRoOEWejLnvjZ
         cRyU09MWaFNxfHbWhHYTYeCCXsn1HCBy6ddaPvestrCZVQqfWZcn9IAVVdRr+wLs2VTa
         PNxhl6v2e0C3FKMlcRNr4ttgsAVx9aYXNf/5V72udIrj1ayQ4Fv1sEj5CiSD+d4NdsRg
         EhgwQE08eB3LdbN/N1CJtmz6veAl+Ss7qyHjV+EpeL/KtH0tZJyJ01xLSxmVWSYrAwSU
         kpAsQM1FYJxGTFPNPX+sbYlT9IkSz3puy5yWUE7cVGrp4fuURIP6Bn2W0i0rP24Evh0i
         6qXw==
X-Gm-Message-State: AOJu0Yw7q9K8Su7ZWwgFukyI6l/8dx4VHX8dLqZ7F+MFtqj8s7DnwPv1
	CP09m+X0i9HJ6CPi1F5qHg==
X-Google-Smtp-Source: AGHT+IE9zHwK80IGz+wxOh5k8G7VLdRI3RWJZuSCCA/9uDwewxsetoyv6NSUV20Yjmp/N3IitbftZA==
X-Received: by 2002:a5d:4586:0:b0:321:5e2f:37e1 with SMTP id p6-20020a5d4586000000b003215e2f37e1mr23336167wrq.19.1697212830200;
        Fri, 13 Oct 2023 09:00:30 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.2.146])
        by smtp.gmail.com with ESMTPSA id iv10-20020a05600c548a00b0040472ad9a3dsm516532wmb.14.2023.10.13.09.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 09:00:29 -0700 (PDT)
Date: Fri, 13 Oct 2023 14:46:04 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: outreachy@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH]Staging: sm750fb:Add snakecase naming style
Message-ID: <ZSkt/B+hyDmOoocF@dorcaslitunya-virtual-machine>
References: <20231013104220.7527-1-anonolitunya@gmail.com>
 <efcb4734-0349-493e-be93-b95381eb6c78@kadam.mountain>
 <ZSkq7E+Tp1X/qiER@dorcaslitunya-virtual-machine>
 <780713a6-5f93-4393-a46d-36904e7fbd11@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <780713a6-5f93-4393-a46d-36904e7fbd11@kadam.mountain>

On Fri, Oct 13, 2023 at 06:56:08PM +0300, Dan Carpenter wrote:
> On Fri, Oct 13, 2023 at 02:33:00PM +0300, Dorcas Litunya wrote:
> > On Fri, Oct 13, 2023 at 01:48:08PM +0300, Dan Carpenter wrote:
> > > On Fri, Oct 13, 2023 at 01:42:15PM +0300, Dorcas AnonoLitunya wrote:
> > > > From: Dorcas Anono Litunya <anonolitunya@gmail.com>
> > > > 
> > > > Change camelCase variables in file to snake_case for consistent naming
> > > > practices. Issue found by checkpatch.
> > > > 
> > > > Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
> > > > ---
> > > >  drivers/staging/sm750fb/ddk750_mode.c | 86 +++++++++++++--------------
> > > >  drivers/staging/sm750fb/ddk750_mode.h |  2 +-
> > > >  drivers/staging/sm750fb/sm750_hw.c    |  2 +-
> > > >  3 files changed, 45 insertions(+), 45 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > > > index e00a6cb31947..f08dcab29172 100644
> > > > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > > > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > > > @@ -14,13 +14,13 @@
> > > >   * in bit 29:27 of Display Control register.
> > > >   */
> > > >  static unsigned long
> > > > -displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
> > > > -			     unsigned long dispControl)
> > > > +display_control_adjust_SM750LE(struct mode_parameter *p_mode_param,
> > > 
> > > The p stands for pointer.  We don't like that naming style.  Just call
> > > it mode_param.
> > > 
> > > Thes are the renamed things.
> > > 
> > > displayControlAdjust_SM750LE => display_control_adjust_SM750LE
> > > pModeParam => p_mode_param
> > > dispControl => disp_control
> > > programModeRegisters => program_mode_registers
> > > ddk750_setModeTiming => ddk750_set_mode_timing
> > > 
> > > I feel like this would be better broken up probably into one variable
> > > per patch.  It's jumping around between files.  These variables are not
> > > closely related.
> > Thanks for the feedback Dan. I will revise to do one variable per patch.
> > 
> > However,I have an inquiry the main reason its jumping between files is because one of the
> > functions I am modifying(the ddk_set_mode_timing) is imported and used
> > in other files. In this case, should I do one patch per variable per
> > file?
> 
> No that would break the build...
> 
> It's just that I felt that in this case it's especially useful to
> break it apart because some of them affect multiple files and some of
> the variables are local to a given function.  (You should still adjust
> the header file to match even though the compiler doesn't care).

Makes more sense. I will work on that. Thanks!
> regards,
> dan carpenter
> 
