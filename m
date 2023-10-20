Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3897801;
	Fri, 20 Oct 2023 02:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIXnR4ap"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c4a25f6390so239536a34.2;
        Thu, 19 Oct 2023 19:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697768049; x=1698372849; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvDKp7hGETEWZJw5WAV27rym9fjaXJFJb3QCgDpE28Q=;
        b=RIXnR4aptpQRDebRXJfNERzmz1F71+MZYSkTvIYex4gfUrg6ZApRWTnuskvJ2BjOys
         abwru5vR8iGcl64T73o8V/+U0vkCgTA1LJh1CZl2Tz8vsrwSsO6XPo1yqiAzXAkl2P6O
         meRTdqpHsDLSevmTY9G/RjJPd4eLYXRlrbirXDUPt9FsYc26koztNXnaJ3N9fZlw9LIM
         7ijUjhbN6Ct6O0tJRTp/CG6f81tc+e+DRfju/yConoPyqLQr8APR0b1zVSC69kxUxsDG
         ec8NeSNRG2fP8Kl35/NaQEKfnMI7LQkIpbaks6ujQ/VGqFcIarPkRLjoexf0FzuPbUrp
         EIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697768049; x=1698372849;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvDKp7hGETEWZJw5WAV27rym9fjaXJFJb3QCgDpE28Q=;
        b=svkTLz0AFsPtahicui6kJg1Js0gN9pYYNnG5jWYwbY+l8GPCsn+r1Ac7v0zRSLrvuz
         t3mc6BQlsQT4SApPUHc+e467chz5zM/Adv2BWiLKlpxCvcb0e0y2DF6TnIsPzUtUVww4
         c7Z+nNQKTW4HFBL+WS+xIWApnDQJKjQ0lrBGVS9xuuC+BVMJL3yAlmlxPUyrJtM6mOwL
         0sBQz25K1Dz8xCG5yvR7woj9tI8Issw4jGV9oHlteVo+aJg8KTF8/ELmHMCoyNDZVAbH
         +Xb9jG/493a3iK6AwoobaX/WpDxCauMAGEAFTdgyYdSE6GpU9XG7FTco920j+bSKR1mF
         3DsQ==
X-Gm-Message-State: AOJu0YwsCtm0ITufWkj790SjIMaY35OLR7TOUoiGewYTsOgDaI9jEL6j
	gMa4o91zMYgB3fP6tGNDshI=
X-Google-Smtp-Source: AGHT+IHHzT5cCsgqilYJXtUJWoq7MAjWGJO46hlMyo5MGSER1NeY0qkGafr/DU6FSi9cbq93rty10g==
X-Received: by 2002:a05:6830:60f:b0:6c4:fc6d:88fb with SMTP id w15-20020a056830060f00b006c4fc6d88fbmr579599oti.33.1697768048866;
        Thu, 19 Oct 2023 19:14:08 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id k12-20020a62840c000000b0068fb8080939sm467275pfd.65.2023.10.19.19.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 19:14:08 -0700 (PDT)
Date: Thu, 19 Oct 2023 19:14:07 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tty: gdm724x: Match alignment with open parenthesis
Message-ID: <20231020021407.GE3017@Negi>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <ff627fcbc9e450c2e8f4aa5810b94e56151efa2a.1697184167.git.soumya.negi97@gmail.com>
 <a0a7274f-eba6-4f72-9569-ec4c4fff3a1a@kadam.mountain>
 <20231013211326.GB25352@Negi>
 <52732a88-7f40-4ce4-b75b-dded9827c1f0@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52732a88-7f40-4ce4-b75b-dded9827c1f0@kadam.mountain>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Sat, Oct 14, 2023 at 10:38:22AM +0300, Dan Carpenter wrote:
> On Fri, Oct 13, 2023 at 02:13:26PM -0700, Soumya Negi wrote:
> > On Fri, Oct 13, 2023 at 11:57:40AM +0300, Dan Carpenter wrote:
> > > On Fri, Oct 13, 2023 at 01:26:34AM -0700, Soumya Negi wrote:
> > > > Fix CHECK: Alignment should match open parenthesis
> > > > Issue found by checkpatch.pl
> > > > 
> > > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > > ---
> > > >  drivers/staging/gdm724x/gdm_tty.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> > > > index 32b2e817ff04..4e5cac76db58 100644
> > > > --- a/drivers/staging/gdm724x/gdm_tty.c
> > > > +++ b/drivers/staging/gdm724x/gdm_tty.c
> > > > @@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
> > > >  	int ret;
> > > >  
> > > >  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> > > > -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> > > > -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> > > > +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> > > > +					      TTY_DRIVER_DYNAMIC_DEV);
> > > 
> > > I prefered the original code.  It was more readable.
> > > 
> > > regards,
> > > dan carpenter
> > Hi Dan,
> > 
> > Noted. I'm curious what happens when some of the patches in a patchset
> > are acceptable and some are not. Is everything disregarded by
> > maintainers or are the good patches cherry-picked from the set?
> 
> Most of the time, you should just resend the series.  Sometimes a
> maintainer will take the first few patches and then when they hit one
> that can't be merged they'll stop.  So you should try to organize your
> patchsets from fixes first, then cleanups and then least controversial
> to most controversial.  Except people might be annoyed if it looks like
> you're hiding a really controversial one at the end of a long series.
> 
> regards,
> dan carpenter

Thank you!

- Soumya

