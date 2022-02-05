Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05452F26;
	Sat,  5 Feb 2022 07:40:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id l5so17844371edv.3;
        Fri, 04 Feb 2022 23:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GE8YLnpOfkXJ/M62/L0jrAV8ZjZli33TcMgWh60BUns=;
        b=Wlzm0NooyGpEjD+HwFPz8xB5kXfctHqd86/eBwkrMC3Ct1wmVtH98U+ow768ValQMt
         yUtnwHwYVKHPP8gXMJcBerEZdfM3UYDhdt4WmY7SkDzNxMDmgW4rv/FmHVy0xwF+/ucM
         /sBZCrku493Xo+R5DAM9vgyBIb17/T1ULzNAZZ2aJCtbeRTDMrHcFm5Vf5nvYE9Zpojw
         0tfUXlVoDZ1eoj71dQSvCUf1oSDBY7L9o8Q2srPAnVT9xqdvkFnYju0VzxETOSh89nxE
         206UoW7tNtixLYu9Vo6S4TVfccQXogrOeCi3a4uuSbqch2Er6QF86cbBvoVhMwYKI8Qh
         pB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GE8YLnpOfkXJ/M62/L0jrAV8ZjZli33TcMgWh60BUns=;
        b=BjOZUc/e0kaYYbbg26ax7xl4/M/0f65+6Ggq8dFaYMT3seEdyUzAkp/DZ1yFN+lC+x
         sfE0WjCXjEO4IqMX0i7+hqEvniFIVFGD1AjX+teOcjJWXDfIH6nmJsDbxdoatIKPsbie
         K+fd/qHDF2qe13zyZki9Sd+/La0WRg91sA8tOBlLk7TNRLCfkdZHf1Zi15jwfaxv4fFq
         6d0vLH4xgoNV8BbPQKz6zKJEUHwtq7FPve3xti/Woutw821g1F9s1NAV17WwYfMjY/UG
         8CM5k3qnLY5FA9om7DB2whr+GESZs9i8+JkFb9P+QijsNFy8jMZ8gwalZBmanq3ll8Cj
         9AYA==
X-Gm-Message-State: AOAM5332++01zbDaP1vNZngzdzIWBrrUuE6yI3fEvmxWEGyIFYOGXyjx
	OKBAQ/6ee4Fbvw2khzPevIs=
X-Google-Smtp-Source: ABdhPJxqSj0Uo5Bw1vRYUdo+ZYd4jLgGloe3T4Y9MH0ZC7QfaEj/rcbDexSZg5tbPiKOhRWDZgqc6A==
X-Received: by 2002:a05:6402:2707:: with SMTP id y7mr3114321edd.30.1644046822919;
        Fri, 04 Feb 2022 23:40:22 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net. [89.212.178.211])
        by smtp.gmail.com with ESMTPSA id lt23sm1387639ejb.173.2022.02.04.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 23:40:22 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: mripard@kernel.org, mchehab@kernel.org, wens@csie.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: Add watchdog for job completion
Date: Sat, 05 Feb 2022 08:40:21 +0100
Message-ID: <12946098.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <YfztZE8ymJ5RERTq@aptenodytes>
References: <20220201183324.493542-1-jernej.skrabec@gmail.com> <YfztZE8ymJ5RERTq@aptenodytes>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 04. februar 2022 ob 10:09:56 CET je Paul Kocialkowski napisal(a):
> Hi Jernej,
> 
> On Tue 01 Feb 22, 19:33, Jernej Skrabec wrote:
> > Currently, if job is not completed for whatever reason, userspace
> > application can hang on ioctl and thus become unkillable.
> > 
> > In order to prevent that, implement watchdog, which will complete job
> > after 2 seconds with error state.
> > 
> > Concept is borrowed from hantro driver.
> 
> Good idea to implement a watchdog here, thanks!
> See comments below.
> 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   |  2 ++
> >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  3 +++
> >  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  4 +++
> >  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 25 +++++++++++++++++++
> >  .../staging/media/sunxi/cedrus/cedrus_hw.h    |  2 ++
> >  5 files changed, 36 insertions(+)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> > 4a4b714b0f26..68b3dcdb5df3 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@ -439,6 +439,8 @@ static int cedrus_probe(struct platform_device *pdev)
> > 
> >  	mutex_init(&dev->dev_mutex);
> > 
> > +	INIT_DELAYED_WORK(&dev->watchdog_work, cedrus_watchdog);
> > +
> > 
> >  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> >  	if (ret) {
> >  	
> >  		dev_err(&pdev->dev, "Failed to register V4L2 
device\n");
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > c345f2984041..3bc094eb497f 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > @@ -24,6 +24,7 @@
> > 
> >  #include <linux/iopoll.h>
> >  #include <linux/platform_device.h>
> > 
> > +#include <linux/workqueue.h>
> > 
> >  #define CEDRUS_NAME			"cedrus"
> > 
> > @@ -194,6 +195,8 @@ struct cedrus_dev {
> > 
> >  	struct reset_control	*rstc;
> >  	
> >  	unsigned int		capabilities;
> > 
> > +
> > +	struct delayed_work	watchdog_work;
> > 
> >  };
> >  
> >  extern struct cedrus_dec_ops cedrus_dec_ops_mpeg2;
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
> > a16c1422558f..9c7200299465 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > @@ -97,4 +97,8 @@ void cedrus_device_run(void *priv)
> > 
> >  		v4l2_ctrl_request_complete(src_req, &ctx->hdl);
> >  	
> >  	dev->dec_ops[ctx->current_codec]->trigger(ctx);
> > 
> > +
> > +	/* Start the watchdog timer. */
> > +	schedule_delayed_work(&dev->watchdog_work,
> > +			      msecs_to_jiffies(2000));
> > 
> >  }
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c index
> > 2d7663726467..a6470a89851e 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > @@ -118,6 +118,13 @@ static irqreturn_t cedrus_irq(int irq, void *data)
> > 
> >  	enum vb2_buffer_state state;
> >  	enum cedrus_irq_status status;
> > 
> > +	/*
> > +	 * If cancel_delayed_work returns false it means watchdog already
> > +	 * executed and finished the job.
> > +	 */
> > +	if (!cancel_delayed_work(&dev->watchdog_work))
> > +		return IRQ_HANDLED;
> > +
> > 
> >  	ctx = v4l2_m2m_get_curr_priv(dev->m2m_dev);
> >  	if (!ctx) {
> >  	
> >  		v4l2_err(&dev->v4l2_dev,
> > 
> > @@ -143,6 +150,24 @@ static irqreturn_t cedrus_irq(int irq, void *data)
> > 
> >  	return IRQ_HANDLED;
> >  
> >  }
> > 
> > +void cedrus_watchdog(struct work_struct *work)
> > +{
> > +	struct cedrus_dev *dev;
> > +	struct cedrus_ctx *ctx;
> > +
> > +	dev = container_of(to_delayed_work(work),
> > +			   struct cedrus_dev, watchdog_work);
> > +
> > +	ctx = v4l2_m2m_get_curr_priv(dev->m2m_dev);
> > +	if (!ctx)
> > +		return;
> > +
> > +	v4l2_err(&dev->v4l2_dev, "frame processing timed out!\n");
> > +	reset_control_reset(dev->rstc);
> 
> I don't think playing with the reset is the right approach here.
> First we don't really know if the reset is shared or not, so this might have
> no effect.

AFAIK only few reset lines are shared in all Allwinner SoC, never for Cedrus 
and even then, this is considered as HW issue. So, I'm good with using reset 
line. This principle is also taken from Hantro driver.

> Then even if it does, wouldn't this just reset the state of the
> registers to an unconfigured state, making it impossible to decode any
> future frame in the same context?

Being stateless core, all context is held in auxiliary buffers, reference 
frames and controls, which are not reset with pulsing reset line, so no, state 
is not lost. Anyway, if decoding fails, you're generally screwed until next 
key frame. You'll have to deal with decoding issues/artefacts nevertheless.

> 
> Honestly I'm not sure what a good process would be to get back on track
> here so I would be tempted to just do nothing an return errors.
> 
> That's already better than being stuck.

Doing nothing will solve only current job, but HW will still be stuck in 
decoding state. I doubt reprogramming registers and triggering new decoding 
will actually do anything.

I'll check BSP lib sources again. Maybe selecting non-existing decoding mode 
would reset the core. That is already suggested as good thing to do in order 
to put core in low power mode.

IMO we have to do something. Doing nothing will probably just lock up the core 
until next reboot or maybe until trying different decoding mode.

Anyway, I have to find another way to cause decoding job to time out. Currently 
I'm doing this with IOMMU on H6, but that brings down several other things, 
which requires reboot anyway.

Best regards,
Jernej

> 
> Paul
> 
> > +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx-
>fh.m2m_ctx,
> > +					 VB2_BUF_STATE_ERROR);
> > +}
> > +
> > 
> >  int cedrus_hw_suspend(struct device *device)
> >  {
> >  
> >  	struct cedrus_dev *dev = dev_get_drvdata(device);
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> > b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h index
> > 45f641f0bfa2..7c92f00e36da 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> > @@ -28,4 +28,6 @@ int cedrus_hw_resume(struct device *device);
> > 
> >  int cedrus_hw_probe(struct cedrus_dev *dev);
> >  void cedrus_hw_remove(struct cedrus_dev *dev);
> > 
> > +void cedrus_watchdog(struct work_struct *work);
> > +
> > 
> >  #endif




