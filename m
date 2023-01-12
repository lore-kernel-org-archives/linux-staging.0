Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602CA79C9
	for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 15:30:25 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g13so28966978lfv.7
        for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 07:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKwwjEGopbISTrCjxgfQJsmoWWl/0HgOwyebrt0JLGA=;
        b=QbI169xhV8vhsr4V43oKe3t3ypXsYwuhSqv+U3fpDtFAZlimhEns/OKDdeLbZoZmIh
         vBTAIdpXaeEx1D8wnaC3SOK1pmpgvLkcH52Ack0AR7xityglMY5G15apEjxBliyOTcKf
         KFFNUZ/wh5OgRKL1qOxea/YdXalez4QJD7y6CWBklcPj8VmiUF9OHe+7zenmpRYbEwyj
         vVdl99EChOEYB09vc3Xi2oVNySDI1Kr72mtUi2hElBPN5ZCghAltKgpET/OaAgmQjr1y
         KGcH3IH4RklrAMcPgz1IyWMrFqQh8AnpD12cHrk5PQxIO3ZQD7ZqWRNC9TEbE+lVRNPl
         asWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKwwjEGopbISTrCjxgfQJsmoWWl/0HgOwyebrt0JLGA=;
        b=7RjxPDF7aLmqN/1KsgJ5RXMZ2gKKjJGSHR5i8z6mZyL5w22xF3u9ZwQReqrvVyp4ik
         O3C/4nWuWGV07SxzwF7j8VYgUNAZt/Q8Nj8KI2VgL/0j9IY5FLBs7KvAjgy0mtAmEdTf
         m6p6w9TpYY6l9BGWvXYNfQI5qPo1UW+AvERs1Yd4jYFxnHa+EV4Qi3L5ToOJH2vswAr8
         w7ZGUd36qG3qDEzId6wmMfievSFQQ9fZPGmKOgb3voAYoxn+X9ZWru0+R3JPPmCE47LE
         Lgs1lj+UngEva/NcrGxjwF2q3qKAqzV2i9tasWy8O4+hw3VhrvgvHN8uCx532p3du5Rj
         /pCg==
X-Gm-Message-State: AFqh2kpmCC8qmFn+nragk//PqCJdUzOcDZCIioj/Z5YfXEh4C78Om2/+
	/wZonY4ho5oIuhX8SmZVUegBMQsa5dCBixMe3C6j2A==
X-Google-Smtp-Source: AMrXdXsfoS3G1+dA5+WKzSYh25yd+Y2eQHNON3kw/MeVVXIcC4tY8i5M8+KHlpGkY0ARtDng3p/ekgpCc9RpY74z6no=
X-Received: by 2002:a05:6512:2805:b0:4b5:b18a:c52d with SMTP id
 cf5-20020a056512280500b004b5b18ac52dmr7967483lfb.299.1673537423283; Thu, 12
 Jan 2023 07:30:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com> <20230101-patch-series-v2-6-2-rc1-v2-6-fa1897efac14@collabora.com>
In-Reply-To: <20230101-patch-series-v2-6-2-rc1-v2-6-fa1897efac14@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 12 Jan 2023 12:30:11 -0300
Message-ID: <CAAEAJfDOcYBtWR41BLM-SUnm9oe1t=8ffJS1Kg_V-gYWzUfe8w@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] staging: media: rkvdec: Add a valid pixel format
 check as callback
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Collabora Kernel-domain <kernel@collabora.com>, Robert Beckett <bob.beckett@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

On Thu, Jan 12, 2023 at 9:56 AM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Provide a callback for codec variant drivers to indicate the correct
> output pixel-format. It will either utilize the SPS structure stored via
> the S_CTRL IOCTL or return the default pixel-format.
>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 45 +++++++++++++++++++++++++++++------
>  drivers/staging/media/rkvdec/rkvdec.h |  1 +
>  2 files changed, 39 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index e0e95d06e216..a46f918926a2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -38,6 +38,20 @@ static int rkvdec_queue_busy(struct rkvdec_ctx *ctx, enum v4l2_buf_type buf_type
>                 return 0;
>  }
>
> +/*
> + * Use the current SPS, set by the user via the VIDIOC_S_CTRL IOCTL,
> + * to determine the optimal pixel-format. Each codec is responsible
> + * for choosing the appropriate pixel-format for a given parameter set.
> + */

It seems this assumes there's always only one valid format.
Do you think that will hold true always for RKVDEC and for all codecs?

How about we approach this differently? Instead of having a callback
for codecs to implement, we just maintain a list of valid decoded formats
(in the context) and re-create the list when the SPS is changed (in the S_CTRL).

Possibly simpler and less invasive, not sure if there are any caveats.

Thanks,
Ezequiel

> +static int rkvdec_get_valid_fmt(struct rkvdec_ctx *ctx)
> +{
> +       const struct rkvdec_coded_fmt_desc *coded_desc = ctx->coded_fmt_desc;
> +
> +       if (coded_desc->ops->valid_fmt)
> +               return coded_desc->ops->valid_fmt(ctx);
> +       return ctx->coded_fmt_desc->decoded_fmts[0];
> +}
> +
>  static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> @@ -200,8 +214,9 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
>  static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
>  {
>         struct v4l2_format *f = &ctx->decoded_fmt;
> +       u32 valid_fmt = rkvdec_get_valid_fmt(ctx);
>
> -       rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
> +       rkvdec_reset_fmt(ctx, f, valid_fmt);
>         f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>         v4l2_fill_pixfmt_mp(&f->fmt.pix_mp,
>                             ctx->coded_fmt_desc->decoded_fmts[0],
> @@ -260,13 +275,17 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
>         if (WARN_ON(!coded_desc))
>                 return -EINVAL;
>
> -       for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> -               if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> -                       break;
> -       }
> +       if (ctx->sps) {
> +               pix_mp->pixelformat = rkvdec_get_valid_fmt(ctx);
> +       } else {
> +               for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> +                       if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> +                               break;
> +               }
>
> -       if (i == coded_desc->num_decoded_fmts)
> -               pix_mp->pixelformat = coded_desc->decoded_fmts[0];
> +               if (i == coded_desc->num_decoded_fmts)
> +                       pix_mp->pixelformat = coded_desc->decoded_fmts[0];
> +       }
>
>         /* Always apply the frmsize constraint of the coded end. */
>         pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
> @@ -435,6 +454,18 @@ static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
>         if (WARN_ON(!ctx->coded_fmt_desc))
>                 return -EINVAL;
>
> +       /*
> +        * According to the specification the driver can only return formats
> +        * that are supported by both the current encoded format and the
> +        * provided controls
> +        */
> +       if (ctx->sps) {
> +               if (f->index)
> +                       return -EINVAL;
> +               f->pixelformat = rkvdec_get_valid_fmt(ctx);
> +               return 0;
> +       }
> +
>         if (f->index >= ctx->coded_fmt_desc->num_decoded_fmts)
>                 return -EINVAL;
>
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 332126e7b812..e353a4403e5b 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -66,6 +66,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  struct rkvdec_coded_fmt_ops {
>         int (*adjust_fmt)(struct rkvdec_ctx *ctx,
>                           struct v4l2_format *f);
> +       u32 (*valid_fmt)(struct rkvdec_ctx *ctx);
>         int (*start)(struct rkvdec_ctx *ctx);
>         void (*stop)(struct rkvdec_ctx *ctx);
>         int (*run)(struct rkvdec_ctx *ctx);
>
> --
> 2.25.1
