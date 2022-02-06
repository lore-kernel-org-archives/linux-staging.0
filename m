Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC52F21
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 13:09:25 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id l25so3968793eda.12
        for <linux-staging@lists.linux.dev>; Sun, 06 Feb 2022 05:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MHIz3Dwre4tP6Q9bEyDnouvCJsPoMkCD31ljHi1figY=;
        b=n4em8JyzX1Xmca5wj9Ex2hf6ab5VBqAE25+S/+kRckovgV+6/U2epazWCx43iWv9cR
         aYDRm2UNdFB3lDdMZ/ECBez5QZgn48O5vx3i90N+sjYAt+RsD7/xHRWAZs6GDtZsENeU
         wKgXB0gG8CnR1ZwL63F4/oB6nfNTM3MD4PMZ9E90zbQlp9XkQ4b6jzgVEodLrl7yy5op
         a3h6ep2+ZYf07EVsa2eBQsz20wUqmHvl+VVoF2orEgIuwe6rWh/+ukf9aNTog3YXEzDv
         g12lqmS0M3+b3z6drByy6kZPBZLngY1vT3W4k/9h2izHFNbhSCzcWeNQjmqTxfTCU1ws
         kvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MHIz3Dwre4tP6Q9bEyDnouvCJsPoMkCD31ljHi1figY=;
        b=4/eRtd1y7PWVRnNk0Wg/U/Bifx8q4cqHq+lt1HroyJ9fRQWGQ0VtRhb7M1DonXwroq
         RWM27Rmz7m28e6Xe4AdWA3OlmJ8Xk5s9U2uO+EZ0hxbgMGLlYrkoQuwYXspU4umb/wHQ
         nS/g7lsPg0IpEQTglCNDSsfeBeTOPgXGm17hjH/PImHyh3eVQOVpUkv+WBcTNroDLAFi
         7mIpZLXaNzMUQoN/q28TTa5Asw2KsdSwTrmR5mvESQnpQ+02/Ncv2RykcwtDi4giek3v
         fYY+PionGAq0VO10WCDhIBIVhtNqf6kAeo+/UTRNObm6BjYoTrnLmY7pMeq7hjk1Aopf
         0zqA==
X-Gm-Message-State: AOAM531UB6PY0gQm8pZuVQrY1LKOO7iRMIp0QkO+vdsuqxefzSKNab7x
	jZQfuzfS5f1cfs/1+coRnr9ydmWp0AGURBHFaB+f+w==
X-Google-Smtp-Source: ABdhPJzIGdBf/BwLMf3qdRE5GZYN+c8/w4PVd7M5MgrPgzYMrAWBQIf/AaIXvRrJOY+pnPtpOYwtHhAfQprBX/EXA/o=
X-Received: by 2002:a05:6402:84a:: with SMTP id b10mr8849389edz.143.1644152964025;
 Sun, 06 Feb 2022 05:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201183324.493542-1-jernej.skrabec@gmail.com>
In-Reply-To: <20220201183324.493542-1-jernej.skrabec@gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 6 Feb 2022 10:09:11 -0300
Message-ID: <CAAEAJfALjVhrLcVbS0vyXXPJUy1tmv4PcMbWxte0u9htn+myjw@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: Add watchdog for job completion
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	linux-media <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

On Tue, 1 Feb 2022 at 15:34, Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>
> Currently, if job is not completed for whatever reason, userspace
> application can hang on ioctl and thus become unkillable.
>
> In order to prevent that, implement watchdog, which will complete job
> after 2 seconds with error state.
>
> Concept is borrowed from hantro driver.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

This has been very useful developing Hantro,
to get some indication of hardware being programmed wrongly:

Patch looks correct.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>


> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  2 ++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  3 +++
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  4 +++
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 25 +++++++++++++++++++
>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |  2 ++
>  5 files changed, 36 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index 4a4b714b0f26..68b3dcdb5df3 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -439,6 +439,8 @@ static int cedrus_probe(struct platform_device *pdev)
>
>         mutex_init(&dev->dev_mutex);
>
> +       INIT_DELAYED_WORK(&dev->watchdog_work, cedrus_watchdog);
> +
>         ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to register V4L2 device\n");
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index c345f2984041..3bc094eb497f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -24,6 +24,7 @@
>
>  #include <linux/iopoll.h>
>  #include <linux/platform_device.h>
> +#include <linux/workqueue.h>
>
>  #define CEDRUS_NAME                    "cedrus"
>
> @@ -194,6 +195,8 @@ struct cedrus_dev {
>         struct reset_control    *rstc;
>
>         unsigned int            capabilities;
> +
> +       struct delayed_work     watchdog_work;
>  };
>
>  extern struct cedrus_dec_ops cedrus_dec_ops_mpeg2;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index a16c1422558f..9c7200299465 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -97,4 +97,8 @@ void cedrus_device_run(void *priv)
>                 v4l2_ctrl_request_complete(src_req, &ctx->hdl);
>
>         dev->dec_ops[ctx->current_codec]->trigger(ctx);
> +
> +       /* Start the watchdog timer. */
> +       schedule_delayed_work(&dev->watchdog_work,
> +                             msecs_to_jiffies(2000));
>  }
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index 2d7663726467..a6470a89851e 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -118,6 +118,13 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>         enum vb2_buffer_state state;
>         enum cedrus_irq_status status;
>
> +       /*
> +        * If cancel_delayed_work returns false it means watchdog already
> +        * executed and finished the job.
> +        */
> +       if (!cancel_delayed_work(&dev->watchdog_work))
> +               return IRQ_HANDLED;
> +
>         ctx = v4l2_m2m_get_curr_priv(dev->m2m_dev);
>         if (!ctx) {
>                 v4l2_err(&dev->v4l2_dev,
> @@ -143,6 +150,24 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>         return IRQ_HANDLED;
>  }
>
> +void cedrus_watchdog(struct work_struct *work)
> +{
> +       struct cedrus_dev *dev;
> +       struct cedrus_ctx *ctx;
> +
> +       dev = container_of(to_delayed_work(work),
> +                          struct cedrus_dev, watchdog_work);
> +
> +       ctx = v4l2_m2m_get_curr_priv(dev->m2m_dev);
> +       if (!ctx)
> +               return;
> +
> +       v4l2_err(&dev->v4l2_dev, "frame processing timed out!\n");
> +       reset_control_reset(dev->rstc);
> +       v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> +                                        VB2_BUF_STATE_ERROR);
> +}
> +
>  int cedrus_hw_suspend(struct device *device)
>  {
>         struct cedrus_dev *dev = dev_get_drvdata(device);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> index 45f641f0bfa2..7c92f00e36da 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -28,4 +28,6 @@ int cedrus_hw_resume(struct device *device);
>  int cedrus_hw_probe(struct cedrus_dev *dev);
>  void cedrus_hw_remove(struct cedrus_dev *dev);
>
> +void cedrus_watchdog(struct work_struct *work);
> +
>  #endif
> --
> 2.35.1
>
