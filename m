Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48922C88
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 10:30:39 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id j5so37344606lfg.8
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xAJV6rpYehfTK9nnciNhDpMqZQK02ZVmng3Ho9JExgo=;
        b=WUFufoTxqA+JTTGukQW4lBGtCc6qPp3iXYEHJKCwXNRrYOf9uteuXRod7K/a5tl41d
         TyytV5xNYgGRRU0zyrhr8aPQD6NAbmd8ax/ctLn3bTFIDRqmRLGFvIIwcsriB/9RNglW
         l58ng7vWsERBcsUQ6nKAO/9d/vt1wUdtqb0MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xAJV6rpYehfTK9nnciNhDpMqZQK02ZVmng3Ho9JExgo=;
        b=Cr3P5dj7m9g5JjbdeIKdB6I1vJOCB3ModLF0gmRRDkz6KRx3L+LIeqNOk+SHD5YdXB
         TX8ygZnrLlBLJD/Qt7YgTMP+HkAS0cd1Ek+Phjpu0X6oXaeiGRj2SBfMiyaQrelIdC0X
         gz4fwo3KR6iTIJrBJOyuGthMDODJaj9lK5Mpq4yvB+IQSHakdB7aR6fkasmfs6M4g2di
         KgS/jCP40Ku4sW0HpHR0z6IJOlEux72/9z3x1u3zeHI5py6W019GfufcWQD5BF4IDOAL
         YdBqIi6eGrbYDB90SSyTbb/LBiuSNaKwnLfRxpYdKrvWYC1vpzQLZieXWOpaq7OMaLo9
         nKHw==
X-Gm-Message-State: AOAM533CgRlIDotQytFOU7DAfFafANy4Z3XunJQ/LeyosMbCApfvl61o
	4DKvtullkDd1U8YA/+dOs46zXYFoamShGMCg8Xh/kw==
X-Google-Smtp-Source: ABdhPJyNLLNnwHcH3PPTk54y5XMO2BahGGz++OdUH26GrfjhbgYTvnY0SqT1yb9T3vmlVy2LqM13V+w9DHH6Lm20TWI=
X-Received: by 2002:a2e:9c4b:: with SMTP id t11mr2805530ljj.376.1633689037713;
 Fri, 08 Oct 2021 03:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210929160439.6601-1-andrzej.p@collabora.com> <20210929160439.6601-8-andrzej.p@collabora.com>
In-Reply-To: <20210929160439.6601-8-andrzej.p@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Oct 2021 18:30:26 +0800
Message-ID: <CAGXv+5GU3f40BijQxazGVtJ0o9rZY_cux9mxRUEtXYHF2Oz-UQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/11] media: rkvdec: Add the VP9 backend
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-staging@lists.linux.dev, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com, 
	Ezequiel Garcia <ezequiel@collabora.com>, Adrian Ratiu <adrian.ratiu@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Sep 30, 2021 at 12:07 AM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> The Rockchip VDEC supports VP9 profile 0 up to 4096x2304@30fps. Add
> a backend for this new format.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Co-developed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/staging/media/rkvdec/Kconfig      |    1 +
>  drivers/staging/media/rkvdec/Makefile     |    2 +-
>  drivers/staging/media/rkvdec/rkvdec-vp9.c | 1078 +++++++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.c     |   52 +-
>  drivers/staging/media/rkvdec/rkvdec.h     |   12 +-
>  5 files changed, 1137 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
>

[...]

> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 7131156c1f2c..6aa8aca66547 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c

[...]

> @@ -319,7 +354,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
>         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>         const struct rkvdec_coded_fmt_desc *desc;
>         struct v4l2_format *cap_fmt;
> -       struct vb2_queue *peer_vq;
> +       struct vb2_queue *peer_vq, *vq;
>         int ret;
>
>         /*
> @@ -331,6 +366,15 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
>         if (vb2_is_busy(peer_vq))
>                 return -EBUSY;
>
> +       /*
> +        * Some codecs like VP9 can contain dynamic resolution changes which
> +        * are currently not supported by the V4L2 API or driver, so return
> +        * an error if userspace tries to reconfigure the output format.
> +        */
> +       vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +       if (vb2_is_busy(vq))
> +               return -EINVAL;

This check is already done in rkvdec_s_fmt(), though it returns -EBUSY
instead. And I don't see similar changes to Hantro, so maybe this isn't
an API limitation as described in the comment? My recent patch [1] also
loosens the restrictions on this.

ChenYu

[1] https://lore.kernel.org/linux-media/20211008100423.739462-3-wenst@chromium.org/

> +
>         ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_output_fmt);
>         if (ret)
>                 return ret;
