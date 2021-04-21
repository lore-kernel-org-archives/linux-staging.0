Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD802F9B
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 07:17:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id l4so61940674ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 00:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bVeOu4pMcs/MkyvtHGjQBuONEKPS36STmVfSa7uNqkQ=;
        b=JTV/sXLmd9LGmDJkSPqLdUyIhWnchxxFtD9uODcIpLvTFMiEr80ZMSA+2x9PfnLogm
         mkL8y2618yKsxygDSJxm66T3OjBOMV9HQeMKpI0gqj/vvYSR4M/NHLyfhh0gfRXMoCzy
         f0QF1Y72zwVcp/LqvP4+9Dmw84Nf5bDbWls6dbAEhMjYL8vURHhfC7T93CiRzqJK1xpt
         wDIxl7ASrZjgG6d092Z4R/a2tRVptvPRFrs7qJ5jK2IDmXiSvtzlAjTFWyAJB8h5B9l4
         XGA/mTn9or2UpcrQfvFe3+R8jZtwjAIgn/koM0D+x7mqhil1MgtKnISGaVg3ztGz8O2o
         OaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bVeOu4pMcs/MkyvtHGjQBuONEKPS36STmVfSa7uNqkQ=;
        b=aMMhCjnL1+QE/GO5K7ors/pC+3A61Nxu8i6PGP7ryHu6xUkUVQuuwCk/jVPU0riYSB
         kwasuZYM/kr2+8k9Mw9hTcZGgUCsB38i9NmLSFqxbYXAr88wN2TMw7MPli2YHfCMq9TU
         Q8JZZH8Pi+e2KtjhGm3C/EPX+mKbbgOdcbAMwTHga2zrWBJn7qiQ2yeYCmCv2nQoM3hJ
         4N2Ld88+qnCnMW6YkVwSNWLB9vav3r3ySU7ExHFide23m0ZPxhkABdLfUjVS79FkgzKO
         YYGiEVpKPD++wEa7e1Ui9iE014otGivEdtVSscQd+moQly7Uk297rMYOVmo2Z708hXSq
         kfRA==
X-Gm-Message-State: AOAM533JgcOmgQIowD/yRcuXoHPaAdYCQsaCfFn49k/uBHamgCxDG7vD
	OgCKhpTZfxUsfuzzRSgTQV8=
X-Google-Smtp-Source: ABdhPJzSctcVl4ntwb0OcVwfSE3JXBmfPFEpyxCP3CdvVaJXGC3pJfC0WcqiiXc0lW6qPz4IhfICUA==
X-Received: by 2002:a17:906:a449:: with SMTP id cb9mr31157360ejb.118.1618989437947;
        Wed, 21 Apr 2021 00:17:17 -0700 (PDT)
Received: from agape.jhs ([5.171.81.65])
        by smtp.gmail.com with ESMTPSA id v1sm1996439eds.17.2021.04.21.00.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:17:17 -0700 (PDT)
Date: Wed, 21 Apr 2021 09:17:15 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] staging: media: atomisp: reformat code comment blocks
Message-ID: <20210421071713.GA1418@agape.jhs>
References: <cover.1618859059.git.drv@mailo.com>
 <7cf7b8253550460e7273c94bae005939000679fd.1618859059.git.drv@mailo.com>
 <20210420084448.GC1411@agape.jhs>
 <20210420171729.GB193332@localhost>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420171729.GB193332@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 20, 2021 at 10:47:29PM +0530, Deepak R Varma wrote:
> On Tue, Apr 20, 2021 at 10:44:48AM +0200, Fabio Aiuto wrote:
> > On Tue, Apr 20, 2021 at 12:45:04AM +0530, Deepak R Varma wrote:
> > > Reformat code comment blocks according to the coding style guidelines.
> > > This resolves different checkpatch script WARNINGs around block comments.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > >  .../media/atomisp/i2c/atomisp-gc2235.c        |  8 +++----
> > >  .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  3 ++-
> > >  .../media/atomisp/i2c/atomisp-mt9m114.c       | 22 +++++++++++--------
> > >  .../media/atomisp/i2c/atomisp-ov2680.c        |  3 ++-
> > >  4 files changed, 21 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > index 548c572d3b57..a585d73665a6 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > @@ -747,10 +747,10 @@ static int startup(struct v4l2_subdev *sd)
> > >  
> > >  	if (is_init == 0) {
> > >  		/* force gc2235 to do a reset in res change, otherwise it
> > > -		* can not output normal after switching res. and it is not
> > > -		* necessary for first time run up after power on, for the sack
> > > -		* of performance
> > > -		*/
> > > +		 * can not output normal after switching res. and it is not
> > > +		 * necessary for first time run up after power on, for the sack
> > > +		 * of performance
> > > +		 */
> > >  		power_down(sd);
> > >  		power_up(sd);
> > >  		gc2235_write_reg_array(client, gc2235_init_settings);
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> > > index b93c80471f22..750b3484eb19 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> > > @@ -57,7 +57,8 @@ static int set_msr_configuration(struct i2c_client *client, uint8_t *bufptr,
> > >  	 * By convention, the first two bytes of actual data should be
> > >  	 * understood as an address in the sensor address space (hibyte
> > >  	 * followed by lobyte) where the remaining data in the sequence
> > > -	 * will be written. */
> > > +	 * will be written.
> > > +	 */
> > >  
> > >  	u8 *ptr = bufptr;
> > >  
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > index 465fc4468442..160bb58ce708 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > @@ -478,7 +478,8 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
> > >  	/* Note: current modules wire only one GPIO signal (RESET#),
> > >  	 * but the schematic wires up two to the connector.  BIOS
> > >  	 * versions have been unfortunately inconsistent with which
> > > -	 * ACPI index RESET# is on, so hit both */
> > > +	 * ACPI index RESET# is on, so hit both
> > > +	 */
> > >  
> > >  	if (flag) {
> > >  		ret = dev->platform_data->gpio0_ctrl(sd, 0);
> > > @@ -1019,8 +1020,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> > >  		dev->first_gain = AnalogGain;
> > >  		dev->first_diggain = DigitalGain;
> > >  	}
> > > -	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +
> > > -	((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8); */
> > > +	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +		*/
> > > +	/* ((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8);	*/
> > >  
> > >  	/* set frame length */
> > >  	if (FLines < coarse_integration + 6)
> > > @@ -1035,7 +1036,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> > >  
> > >  	/* set coarse integration */
> > >  	/* 3A provide real exposure time.
> > > -		should not translate to any value here. */
> > > +	 * should not translate to any value here.
> > > +	 */
> > >  	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
> > >  				REG_EXPO_COARSE, (u16)(coarse_integration));
> > >  	if (ret) {
> > > @@ -1044,7 +1046,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> > >  	}
> > >  
> > >  	/*
> > > -	// set analog/digital gain
> > > +	 * set analog/digital gain
> > >  	switch(AnalogGain)
> > >  	{
> > >  	case 0:
> > > @@ -1069,8 +1071,9 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> > >  	*/
> > >  	if (DigitalGain >= 16 || DigitalGain <= 1)
> > >  		DigitalGain = 1;
> > > -	/* AnalogGainToWrite =
> > > -		(u16)((DigitalGain << 12) | AnalogGainToWrite); */
> > > +
> > > +	/* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
> > > +	 */
> > 
> > this is best recommended for one line comment:
> > 
> > /* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite); */
> 
> It then extends beyond 80 character in length. Will that be acceptable?
> 

if the intention is to stay within 80 characters in length then it's better

	/*
	 * AnalogGainToWrite = (u16)(DigitalGain << 12) | AnalogGainToWrite);
	 */

thank you,

fabio
