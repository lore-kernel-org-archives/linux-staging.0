Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711118038;
	Wed, 18 Oct 2023 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFtPETYT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso61838205e9.2;
        Wed, 18 Oct 2023 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697621671; x=1698226471; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sd04U5ztHM5BN91zVsx9G6ZDnJ4iPY9R76fpuMvI0tU=;
        b=kFtPETYTjM41JdVLhDLyUKkv6nKlTp4hVUpAWtyXDtY7JZrvtQwihkSRYCPG/7KWsI
         dtSqbEWyzxZvybE4AOj1FIZXYJjZ5YjFovnFyUrDhDvGxB8SVOkfo342t69E+VaUFNB7
         dlydqoPHx/z+yj67RZiN81TtsbCCp9Oc54wYU+0vTytahjsq7tijWjE8eOo8bvcu0wun
         Av+HNPOJwj95x6kpgwYBwWFUme1R27a1JdJMFZYozjUYe5GcTG4nOhztm9EyIv+NWfUX
         TCNbrEIuaB711z1XUoB8o70kz5VreamjCFD7bs9/wplk9VY5rdiG4G+EaTPpEo7nVHlJ
         Ghiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697621671; x=1698226471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sd04U5ztHM5BN91zVsx9G6ZDnJ4iPY9R76fpuMvI0tU=;
        b=XsPdxJex5UDfcJz0V+NJ1cRlb3ZXxwhmVtssb1CoTEcLG1M/1TuX+1L9o3IE5TzB/k
         ZMXcxV0KtbI79Mp0/8vYluRJ6Q8lZTXsrhR8ob9qEG7UFSWmSpHo+DnrI3SsOdAb4g4o
         WQZkUUpzHIHlqVFoMTKk+82EOUkMxgqgwwv+WZAXlxPVlYFocy6IRpywHtyzHwC/Q+NH
         F/aozpxcja/JXfDLGSb6PjUgXaE7rfp5jo4Tuqbst2ejaDjQdxHRjrjbWiigRCUeWujd
         4Uuo0Y+KgYqdu9mcwhjV8nARb3FsPdymOxZ9GEUyqhy4Ggp4rbNwdXylYyZTUXHrrG+U
         f5pA==
X-Gm-Message-State: AOJu0Yy4qEH7PYWa0ZVt46MOs7akpbke0bQ9KQxnAaDHK+WmZw6dd8KB
	LGkAc44+95iorx8W+xAX6Q==
X-Google-Smtp-Source: AGHT+IHmDIpRPzXCLPQAZ3IxJiiTrLvL6xTrGXiKrnqsbiCJwNUaHu+nlvHbGSpKR4lJJDeUTV+Qjg==
X-Received: by 2002:a05:600c:5487:b0:408:3ab3:a050 with SMTP id iv7-20020a05600c548700b004083ab3a050mr1172995wmb.16.1697621670844;
        Wed, 18 Oct 2023 02:34:30 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.0.227])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d66c1000000b0032dbf99bf4fsm1680829wrw.89.2023.10.18.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:34:30 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:34:26 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	dan.carpenter@linaro.org, andi.shyti@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: Remove unused return value in
 program_mode_registers()
Message-ID: <ZS+moqE585lPBN3m@dorcaslitunya-virtual-machine>
References: <cover.1697619623.git.anonolitunya@gmail.com>
 <492e63bbc58147fb534930ef9e1fb5d844ae8769.1697619623.git.anonolitunya@gmail.com>
 <2023101846-synopses-paralyses-d1ee@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101846-synopses-paralyses-d1ee@gregkh>

On Wed, Oct 18, 2023 at 11:26:33AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 18, 2023 at 12:07:38PM +0300, Dorcas AnonoLitunya wrote:
> > Modifies the return type of program_mode_registers()
> > to void from int as the return value is being ignored in
> > all subsequent function calls.
> > 
> > This improves code readability and maintainability.
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_mode.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > index 83ace6cc9583..e15039238232 100644
> > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > @@ -73,8 +73,8 @@ display_control_adjust_sm750le(struct mode_parameter *mode_param,
> >  }
> >  
> >  /* only timing related registers will be  programed */
> > -static int program_mode_registers(struct mode_parameter *mode_param,
> > -				  struct pll_value *pll)
> > +static void program_mode_registers(struct mode_parameter *mode_param,
> > +				   struct pll_value *pll)
> >  {
> >  	int ret = 0;
> >  	int cnt = 0;
> > @@ -202,7 +202,6 @@ static int program_mode_registers(struct mode_parameter *mode_param,
> >  	} else {
> >  		ret = -1;
> 
> Why are you still setting the 'ret' variable if you are not doing
> anything with it anymore?
> 
> >  	}
> > -	return ret;
> 
> Are you sure that the caller shouldn't be checking for errors instead of
> dropping the return value?  If so, document that in the changelog too.
>
Seems like the caller doesn't use the function to check for errors as in
the code below:

int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock)
{
        struct pll_value pll;

        pll.input_freq = DEFAULT_INPUT_CLOCK;
        pll.clock_type = clock;

        sm750_calc_pll_value(parm->pixel_clock, &pll);
        if (sm750_get_chip_type() == SM750LE) {
                /* set graphic mode via IO method */
                outb_p(0x88, 0x3d4);
                outb_p(0x06, 0x3d5);
        }
        program_mode_registers(parm, &pll);
        return 0;

It will still return 0 regardless of whether there is an error or not.
Since I am not sure how the two functions relate to one another, is
there need to check error in the caller function?

thanks,
Dorcas
> thanks,
> 
> greg k-h
