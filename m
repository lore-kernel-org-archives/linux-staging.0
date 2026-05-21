Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3536405C
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355451; cv=pass; b=UWerQ7efkXPXEP10IhK4y/fqhILcIQ8ugVhVMfr5+YF0seXXiZHYZzB5yea98+mXb1Zm9/aNB2uCrp1hPPg7o+s34HBSLoRWu2yh0ApmrUBmb24eT3b0kZ4HgPx5J74QopMhw7K1siUYJ/eR/63hbIa/wfythk9nSO3B5F3ZMrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355451; c=relaxed/simple;
	bh=RL59BZOrhPjg0L0Ms+OIJfvtIFaBX3/J/gg5/XayWR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZz5HErmISBn0TGgn+UaLGZdOkD6xVIPfVDqkvc9gdIxDW/5b2zCBmBAwyXxsZIuuPyKko+BjaJtJYwAy7KqwV8A5SB50JTUu0UXN7Ldx+TsO8t4o+u6zuo1DfhsmlN3uNxIAg23KwLjv0o4BRfKWJ9HQRR75vMP8pWhUtJCKIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAslKgto; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAslKgto"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7de44ed7a11so6111220a34.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 02:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779355446; cv=none;
        d=google.com; s=arc-20240605;
        b=UI2HICknoYAVMiB8b7GNhdGd3K4hZpyUtsnFwL8Qo8dbA0aL+NAvaR/cGbDeGLuJN+
         3Rb9LOGFXvwz/yF45dXHLwTxnNK4WDehYCxClYEqMUXdsnTK+TtrfmwTVDRLPAfj/rsS
         ufGrBdAGmBrqytj5FDJk1JPQ3k8fY+kdrYlbrXIc06JduR8ojeOlB4lfx1lCNTsF4LjA
         hdGNuWAtJunE5TK4a8qGuLqfkTSfJ+Ac0p39SsG4uy7bs8cahHkioBDyXzGxoSzkreBI
         MOZiljBG6v/ALqecuyqcKjJaIt7VvP7iWEyXfyn2agsZjqRwmGWulE8DZ3JcpnVfxiLV
         jzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        fh=bRuRZ5UTsHL2KTmZ9vu5SxwpKG8Mg1+TI4b3oupGg6c=;
        b=TdS6qcxpgw1wmfkzA5gUHQX89+APGAWPCXDblXAWIDEbxL4G3no9vtru8hHDL/tOf0
         nxUbxbO3UXC2OCSU6xaK8GtfWRJSpBGDhCM101+aLvv3jw52ovwb8j4OIERzSOFlTPCC
         jyoigkMC4cCGZBdV/u/6x6qBJggCZwuKXBaxDg9mlPdq29uANuEFGb1WGTFMzo6Acngd
         Y822rlJ3vVeqTCqY03NNhidgVEWY0LdZ81f0FDh3krXUhGDLOinJmr+02BPvK9Pbh5SM
         qLp7v7/A/bvdDN65VS6vn8Rl0e4XgpK2i3oGfGyTsnIS4RHp3D9iBPQBpvDjW8ZpRUl8
         RNkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779355446; x=1779960246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        b=aAslKgtoSQlCKyO7PSNb+By09pMD+qIUCaVr9+dxBDK+hJqmijFNRCQWe5dm2z4Ms8
         vpzahsKID/ssgHrONIwMA3RwqNNz4ImKTfitAMwn8Fu9OAeK/bLoTE7KYF5b/4CXcaUT
         n1uM6QtJUI8tlyPAgtVKrfytWWKf299JY3SRPPuTASApsOpFc8VOaxTY4J6lUYneEYey
         nn2y8xZdqS8AXNG753mZpvEn9l71DjpVcmG0A84pHOrsVdnCYeHvNyYR023HMEqpAcZY
         I2HUPWw5yV7GQAbiw6jl8+GW1O3oNztA1NnNf5+MP61crZ5J3WwnIvFoilj5ZqlvGAma
         NbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355446; x=1779960246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bg/32xNRu9xmU6RjD3VE0ZNzN4b0mPq9saaOodPsoaY=;
        b=tL1ZzGchO1V4RVrA+2ybnpXKkAL0dmZLWSUTJvyrQzs35QsgeZrrZhQBzXA/T780GV
         TftVX0c+oN+TPazsE+EFYYGDQMGfwh7FE9NiHfQN2sIRfXATj6y67NqHEaP8W6VQyGoE
         uBZijwxG9EPJmSCBrBDfhKDJ6OrIzFsfho+P1NcIDUFGZFg1UtqSRQcfI0pQJ9DP+soW
         ZYJSAfYZrMs/cw6upetpmnePQ2KWhSoCLKrLsRUNpiFuhlZmfQ/9iwiN4FK/GI2bA/LU
         2p4H68S95PwsCOQfwqWHjyTa059lIdfjIiQRUyfZR7mtR/NjzRUMEbeBFrFLvys3f883
         3Sxw==
X-Forwarded-Encrypted: i=1; AFNElJ+awwGt0jcSA4+hqqsWUsLinBcJW0VOWJc9e/u3w/nj9UXoXSz3QJ3aI4+a4m1cVYFhEGjNXUjB/3EWQXVz@lists.linux.dev
X-Gm-Message-State: AOJu0YyGASYIIjoit7h04MgmaIkF24A7rHbHJpqYfCXAa6o3JhpF9FAn
	Mh2luJE3YmicjYI7uWP2IvfoHOySTjqrTD2lML5VvmeRE/xQMIlg2t4aTRg8qB5frFq0qzxwPW9
	X+GFeJRMygVDjv2OjWo9IVmrH2tI6upA=
X-Gm-Gg: Acq92OFX5Lfj4iJYzKUL/QwoT5YYvwbGbpmVa53ei/ykhyp8zenRIhZjd3mL0tnvFny
	IFEUHwV4RFV2eR+QbhgHRLi+KGSKwAZ0r0LHRkqgkh35FQUrq7bqPSUuz+cVyc/Ln/0pYX392qk
	sXQYN/AkK2MUXNBejutuusvJjmY4ak8QiIidc1W46HBFBfyjGwwP4lc/FeDlRDYS26orVkVsA4C
	KiBCNT0DqkBvu97NDgQe86ol0FxakH6OzMZQBJumZtD5Lmc5h63Qbe29tejxmzeu0VcMV6jxsmd
	hGv8AbbBfbb5DWpImtxa+jRSrGZzYEKpQpsUiRajiZsS9KRHGkb1ktzZq2Mk3NBNz0pyBmfM6VM
	cLefT
X-Received: by 2002:a05:6820:81c8:b0:67e:2988:15e1 with SMTP id
 006d021491bc7-69d6ee60692mr915956eaf.16.1779355445586; Thu, 21 May 2026
 02:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-15-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-15-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 21 May 2026 12:53:42 +0330
X-Gm-Features: AVHnY4JLgYD5g8KSsZAQsfTJHSovnmg95Dqn-5an288CZbWMq20rZb5y5QAIb78
Message-ID: <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Store the active format using the common V4L2 subdev active state
> instead of our local copy of it.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  16 ++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  18 ++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++++----------
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 --
>  5 files changed, 82 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index e7b99cee63d6..24e731bcabe9 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -595,11 +595,25 @@ static int sun6i_isp_capture_link_validate(struct m=
edia_link *link)
>                 media_entity_to_video_device(link->sink->entity);
>         struct sun6i_isp_device *isp_dev =3D video_get_drvdata(video_dev)=
;
>         struct v4l2_device *v4l2_dev =3D &isp_dev->v4l2.v4l2_dev;
> +       struct v4l2_subdev *proc_subdev =3D
> +               media_entity_to_v4l2_subdev(link->source->entity);
>         unsigned int capture_width, capture_height;
>         unsigned int proc_width, proc_height;
> +       struct v4l2_subdev_format proc_subdev_format =3D {
> +               .which  =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad    =3D link->source->index,
> +       };
> +       int ret;
>
>         sun6i_isp_capture_dimensions(isp_dev, &capture_width, &capture_he=
ight);
> -       sun6i_isp_proc_dimensions(isp_dev, &proc_width, &proc_height);
> +
> +       ret =3D v4l2_subdev_call(proc_subdev, pad, get_fmt, NULL,
> +                              &proc_subdev_format);
> +       if (ret)
> +               return ret;
> +
> +       proc_width =3D proc_subdev_format.format.width;
> +       proc_height =3D proc_subdev_format.format.height;
>
>         /* No cropping/scaling is supported (yet). */
>         if (capture_width !=3D proc_width || capture_height !=3D proc_hei=
ght) {
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index b7ef33fa2b13..0cc48e2bc8c6 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -43,11 +43,14 @@ static const struct sun6i_isp_params_config sun6i_isp=
_params_config_default =3D {
>         },
>  };
>
> -static void sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_d=
ev)
> +static void
> +sun6i_isp_params_configure_ob(struct sun6i_isp_device *isp_dev,
> +                             const struct v4l2_mbus_framefmt *mbus_forma=
t)
>  {
>         unsigned int width, height;
>
> -       sun6i_isp_proc_dimensions(isp_dev, &width, &height);
> +       width =3D mbus_format->width;
> +       height =3D mbus_format->height;
>
>         sun6i_isp_load_write(isp_dev, SUN6I_ISP_OB_SIZE_REG,
>                              SUN6I_ISP_OB_SIZE_WIDTH(width) |
> @@ -112,10 +115,12 @@ static void sun6i_isp_params_configure_wb(struct su=
n6i_isp_device *isp_dev)
>                              SUN6I_ISP_WB_CFG_CLIP(0xfff));
>  }
>
> -static void sun6i_isp_params_configure_base(struct sun6i_isp_device *isp=
_dev)
> +static void
> +sun6i_isp_params_configure_base(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat)
>  {
>         sun6i_isp_params_configure_ae(isp_dev);
> -       sun6i_isp_params_configure_ob(isp_dev);
> +       sun6i_isp_params_configure_ob(isp_dev, mbus_format);
>         sun6i_isp_params_configure_wb(isp_dev);
>  }
>
> @@ -170,14 +175,15 @@ sun6i_isp_params_configure_modules(struct sun6i_isp=
_device *isp_dev,
>         sun6i_isp_load_write(isp_dev, SUN6I_ISP_MODULE_EN_REG, value);
>  }
>
> -void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev)
> +void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat)
>  {
>         struct sun6i_isp_params_state *state =3D &isp_dev->params.state;
>         unsigned long flags;
>
>         spin_lock_irqsave(&state->lock, flags);
>
> -       sun6i_isp_params_configure_base(isp_dev);
> +       sun6i_isp_params_configure_base(isp_dev, mbus_format);
>
>         /* Default config is only applied at the very first stream start.=
 */
>         if (state->configured)
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> index 50f10f879c42..c0d6cff95d54 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
> @@ -36,8 +36,8 @@ struct sun6i_isp_params {
>
>  /* Params */
>
> -void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev);
> -
> +void sun6i_isp_params_configure(struct sun6i_isp_device *isp_dev,
> +                               const struct v4l2_mbus_framefmt *mbus_for=
mat);
>  /* State */
>
>  void sun6i_isp_params_state_update(struct sun6i_isp_device *isp_dev,
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/dri=
vers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> index 46a334b602f1..9073a7f3f8c8 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
> @@ -15,17 +15,6 @@
>  #include "sun6i_isp_proc.h"
>  #include "sun6i_isp_reg.h"
>
> -/* Helpers */
> -
> -void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
> -                              unsigned int *width, unsigned int *height)
> -{
> -       if (width)
> -               *width =3D isp_dev->proc.mbus_format.width;
> -       if (height)
> -               *height =3D isp_dev->proc.mbus_format.height;
> -}
> -
>  /* Format */
>
>  static const struct sun6i_isp_proc_format sun6i_isp_proc_formats[] =3D {
> @@ -137,9 +126,10 @@ static void sun6i_isp_proc_disable(struct sun6i_isp_=
device *isp_dev)
>         regmap_write(regmap, SUN6I_ISP_FE_CFG_REG, 0);
>  }
>
> -static void sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev)
> +static void
> +sun6i_isp_proc_configure(struct sun6i_isp_device *isp_dev,
> +                        const struct v4l2_mbus_framefmt *mbus_format)
>  {
> -       struct v4l2_mbus_framefmt *mbus_format =3D &isp_dev->proc.mbus_fo=
rmat;
>         const struct sun6i_isp_proc_format *format;
>         u32 value;
>
> @@ -173,6 +163,8 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev=
 *subdev, int on)
>         struct sun6i_isp_proc_source *source;
>         struct v4l2_subdev *source_subdev;
>         struct media_pad *remote_pad;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *mbus_format;
>         int ret;
>
>         /* Source */
> @@ -191,6 +183,10 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subde=
v *subdev, int on)
>         else
>                 source =3D &proc->source_csi1;
>
> +       /* Active State */
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
>         if (!on) {
>                 sun6i_isp_proc_irq_disable(isp_dev);
>                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> @@ -202,7 +198,7 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subdev=
 *subdev, int on)
>
>         ret =3D pm_runtime_resume_and_get(dev);
>         if (ret < 0)
> -               return ret;
> +               goto unlock;
>
>         /* Clear */
>
> @@ -210,9 +206,12 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subde=
v *subdev, int on)
>
>         /* Configure */
>
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_ISP_PROC_PAD_SIN=
K_CSI);
> +
>         sun6i_isp_tables_configure(isp_dev);
> -       sun6i_isp_params_configure(isp_dev);
> -       sun6i_isp_proc_configure(isp_dev);
> +       sun6i_isp_params_configure(isp_dev, mbus_format);
> +       sun6i_isp_proc_configure(isp_dev, mbus_format);
>         sun6i_isp_capture_configure(isp_dev);
>
>         /* State Update */
> @@ -230,13 +229,17 @@ static int sun6i_isp_proc_s_stream(struct v4l2_subd=
ev *subdev, int on)
>                 goto disable;
>         }
>
> -       return 0;
> +       ret =3D 0;
> +       goto unlock;
>
>  disable:
>         sun6i_isp_proc_disable(isp_dev);
>
>         pm_runtime_put(dev);
>
> +unlock:
> +       v4l2_subdev_unlock_state(state);
> +
>         return ret;
>  }
>
> @@ -259,21 +262,22 @@ sun6i_isp_proc_mbus_format_prepare(struct v4l2_mbus=
_framefmt *mbus_format)
>  static int sun6i_isp_proc_init_state(struct v4l2_subdev *subdev,
>                                      struct v4l2_subdev_state *state)
>  {
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       unsigned int pad =3D SUN6I_ISP_PROC_PAD_SINK_CSI;
> -       struct v4l2_mbus_framefmt *mbus_format =3D
> -               v4l2_subdev_state_get_format(state, pad);
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> +       unsigned int pad;
>
> -       mutex_lock(lock);
> +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +               struct v4l2_mbus_framefmt *mbus_format;
>
> -       mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code;
> -       mbus_format->width =3D 1280;
> -       mbus_format->height =3D 720;
> +               if (pad =3D=3D SUN6I_ISP_PROC_PAD_SINK_PARAMS)
> +                       continue;
>
> -       sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +               mbus_format =3D v4l2_subdev_state_get_format(state, pad);
>
> -       mutex_unlock(lock);
> +               mbus_format->code =3D sun6i_isp_proc_formats[0].mbus_code=
;
> +               mbus_format->width =3D 1280;
> +               mbus_format->height =3D 720;
> +
> +               sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +       }
>
>         return 0;
>  }
> @@ -291,53 +295,31 @@ sun6i_isp_proc_enum_mbus_code(struct v4l2_subdev *s=
ubdev,
>         return 0;
>  }
>
> -static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
> -                                 struct v4l2_subdev_state *state,
> -                                 struct v4l2_subdev_format *format)
> -{
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> -
> -       mutex_lock(lock);
> -
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> -                                                            format->pad)=
;
> -       else
> -               *mbus_format =3D isp_dev->proc.mbus_format;
> -
> -       mutex_unlock(lock);
> -
> -       return 0;
> -}
> -
>  static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
>                                   struct v4l2_subdev_state *state,
>                                   struct v4l2_subdev_format *format)
>  {
> -       struct sun6i_isp_device *isp_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &isp_dev->proc.lock;
> +       struct v4l2_mbus_framefmt *mbus_format;
>
> -       mutex_lock(lock);
> +       if (format->pad !=3D SUN6I_ISP_PROC_PAD_SINK_CSI)
> +               return v4l2_subdev_get_fmt(subdev, state, format);
>
> -       sun6i_isp_proc_mbus_format_prepare(mbus_format);
> +       sun6i_isp_proc_mbus_format_prepare(&format->format);
>
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> -                       *mbus_format;
> -       else
> -               isp_dev->proc.mbus_format =3D *mbus_format;
> +       mbus_format =3D v4l2_subdev_state_get_format(state, format->pad);
> +       *mbus_format =3D format->format;
>
> -       mutex_unlock(lock);
> +       /* Propagate the format to the source pad. */
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_ISP_PROC_PAD_SOU=
RCE);
> +       *mbus_format =3D format->format;
>
>         return 0;
>  }
>
>  static const struct v4l2_subdev_pad_ops sun6i_isp_proc_pad_ops =3D {
>         .enum_mbus_code =3D sun6i_isp_proc_enum_mbus_code,
> -       .get_fmt        =3D sun6i_isp_proc_get_fmt,
> +       .get_fmt        =3D v4l2_subdev_get_fmt,
>         .set_fmt        =3D sun6i_isp_proc_set_fmt,
>  };
>
> @@ -499,8 +481,6 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp=
_dev)
>         struct media_pad *pads =3D proc->pads;
>         int ret;
>
> -       mutex_init(&proc->lock);
> -
>         /* V4L2 Subdev */
>
>         v4l2_subdev_init(subdev, &sun6i_isp_proc_subdev_ops);
> @@ -532,10 +512,14 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *i=
sp_dev)
>
>         /* V4L2 Subdev */
>
> +       ret =3D v4l2_subdev_init_finalize(subdev);
> +       if (ret < 0)
> +               goto error_media_entity;
> +
>         ret =3D v4l2_device_register_subdev(v4l2_dev, subdev);
>         if (ret < 0) {
>                 v4l2_err(v4l2_dev, "failed to register v4l2 subdev: %d\n"=
, ret);
> -               goto error_media_entity;
> +               goto error_subdev_finalize;
>         }
>
>         /* V4L2 Async */
> @@ -562,6 +546,9 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp=
_dev)
>
>         v4l2_device_unregister_subdev(subdev);
>
> +error_subdev_finalize:
> +       v4l2_subdev_cleanup(subdev);
> +
>  error_media_entity:
>         media_entity_cleanup(&subdev->entity);
>
> @@ -577,5 +564,7 @@ void sun6i_isp_proc_cleanup(struct sun6i_isp_device *=
isp_dev)
>         v4l2_async_nf_cleanup(notifier);
>
>         v4l2_device_unregister_subdev(subdev);
> +       v4l2_subdev_cleanup(subdev);
> +
>         media_entity_cleanup(&subdev->entity);
>  }
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h b/dri=
vers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> index db6738a39147..26c4327c5ed7 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
> @@ -42,18 +42,11 @@ struct sun6i_isp_proc {
>         struct v4l2_subdev              subdev;
>         struct media_pad                pads[3];
>         struct v4l2_async_notifier      notifier;
> -       struct v4l2_mbus_framefmt       mbus_format;
> -       struct mutex                    lock; /* Mbus format lock. */
>
>         struct sun6i_isp_proc_source    source_csi0;
>         struct sun6i_isp_proc_source    source_csi1;
>  };
>
> -/* Helpers */
> -
> -void sun6i_isp_proc_dimensions(struct sun6i_isp_device *isp_dev,
> -                              unsigned int *width, unsigned int *height)=
;
> -
>  /* Format */
>
>  const struct sun6i_isp_proc_format *sun6i_isp_proc_format_find(u32 mbus_=
code);
> --
> 2.54.0
>

I used LicheePi Zero Dock (V3s) with the following pipeline as test setup.

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified TRY and ACTIVE state handling, including changing TRY
formats without affecting ACTIVE state. Format propagation from the
sink (csi) pad to the source pad was also tested.

I also tested streaming with the sensor test pattern enabled and
verified the captured output was correct.

Tested-by: Arash Golgol <arash.golgol@gmail.com>
--=20
Regards
Arash Golgol
