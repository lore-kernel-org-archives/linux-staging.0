Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50960634
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 04:17:50 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id a64so5958555vsc.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Dec 2022 20:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ixVfnoBjYbfOKMbrMo78iOagSqVmsOEMtkWXnl7+1Mg=;
        b=YH85DUnZg6aBqH+TGUu5oaDCR6VI6rAKJK+xV/01pTrNDXgjGYawcgKy8hTGpZHF43
         2HRXmwgJItve15LH5T8JZzlJPByTHsOobI/5KjiqnB05YTnuHiK1sZjPWv8Vu92EWBOA
         vMjWKYtB2zdN2kGCLrXlh/HcSONCSBn5POY9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixVfnoBjYbfOKMbrMo78iOagSqVmsOEMtkWXnl7+1Mg=;
        b=3p93mkK2/QGpuWoFsdxFeHKCsTegoCWPj5NTFWEK+347xj3o7iEL7o9GLsN4MuAR43
         cDRk5+87NeRThgT8v+PLuwOv08lwM5dO64AXN+eX6FeAKcnER3paXw9tEDpJ6JRvkwXY
         OtN7HXhsFe7HExHL6aBLi5JJ8fWlDb7mlUQmjsZhriAlQNil00oEGixKWzf9kjKX54Ub
         eqHYEdgTYSa5sF2LHb4A8du+iBxdtyntbyFECSWODNk7uPrMlHzu1WYHrpRTBXFnsihW
         J369gOs5QojW7FBqxvOo3dNLsz/JcENNZbxAg5p1zxCOvVWO234gvdtKCNq0CnDMkEDz
         sKLg==
X-Gm-Message-State: AFqh2kosayKJ0GPnPxM8FMlAUPEweQMjvG0DycfaSK+lgZ8pSJGORWeX
	CYZMee7Cq3gUHk5zNMmdxJyo1+7ANMZtmkYYeMhZXA==
X-Google-Smtp-Source: AMrXdXtOw254JHHtoeUJ7IvvFyAdlF2AawF+OldnipmmrsBWfhK9LpuaPV1U6UUtuS66NMf8+N6xMKoEYThVYvFFfug=
X-Received: by 2002:a05:6102:3e06:b0:3b5:fd8:7948 with SMTP id
 j6-20020a0561023e0600b003b50fd87948mr2139717vsv.85.1672028269104; Sun, 25 Dec
 2022 20:17:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221223193807.914935-1-nicolas.dufresne@collabora.com> <20221223193807.914935-4-nicolas.dufresne@collabora.com>
In-Reply-To: <20221223193807.914935-4-nicolas.dufresne@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Dec 2022 12:17:38 +0800
Message-ID: <CAGXv+5GBhZ4U4y_KGrBdvgmy7odcVvH=ZJEMtsfjPvw4tQUV1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: rkvdec: Re-enable H.264 error detection
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@collabora.com, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 24, 2022 at 3:39 AM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> This re-enable H.264 error detection, but using the other error mode.
> In that mode, the decoder will skip over the error macro-block or
> slices and complete the decoding. As a side effect, the error status
> is not set in the interrupt status register, and instead errors are
> detected per format. Using this mode workaround the issue that the
> HW get stuck in error state, and allow reporting that some corruption
> may be present in the buffer to userland.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 23 +++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 4fc167b42cf0c..dfe3e235f099a 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -1162,14 +1162,15 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>
>         schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(2000));
>
> -       writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> -       writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
> +       writel(0xffffffff, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> +       writel(0xffffffff, rkvdec->regs + RKVDEC_REG_H264_ERR_E);

Use RKVDEC_H264_ERR_EN_HIGHBITS() here? Only lower 30 bits are valid.

>         writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
>         writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>
>         /* Start decoding! */
>         writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
> -              RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
> +              RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E |
> +              RKVDEC_H264ORVP9_ERR_MODE,
>                rkvdec->regs + RKVDEC_REG_INTERRUPT);
>
>         return 0;
> @@ -1183,10 +1184,26 @@ static int rkvdec_h264_try_ctrl(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
>         return 0;
>  }
>
> +static int rkvdec_h264_check_error_info(struct rkvdec_ctx *ctx)
> +{
> +       struct rkvdec_dev *rkvdec = ctx->dev;
> +       int err;

u32?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +
> +       err = readl(rkvdec->regs + RKVDEC_REG_H264_ERRINFO_NUM);
> +       if (err & RKVDEC_STRMD_DECT_ERR_FLAG) {
> +               pr_debug("Decoded picture have %i/%i slices with errors.\n",
> +                        RKVDEC_ERR_PKT_NUM(err), RKVDEC_SLICEDEC_NUM(err));
> +               return VB2_BUF_STATE_ERROR;
> +       }
> +
> +       return VB2_BUF_STATE_DONE;
> +}
> +
>  const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops = {
>         .adjust_fmt = rkvdec_h264_adjust_fmt,
>         .start = rkvdec_h264_start,
>         .stop = rkvdec_h264_stop,
>         .run = rkvdec_h264_run,
>         .try_ctrl = rkvdec_h264_try_ctrl,
> +       .check_error_info = rkvdec_h264_check_error_info,
>  };
> --
> 2.38.1
>
