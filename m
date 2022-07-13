Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BCF4A0A
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 19:12:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id m16so15318187edb.11
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PLq+vxmSJZQVlzojHgHWzYyGYj9NCZYGnKKKS15nhgc=;
        b=z+8/nuDj0YhTITREu8tEiSYhUaWtxa2u8s/WCri+GGAhIqC1JlOWNr5amsXORQhXvC
         HIjrp0W+dC6fYVhLJKT+zqPvpxBtXVbp5QUhil9xtDc9gq6HbcU1o/Av4IlXLCjJ5llM
         YBYmLJc5gwMUNbqCkOvUx+7S8DxrCJZp0WqnPxLynzfopX5/QBU/GlyE22MUUgPuPwEZ
         YUzweQU4YvgVe010Jf1Tj2yM79HPjV+GDG1DzxV0mn//ddaGYYgso77VgA6wl9Cnceov
         NyVS1PjEJgD/kOTaQSkTPG+cdImEbh3mU2gEU3pSs8lCD/S9namtcGgmYawjdFqtiMYs
         c18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PLq+vxmSJZQVlzojHgHWzYyGYj9NCZYGnKKKS15nhgc=;
        b=AjUJ7id7bvQy/4fAPUpoCnPaEeVkkeYnebb4dBaPWDR+DiO7xX/knUHOXHErpiloRc
         zEimElD1ZBFYmtOUbddI8h6pBdmg7IYqfXEq9UwPwFd25wE6GYmfB46iAQSqiSYFZDrq
         5N5yMXR1noY6rpaSgu/QFC9D3Z1mp6WNIyhYNnqZWlo9wksbsekjWm5ZyA7DBANkHmaq
         9KcAH9eafM6nW2HPx8kRy1nEqvvg8+LWNyomN1e4yOPDLIYS2hIrJc7Ap/658VG63PoQ
         2++YB9nzzCS7rPva1qjz0GKZCj/NBR5l86VKQsUhDxxEG+UgJp/gycp9/ect5RRFc61G
         6eqQ==
X-Gm-Message-State: AJIora/8c7rtX0QHwW32XGdhCucq7uXyMoQIBBFQrOrXSHKd891jl5rD
	0NyvPKSrcT81c2LmolL2axCl0MeKLeZRy98w0V20GA==
X-Google-Smtp-Source: AGRyM1ubxyRQpxoVT6CAxq4vQ0utB7Mdt4cgjhd5Fh5373cKkbymnqNFUGq1gmsYNG8qOCThsrxESBTdiHe6Uajwe7M=
X-Received: by 2002:a05:6402:4396:b0:43a:77b5:41f7 with SMTP id
 o22-20020a056402439600b0043a77b541f7mr6804147edc.45.1657739529010; Wed, 13
 Jul 2022 12:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713163201.136202-1-sebastian.fricke@collabora.com> <20220713163201.136202-3-sebastian.fricke@collabora.com>
In-Reply-To: <20220713163201.136202-3-sebastian.fricke@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Jul 2022 16:11:57 -0300
Message-ID: <CAAEAJfAD49kc_zQsjKjB+v5PNcQXTEyT_fL98a2cSyzhTuk1Zg@mail.gmail.com>
Subject: Re: [PATCH 5/6] staging: media: rkvdec: Enable S_CTRL IOCTL
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	=?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Alex Bee <knaerzche@gmail.com>, Collabora Kernel ML <kernel@collabora.com>, 
	Robert Beckett <bob.beckett@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Yury Norov <yury.norov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

On Wed, Jul 13, 2022 at 1:33 PM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Enable user-space to set the SPS of the current byte-stream on the
> decoder. This action will trigger the decoder to pick the optimal
> pixel-format for the capture queue.
>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 60 ++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 2625e0a736f4..f84579f764ab 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -27,6 +27,17 @@
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
>
> +static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
> +                                      struct v4l2_pix_format_mplane *pix_mp)
> +{
> +       v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> +                           pix_mp->width, pix_mp->height);
> +       pix_mp->plane_fmt[0].sizeimage += 128 *
> +               DIV_ROUND_UP(pix_mp->width, 16) *
> +               DIV_ROUND_UP(pix_mp->height, 16);
> +       pix_mp->field = V4L2_FIELD_NONE;
> +}
> +
>  /*
>   * Fetch the optimal pixel-format directly from the codec variation. If the
>   * valid_fmt callback is not implemented, then the context variable valid_fmt
> @@ -44,6 +55,27 @@ static int rkvdec_get_valid_fmt(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
>         return 0;
>  }
>
> +static int rkvdec_set_valid_fmt(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
> +{
> +       struct v4l2_pix_format_mplane *pix_mp;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_STATELESS_H264_SPS:
> +       case V4L2_CID_STATELESS_VP9_FRAME:
> +       case V4L2_CID_STATELESS_HEVC_SPS:
> +               ctx->valid_fmt = rkvdec_get_valid_fmt(ctx, ctrl);
> +
> +               pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
> +               pix_mp->pixelformat = ctx->valid_fmt;
> +               rkvdec_fill_decoded_pixfmt(ctx, pix_mp);
> +               break;
> +       default:
> +               dev_err(ctx->dev->dev, "Unsupported stateless control ID: %x\n", ctrl->id);
> +               return -EINVAL;
> +       };
> +       return 0;
> +}
> +
>  static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> @@ -58,8 +90,18 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>         return 0;
>  }
>
> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> +
> +       if (!ctx->valid_fmt)
> +               return rkvdec_set_valid_fmt(ctx, ctrl);

We've discussed this approach with Jonas.
See "[PATCH v2 10/12] media: rkvdec: Lock capture pixel format in
s_ctrl and s_fmt".

https://lore.kernel.org/all/f26407dbf3efc6cc046daaabdbe75c516743a187.camel@collabora.com/

The outcome of the discussion is:
* setting SPS resets the CAPTURE format (as per the spec).
* the application uses ENUM/TRY/S_FMT to negotiate a format, and uses
SPS to filter formats.

Thanks!
Ezequiel
