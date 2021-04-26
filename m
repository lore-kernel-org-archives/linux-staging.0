Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC171
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 17:22:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j5so55748090wrn.4
        for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g5ISx3ZFufig4gVWW7AEl+hfObZvr1QFht5u3c6PaWQ=;
        b=WinhkBt3HrjbxFH7MkFPXJt70xlZRcSr+UoYuzdd6S/TOpr5tKwHSF1Ipl6uZXFxzt
         OH0gbFlw0NthX9FamnTeIISKPqSl6ihrGIwtcb4we3MOjcNHFqIxjUe4jAP99pYRyRcz
         +2RHCVkih1XuCK/gPqSS12dGNZvFgi4JrS0brOYCQhGyAHcuNdAkCYoPsL0HcHF2hd0p
         OVZRizgLnoSlG8whGR5Dv0UeJRJSgMRnW7Ur3uBgMYSl8XjAswbj7CyxK7cjdNfVEeOQ
         AGiR1B6o6u4jF8VNWmz9XjVZkGLcdshdnWJvdGgoaV/tm/E4CEnauM9Vdh/AG+N0GzeY
         YJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g5ISx3ZFufig4gVWW7AEl+hfObZvr1QFht5u3c6PaWQ=;
        b=gYJ7VECG+TRk3bUlrbKPN0a5OIMsKe/8rUgruQiUhRIRlUWQNbLgIctBdh8RKH0M2K
         Ap76Ujf5q7SO6Q0QgM8t1DfGAcZ82XSKcVww2QfqodJFzErI+KyliNf4GR8oZKQV11OP
         N9IF7hjAC9Evv05fPRMgJ1J3KMgi7eB9wXufEVIM4yOoVweBXLdi6sdbXM/sK50boT1X
         bGAOxzayk1mn8glmSAux142EEOIWmRQDkyZq/2tyXwVK8WbYQMtte996y/beAS/ASuDX
         VqsuWo+vl1sBqu8kkiVO7LSKdtcp5Mw8SyENphloOV6aqWBFcpzS1bjQK+LJiibdW3z+
         73wA==
X-Gm-Message-State: AOAM5305kO36YUBTX4kYNbsb1yeCMGfzRhFREqqQiSc/ccbYVob2AFBx
	oKzyrphsCShfjpx0iS30Xp4=
X-Google-Smtp-Source: ABdhPJz14BukFC3vUHYMTTqKZJulA0hhVx6VfLnchhTPquG4dlpmuyvbAVdsx9kKw+p4vXSYAMjgKg==
X-Received: by 2002:a5d:58d8:: with SMTP id o24mr10850742wrf.288.1619457762602;
        Mon, 26 Apr 2021 10:22:42 -0700 (PDT)
Received: from agape.jhs ([5.171.81.25])
        by smtp.gmail.com with ESMTPSA id p5sm5987373wma.45.2021.04.26.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 10:22:42 -0700 (PDT)
Date: Mon, 26 Apr 2021 19:22:39 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/6] staging: media: atomisp: balance braces
 around if...else block
Message-ID: <20210426172238.GA1409@agape.jhs>
References: <cover.1619199344.git.drv@mailo.com>
 <71220662c5facd746e56288cc74786c96fa3c5a7.1619199344.git.drv@mailo.com>
 <20210426095610.GA1418@agape.jhs>
 <YIbOfjrPG+NIH4wV@192.168.1.8>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIbOfjrPG+NIH4wV@192.168.1.8>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Apr 26, 2021 at 08:00:22PM +0530, Deepak R Varma wrote:
> On Mon, Apr 26, 2021 at 11:56:11AM +0200, Fabio Aiuto wrote:
> > On Sun, Apr 25, 2021 at 02:12:20PM +0530, Deepak R Varma wrote:
> > > Balance braces around the if else blocks as per the code style guidelines.
> > > Resolves checkpatch script CHECK / WARNING feedback messages.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > > 
> > > Changes since v2:
> > >    - None.
> > > Changes since v1:
> > >    - None.
> > > 
> > >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 4 ++--
> > >  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 4 ++--
> > >  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
> > >  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c  | 7 ++++---
> > >  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 4 ++--
> > >  5 files changed, 12 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > index 6be3ee1d93a5..d68a2bcc9ae1 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > @@ -872,9 +872,9 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
> > >  {
> > >  	int ret;
> > >  
> > > -	if (on == 0)
> > > +	if (on == 0) {
> > >  		return power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		ret = power_up(sd);
> > >  		if (!ret)
> > >  			return gc0310_init(sd);
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > index 6ba4a8adff7c..e722c639b60d 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > @@ -658,9 +658,9 @@ static int gc2235_s_power(struct v4l2_subdev *sd, int on)
> > >  {
> > >  	int ret;
> > >  
> > > -	if (on == 0)
> > > +	if (on == 0) {
> > >  		ret = power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		ret = power_up(sd);
> > >  		if (!ret)
> > >  			ret = __gc2235_init(sd);
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > index f5de81132177..465fc4468442 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > @@ -568,9 +568,9 @@ static int power_down(struct v4l2_subdev *sd)
> > >  
> > >  static int mt9m114_s_power(struct v4l2_subdev *sd, int power)
> > >  {
> > > -	if (power == 0)
> > > +	if (power == 0) {
> > >  		return power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		if (power_up(sd))
> > >  			return -EINVAL;
> > >  
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > > index c90730513438..92c52431bd8f 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > > @@ -461,11 +461,12 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
> > >  	ret = ov2680_read_reg(client, 1, OV2680_FLIP_REG, &val);
> > >  	if (ret)
> > >  		return ret;
> > > -	if (value) {
> > > +
> > > +	if (value)
> > >  		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
> > > -	} else {
> > > +	else
> > >  		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
> > > -	}
> > > +
> > 
> > Hi Deepak,
> > 
> > what you did above is not what is written in the commit message
> > description about. Here unneeded bracks are removed in both
> > branches, is not a matter of braces balancing.
> 
> Okay. I was thinking adding where necessary and removing where not
> would lead to expected balancing.
> I will send this as a separate patch in this patch set. Is it okay to
> add a new patch to the set now?

yes, a patchset from vN to v(N + 1) is allowed to increase in patch number,
at least in my experience.

> 
> Thank you,
> deepak.
> 
> > 
> > thank you,
> > 
> > fabio 
> > 
> > >  	ret = ov2680_write_reg(client, 1,
> > >  			       OV2680_FLIP_REG, val);
> > >  	if (ret)
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > index aec7392fd1de..d046a9804f63 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > @@ -772,9 +772,9 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
> > >  {
> > >  	int ret;
> > >  
> > > -	if (on == 0)
> > > +	if (on == 0) {
> > >  		return power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		ret = power_up(sd);
> > >  		if (!ret)
> > >  			return ov2722_init(sd);
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > > 
> > > 
> 
> 

thank you,

fabio
