Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8EC28F9
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 11:37:55 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gh17so20272976ejc.6
        for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/LkbtPQcvwsRsFCT5B2kafAu6Wm//Jx4TksDG+egz0c=;
        b=qj5/Flbj+znEbYrCKN88/BLH1DQQSNRbO1JdpNo36o4slyOTzw8AGeygowAM4/6woR
         l81CdycuLucbenbuxFf4zJAIQ00vD2NIvMG45LP+4H3+jumcWpH6EVpzhsP+dIY/DCk2
         cic8Du6ej5Y1v+OKZuTbzmic5vp0jr8aGdRVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/LkbtPQcvwsRsFCT5B2kafAu6Wm//Jx4TksDG+egz0c=;
        b=D4qWuBcXvYomc4595KGzqR2it0lwbmuKSGG0VJxK7GZF1hVEfz5jNddSZQgU5K4GWQ
         3QpuMOaQaHtamqZMi8kATJ6w+NTNX0RiUqix/meaVPRzzcNOgps/W2tvJWFJgko3UuJw
         Nvrpq+s0yk8ICmBv4nfuogI0Ki5fUtFbL4TM59gfS5/ODuGIddSrbU3S9ynfICLye6MJ
         SkI3o0V6PIZAdrLHaMq+0CE0Krl93zXKG51XYXVzaLCk3S/3C/rGbOlUPU4JwIwDFIep
         S7W1dV+6WJT/qa7iPhE9V3++rg+WjKwg4N60koQg7rV7qHvBbdd2gV0JrDS1gzRdYHpc
         EOHQ==
X-Gm-Message-State: AOAM532iLpov0i18VJGJFr4IjixvEdR09om6DqoML+jIrrpTFcRv/Our
	8JL5Pr3++2sBKw0Lb6yTl6tpNQ==
X-Google-Smtp-Source: ABdhPJz/AQ/g9cFWSF/kO0IUjFAcw7PU+/bypjmMqBnz8vJn84FyVYW3yTumja8Cn3A5+anbddCwXA==
X-Received: by 2002:a17:907:3f89:b0:6fe:e7a7:c038 with SMTP id hr9-20020a1709073f8900b006fee7a7c038mr32987693ejc.730.1653910673717;
        Mon, 30 May 2022 04:37:53 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-2-39-143-183.cust.vodafonedsl.it. [2.39.143.183])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709060ac100b006f3ef214de1sm3900692ejf.71.2022.05.30.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:37:53 -0700 (PDT)
Date: Mon, 30 May 2022 13:37:50 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp-mt9m114: Fix pointer dereferenced before
 checking
Message-ID: <20220530113750.GD99280@tom-ThinkPad-T14s-Gen-2i>
References: <1653897481-25681-1-git-send-email-baihaowen@meizu.com>
 <20220530112232.GB99280@tom-ThinkPad-T14s-Gen-2i>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530112232.GB99280@tom-ThinkPad-T14s-Gen-2i>

On Mon, May 30, 2022 at 01:22:32PM +0200, Tommaso Merciai wrote:
> On Mon, May 30, 2022 at 03:58:01PM +0800, Haowen Bai wrote:
> > The info->data is dereferencing before null checking, so move
> > it after checking.
> > 
> > Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> > ---
> >  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > index 00d6842c07d6..3c81ab73cdae 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > @@ -616,13 +616,15 @@ static int mt9m114_get_intg_factor(struct i2c_client *client,
> >  				   struct camera_mipi_info *info,
> >  				   const struct mt9m114_res_struct *res)
> >  {
> > -	struct atomisp_sensor_mode_data *buf = &info->data;
> > +	struct atomisp_sensor_mode_data *buf;
> >  	u32 reg_val;
> >  	int ret;
> >  
> >  	if (!info)
> >  		return -EINVAL;
> >  
> > +	buf = &info->data;
> > +
> >  	ret =  mt9m114_read_reg(client, MISENSOR_32BIT,
> >  				REG_PIXEL_CLK, &reg_val);
> >  	if (ret)
> > -- 
> > 2.7.4
> > 
> 
> Hi Haowen,
> Looks good to me, thanks.
> 
> Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

Hi,
My bad, Dan is right. Nothing to fix here.
Sorry for previous review.

Regards,
Tommaso
> -- 
> Tommaso Merciai
> Embedded Linux Engineer
> tommaso.merciai@amarulasolutions.com
> __________________________________
> 
> Amarula Solutions SRL
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
> T. +39 042 243 5310
> info@amarulasolutions.com
> www.amarulasolutions.com

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
