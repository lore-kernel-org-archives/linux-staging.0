Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445892F23
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 12:31:12 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id p5so49233908ybd.13
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 04:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yfYLtbVg7Jphgpqo5l2mfLMwKt3fmTcNOyyPV835z9U=;
        b=X73BVSASthoFh71ZUYqhPOBlmWD6VlnN6mtxlLeUi48uyVMU0ZaQsH/cmXLKhp1Jui
         4usjsDrOE/K++FH8OeqG4WNNAOcG9B+4N4GSjY7QwCYxcbUEhBC2Y/nh2OUlwsgnjeox
         eUtinaYsaItLRMZrGl5DhrtfLCm02TgJMPJqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yfYLtbVg7Jphgpqo5l2mfLMwKt3fmTcNOyyPV835z9U=;
        b=h1J5HbJKlzxlbt4H4vZV6Nw1zLzaXTaXjUlvMb1jqvt86hudl4Aq6oWD0R0sLk3llA
         t6QCgnElcZnhMHmGvLmT36KJhzwSMy6T0ITZ7B6MdZY8ou9WjgE6FjWs2bpQUbNJ8HbK
         4g22rSnX5yRp79fRIcNp4m1MlcRsgfDBfMxl8Yl5ujz8VMysLu9Ohp1RdvF1c8csBoc2
         YjNrfM84/RUF9lNJwlw+rMEIdTrKpK8B5IjZ3/XQSVXE/Vk2VRVJj+5TP3d1qRnLqggN
         spgYITERGng/rwaQTOFVShOqm8KaxsUM/c5g+tyFFXrRYgKtBvLQi0CGIw9atEZvxblq
         iwUw==
X-Gm-Message-State: AOAM5323ItRKVVJmQ1uQDTFpWQsnThBZu9eE9ihRidOgVfpll7VZElCR
	9dtiEVamve6ade8IjX5DwehxEf1GupoHziWTYsYIMw==
X-Google-Smtp-Source: ABdhPJyCCYOYwDckY357tk7CH1jqmHDW4BUZPjfdeuj7J3jv7vIaHKcjBTuE6IB72wx2P7IBnypp3hlrdAC/yjDoo7g=
X-Received: by 2002:a81:1b4e:: with SMTP id b75mr4316368ywb.295.1644323471148;
 Tue, 08 Feb 2022 04:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220208105456.321294-1-wenst@chromium.org>
In-Reply-To: <20220208105456.321294-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Feb 2022 20:30:59 +0800
Message-ID: <CAGXv+5HT84sEv9TFV1H=mMEO4oqz4OdwXQGMhwrOf5dtMrjOBQ@mail.gmail.com>
Subject: Re: [PATCH RFC] media: hantro: Implement support for encoder commands
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 6:55 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> The V4L2 stateful encoder uAPI specification requires that drivers
> support the ENCODER_CMD ioctl to allow draining of buffers. This
> however was not implemented, and causes issues for some userspace
> applications.
>
> Implement support for the ENCODER_CMD ioctl using v4l2-mem2mem helpers.
> This is entirely based on existing code found in the vicodec test
> driver.
>
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>
> This is based on linux-next-20220207, and was tested on RK3399 with
> Gstreamer running the JPEG encoder. It was also tested on ChromeOS
> 5.10 on Kevin with the video encoder used in ChromeOS ARC, which
> requires this.
>
> Everything works OK, but since I'm not very familiar with the mem2mem
> framework, I might be missing something, causing resource leaks.
> Hence this patch is labeled RFC.

And it seems I failed to handle the case where the last capture buffer
is empty.

Will rework and send a new version tomorrow.


ChenYu

> ---
>  drivers/staging/media/hantro/hantro_drv.c  | 10 +++++
>  drivers/staging/media/hantro/hantro_v4l2.c | 44 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index bc9bcb4eaf46..ccd47eee5c43 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -56,6 +56,10 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
>         return hantro_get_dec_buf_addr(ctx, buf);
>  }
>
> +static const struct v4l2_event hantro_eos_event = {
> +       .type = V4L2_EVENT_EOS
> +};
> +
>  static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
>                                     struct hantro_ctx *ctx,
>                                     enum vb2_buffer_state result)
> @@ -73,6 +77,12 @@ static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
>         src->sequence = ctx->sequence_out++;
>         dst->sequence = ctx->sequence_cap++;
>
> +       if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, src)) {
> +               dst->flags |= V4L2_BUF_FLAG_LAST;
> +               v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
> +               v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> +       }
> +
>         v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
>                                          result);
>  }
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 67148ba346f5..8c6746637236 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -628,6 +628,39 @@ static int vidioc_s_selection(struct file *file, void *priv,
>         return 0;
>  }
>
> +static const struct v4l2_event hantro_eos_event = {
> +       .type = V4L2_EVENT_EOS
> +};
> +
> +static int vidioc_encoder_cmd(struct file *file, void *priv,
> +                             struct v4l2_encoder_cmd *ec)
> +{
> +       struct hantro_ctx *ctx = fh_to_ctx(priv);
> +       int ret;
> +
> +       ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)) ||
> +           !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)))
> +               return 0;
> +
> +       ret = v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (ec->cmd == V4L2_ENC_CMD_STOP &&
> +           v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> +               v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
> +
> +       if (ec->cmd == V4L2_ENC_CMD_START &&
> +           v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> +               vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> +
> +       return 0;
> +}
> +
>  const struct v4l2_ioctl_ops hantro_ioctl_ops = {
>         .vidioc_querycap = vidioc_querycap,
>         .vidioc_enum_framesizes = vidioc_enum_framesizes,
> @@ -657,6 +690,9 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
>
>         .vidioc_g_selection = vidioc_g_selection,
>         .vidioc_s_selection = vidioc_s_selection,
> +
> +       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
> +       .vidioc_encoder_cmd = vidioc_encoder_cmd,
>  };
>
>  static int
> @@ -759,6 +795,8 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
>         struct hantro_ctx *ctx = vb2_get_drv_priv(q);
>         int ret = 0;
>
> +       v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
> +
>         if (V4L2_TYPE_IS_OUTPUT(q->type))
>                 ctx->sequence_out = 0;
>         else
> @@ -831,6 +869,12 @@ static void hantro_stop_streaming(struct vb2_queue *q)
>                 hantro_return_bufs(q, v4l2_m2m_src_buf_remove);
>         else
>                 hantro_return_bufs(q, v4l2_m2m_dst_buf_remove);
> +
> +       v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
> +
> +       if (V4L2_TYPE_IS_OUTPUT(q->type) &&
> +           v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> +               v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
>  }
>
>  static void hantro_buf_request_complete(struct vb2_buffer *vb)
> --
> 2.35.0.263.gb82422642f-goog
>
