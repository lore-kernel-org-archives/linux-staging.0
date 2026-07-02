Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7939BFFE
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977919; cv=pass; b=kK3yHM/NPp9MeTnFq7NOvuW2cTpzh0pCUdCZcw0WV7ktT4UyNscEtoGxhtI8aprBCWZAtVQ4SRqhv3USnWPm7wP4pn/3epJQItr/dnaNdtpNiSipzKHLPbXkXc9ON6XctZiA00r6qLsb0kz4Zjelm8ozEPHu3XA1D2Llu5kw47M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977919; c=relaxed/simple;
	bh=3A0v2XtqozOP+7zUrZIKciBmJ4WY0eQRWYUXouRob2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQfIzNvuAn6WpiWwwpqDnQl+pRbPJZ8W6QIKFAdx+l6v8PLfYooOMztvCY8uOI5/tnPKssxwrv76DZnhD/UXN+lns2UBEyVJJUWWSv8XCU+RWsHe4X29Ada6iGioSp5/2EV/k3R/DINGGIdAk2d0e+1YOc10RcDbCx2cDECBGME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ovr6OO81; arc=pass smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ovr6OO81"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-69ed219d3ecso1057198eaf.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 00:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782977915; cv=none;
        d=google.com; s=arc-20260327;
        b=SG/2wIGKv/QsYwd/ZWnJyFxrMVlHNXzlLgypHMXoj7XtX09jeCwVr4tr7x6ZeUkhI9
         0CrgEfaAtiZ+AOs2pArdR5XM17vm+k+1P4+oBy8IgtmyoE7mcgAz5wGFWiW10fci672S
         zqRcrIPFYUHbr5SLnlkejQQ7uHD5bxTMQzDt57kYqHIzMbIyuFfJpvtqppE8JPRpMHgk
         bIlQTpA0GFF/mHwFhTXoevhzgSvpO0Bulx+Jk55vKDp8Wm+WGMQxoJa1UzwSoo7E5PR+
         7rFGmWrxjQVOp+CiUwBe4PvzxHYKb9eQCch0NtrvCislSGci3kmLVckVy4Tt0HoJ8ccB
         nIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E7tAThkTU62sF2pLGd0LQMWFOOCDs+XQSemtf4LuUt4=;
        fh=KB5QHeJsUTt8CIV5uemLe5hef0MNHAeuXWwbDS7tbx0=;
        b=Y8yxrTwlecPeU/r9xy69gECmQyA7QDGpv3CeC89U/jI7JR4hgb7TaB8rsPsxyqaCPj
         tRlc4I9pGIMBxSE+91PdCLBLDB0bPz1EIdttFMJfAqZqsk7Af/uck1TgzuzWgJKNFd7T
         PQeN+JMPJljLRgmfd/RBmFKuX8rSHi3nuEmEmqp4fuPrW8ofc9zvGZngVn5HEx1v+KE7
         rKQtxbQu4CltGYuoSbGqvVSsNaQdw1sjiHMcTTfKJhlD9G/T6hS8rCGx1cN3NKtRnUlR
         iz69DbQJpS0DEB+6SADkAnDYy2SXSaMBjFFaFyFDrp2rkfV+uE/I2Jfm62SUOzKtMRS+
         /t+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977915; x=1783582715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7tAThkTU62sF2pLGd0LQMWFOOCDs+XQSemtf4LuUt4=;
        b=Ovr6OO81XqUCqh/uu3n5MBmQ+KWEIxPMuHReGaoKHeGTEbqiK2g9HDge35bCyoTy8N
         GpVV/LKFD/RqCP83y0A+xvYlazrqn5QpUrfjdFCbbiy7rYlL7CzHjX7gY0hpP2z4sdw4
         aTzSmwRrxrODwxwBKYDq22hMb36gpHI3ciqgI+GwlpIt1S8eTpV1kFhKv52MAVK1qiXD
         GsFPdC1VBZnhB1ssJEHQYTB8KFxSiuPYutSiRl0WOUP841ZOGUO/gVDeJwOGG6295jXn
         Cxhg1aCOpDjkrDReNbhegGq7r8wOvKONPpnEYF9liRgJthsN9wtwfViWBOdzEqWNkDrX
         f77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977915; x=1783582715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E7tAThkTU62sF2pLGd0LQMWFOOCDs+XQSemtf4LuUt4=;
        b=kC92bjsJH5rSGfkDWg30yE2HV+rMAkSUr5yGzG+694RLbhOr5v/M4S5uDjp5qLBVra
         32A93ATPUD3Ch13BPAo7LsKYUWNDI6nJ5yuucVpBrKh4wbkDQ7TBdsuhYBNI5zyIXEug
         CDgnlb9GMfZuJ/MYNQ+2nym+BrTc6sH31+lAtYW7KmLPTlZDqqml5iCJS3g054RNgEsE
         lYegXaJJC1PNhv7OHT75XI0mtlvK8Zp7r9c8V/sK69+eoWjLe9iBTFHIvbtngw2WgiW/
         +tlpXhGzdJGqUGEf04ykzNvxSWjgy79Oen9GU1JKpxZ1wuqkdP7i1ujEDbZ9D+mkJR81
         qK0g==
X-Forwarded-Encrypted: i=1; AFNElJ/Ab4+s2PRRWVoQppJyanelJu0lo1JoebOpoBVEgz8lPdGa8IRcDeGryRQo2r3EwmGNVo+GyGx+9Xe2XNfu@lists.linux.dev
X-Gm-Message-State: AOJu0YxzOcxy9hR/LrZC6iGBeagVT1iPPH+9/yQL3C+vB7MGqOsVVoyH
	m3jCLJrGKSX9RXzrU1egKzheVZ1ngYr8+HzdmOzq9EwgQXUpMHl5NPNhvTB+mRCS/ROVXT28YeF
	57NZhG70vRm3zWWWO93Fy3Bmf9b3wls8=
X-Gm-Gg: AfdE7clUBBIcvIM7anLrIRXVdst/5mAGvmEMbIXYmqGHuMYKoBQytWBtfPbaX3pYy1O
	SLkiDQMtxr/Yi4Ef576c8Vgdbx7aDoHrDeURsTQS7fSamizf6rviafIFVvjoQfqbnKjXX7Mg2KQ
	D4nEinG5TSLx5WHLVLDnM/rgDEROd3gOrwY10+qNpkE+Uh2dAJJyp5kD/8GJuaydkK6GjcQTBk+
	1AUhFblMozjWwa0uT6bIQ6tR5UVfhZxxPea/XxTnQRw+32UJUzaZrA6chl1DIRUxSzydu9hY56I
	nOZxdhoMxOi1LoAJo31UPMXg4Gy+MQleA6qq4takP4Jo1t2PFZyODRxV
X-Received: by 2002:a05:6820:4b09:b0:6a1:5756:10d3 with SMTP id
 006d021491bc7-6a30d79e230mr2586326eaf.22.1782977915404; Thu, 02 Jul 2026
 00:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-2-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-2-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 2 Jul 2026 11:08:23 +0330
X-Gm-Features: AVVi8CeafjPFa4ObcedUXNC1nyKbr1QgWVPZnCBama60Wv2Vd2sSRdfYRIO95ik
Message-ID: <CAMxPZkjeCL=kdpj2V-9b-C68kOsrAv1dPKq4iHn2PEpn2pYEuA@mail.gmail.com>
Subject: Re: [PATCH 01/16] media: sun6i-csi: bridge: Use V4L2 subdev active state
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

On Mon, May 18, 2026 at 1:55=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Arash Golgol <arash.golgol@gmail.com>
>
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
>
> Previously, capture accessed bridge private state directly. After
> moving to framework-managed state, resolve the format through the
> subdev pad API.
>
> The sun6i-csi-bridge hardware does not perform any format conversion.
> Enforce identical formats on the sink and source pads in the set_fmt()
> and init_state() callbacks.
>
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
> Tested-by: Paul Kocialkowski <paulk@sys-base.io>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I noticed this series didn't make it into the v7.2 merge window.
Is there anything still pending on my side before it can be picked up,
or is it just a matter of timing for the next cycle?

Happy to help however I can.

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
>  3 files changed, 86 insertions(+), 105 deletions(-)
>
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd0170..43a85bcc2ba2 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -13,26 +13,6 @@
>  #include "sun6i_csi_bridge.h"
>  #include "sun6i_csi_reg.h"
>
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -                                unsigned int *width, unsigned int *heigh=
t)
> -{
> -       if (width)
> -               *width =3D csi_dev->bridge.mbus_format.width;
> -       if (height)
> -               *height =3D csi_dev->bridge.mbus_format.height;
> -}
> -
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -                            u32 *mbus_code, u32 *field)
> -{
> -       if (mbus_code)
> -               *mbus_code =3D csi_dev->bridge.mbus_format.code;
> -       if (field)
> -               *field =3D csi_dev->bridge.mbus_format.field;
> -}
> -
>  /* Format */
>
>  static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] =
=3D {
> @@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi=
_device *csi_dev)
>  }
>
>  static void
> -sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
> +                                   const struct v4l2_mbus_framefmt *mbus=
_format)
>  {
>         struct device *dev =3D csi_dev->dev;
>         struct regmap *regmap =3D csi_dev->regmap;
> @@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi=
_device *csi_dev)
>                 &csi_dev->bridge.source_parallel.endpoint;
>         unsigned char bus_width =3D endpoint->bus.parallel.bus_width;
>         unsigned int flags =3D endpoint->bus.parallel.flags;
> -       u32 field;
> +       u32 field =3D mbus_format->field;
>         u32 value =3D SUN6I_CSI_IF_CFG_IF_CSI;
>
> -       sun6i_csi_bridge_format(csi_dev, NULL, &field);
> -
>         if (field =3D=3D V4L2_FIELD_INTERLACED ||
>             field =3D=3D V4L2_FIELD_INTERLACED_TB ||
>             field =3D=3D V4L2_FIELD_INTERLACED_BT)
> @@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_cs=
i_device *csi_dev)
>  }
>
>  static void
> -sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
> +                                    const struct v4l2_mbus_framefmt *mbu=
s_format)
>  {
>         struct regmap *regmap =3D csi_dev->regmap;
>         u32 value =3D SUN6I_CSI_IF_CFG_IF_MIPI;
> -       u32 field;
> -
> -       sun6i_csi_bridge_format(csi_dev, NULL, &field);
> +       u32 field =3D mbus_format->field;
>
>         if (field =3D=3D V4L2_FIELD_INTERLACED ||
>             field =3D=3D V4L2_FIELD_INTERLACED_TB ||
> @@ -335,19 +313,20 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_c=
si_device *csi_dev)
>         regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
>  }
>
> -static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *c=
si_dev)
> +static void
> +sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
> +                                 const struct v4l2_mbus_framefmt *mbus_f=
ormat)
>  {
>         struct regmap *regmap =3D csi_dev->regmap;
>         bool capture_streaming =3D csi_dev->capture.state.streaming;
>         const struct sun6i_csi_bridge_format *bridge_format;
>         const struct sun6i_csi_capture_format *capture_format;
> -       u32 mbus_code, field, pixelformat;
> +       u32 pixelformat;
> +       u32 field =3D mbus_format->field;
>         u8 input_format, input_yuv_seq, output_format;
>         u32 value =3D 0;
>
> -       sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
> -
> -       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_format->code)=
;
>         if (WARN_ON(!bridge_format))
>                 return;
>
> @@ -391,16 +370,17 @@ static void sun6i_csi_bridge_configure_format(struc=
t sun6i_csi_device *csi_dev)
>  }
>
>  static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
> -                                      struct sun6i_csi_bridge_source *so=
urce)
> +                                      struct sun6i_csi_bridge_source *so=
urce,
> +                                      const struct v4l2_mbus_framefmt *m=
bus_format)
>  {
>         struct sun6i_csi_bridge *bridge =3D &csi_dev->bridge;
>
>         if (source =3D=3D &bridge->source_parallel)
> -               sun6i_csi_bridge_configure_parallel(csi_dev);
> +               sun6i_csi_bridge_configure_parallel(csi_dev, mbus_format)=
;
>         else
> -               sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
> +               sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_format=
);
>
> -       sun6i_csi_bridge_configure_format(csi_dev);
> +       sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
>  }
>
>  /* V4L2 Subdev */
> @@ -415,6 +395,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>         struct sun6i_csi_bridge_source *source;
>         struct v4l2_subdev *source_subdev;
>         struct media_pad *remote_pad;
> +       struct v4l2_subdev_state *state;
> +       const struct v4l2_mbus_framefmt *mbus_format;
>         int ret;
>
>         /* Source */
> @@ -433,6 +415,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_sub=
dev *subdev, int on)
>         else
>                 source =3D &bridge->source_mipi_csi2;
>
> +       /* Active State */
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
>         if (!on) {
>                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
>                 ret =3D 0;
> @@ -443,7 +429,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>
>         ret =3D pm_runtime_resume_and_get(dev);
>         if (ret < 0)
> -               return ret;
> +               goto unlock;
>
>         /* Clear */
>
> @@ -451,7 +437,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>
>         /* Configure */
>
> -       sun6i_csi_bridge_configure(csi_dev, source);
> +       mbus_format =3D v4l2_subdev_state_get_format(state,
> +                                                  SUN6I_CSI_BRIDGE_PAD_S=
INK);
> +       sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
>
>         if (capture_streaming)
>                 sun6i_csi_capture_configure(csi_dev);
> @@ -472,7 +460,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>         if (ret && ret !=3D -ENOIOCTLCMD)
>                 goto disable;
>
> -       return 0;
> +       ret =3D 0;
> +       goto unlock;
>
>  disable:
>         if (capture_streaming)
> @@ -482,6 +471,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subd=
ev *subdev, int on)
>
>         pm_runtime_put(dev);
>
> +unlock:
> +       v4l2_subdev_unlock_state(state);
>         return ret;
>  }
>
> @@ -504,21 +495,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mb=
us_framefmt *mbus_format)
>  static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
>                                        struct v4l2_subdev_state *state)
>  {
> -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -       unsigned int pad =3D SUN6I_CSI_BRIDGE_PAD_SINK;
> -       struct v4l2_mbus_framefmt *mbus_format =3D
> -               v4l2_subdev_state_get_format(state, pad);
> -       struct mutex *lock =3D &csi_dev->bridge.lock;
> +       unsigned int pad;
>
> -       mutex_lock(lock);
> +       /*
> +        * This subdev does not perform format conversion,
> +        * initialize both pads identically.
> +        */
> +       for (pad =3D 0; pad < subdev->entity.num_pads; pad++) {
> +               struct v4l2_mbus_framefmt *mbus_format;
>
> -       mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_code;
> -       mbus_format->width =3D 1280;
> -       mbus_format->height =3D 720;
> +               mbus_format =3D v4l2_subdev_state_get_format(state, pad);
>
> -       sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +               mbus_format->code =3D sun6i_csi_bridge_formats[0].mbus_co=
de;
> +               mbus_format->width =3D 1280;
> +               mbus_format->height =3D 720;
>
> -       mutex_unlock(lock);
> +               sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +       }
>
>         return 0;
>  }
> @@ -536,53 +529,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev =
*subdev,
>         return 0;
>  }
>
> -static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
> -                                   struct v4l2_subdev_state *state,
> -                                   struct v4l2_subdev_format *format)
> -{
> -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &csi_dev->bridge.lock;
> -
> -       mutex_lock(lock);
> -
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *mbus_format =3D *v4l2_subdev_state_get_format(state,
> -                                                            format->pad)=
;
> -       else
> -               *mbus_format =3D csi_dev->bridge.mbus_format;
> -
> -       mutex_unlock(lock);
> -
> -       return 0;
> -}
> -
>  static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
>                                     struct v4l2_subdev_state *state,
>                                     struct v4l2_subdev_format *format)
>  {
> -       struct sun6i_csi_device *csi_dev =3D v4l2_get_subdevdata(subdev);
> -       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> -       struct mutex *lock =3D &csi_dev->bridge.lock;
> +       struct v4l2_mbus_framefmt *fmt;
>
> -       mutex_lock(lock);
> +       /* The format on the source pad always matches the sink pad. */
> +       if (format->pad !=3D SUN6I_CSI_BRIDGE_PAD_SINK)
> +               return v4l2_subdev_get_fmt(subdev, state, format);
>
> -       sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +       sun6i_csi_bridge_mbus_format_prepare(&format->format);
>
> -       if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> -               *v4l2_subdev_state_get_format(state, format->pad) =3D
> -                       *mbus_format;
> -       else
> -               csi_dev->bridge.mbus_format =3D *mbus_format;
> +       /* Set the format on the sink pad. */
> +       fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> +       *fmt =3D format->format;
>
> -       mutex_unlock(lock);
> +       /* Propagate the format to the source pad. */
> +       fmt =3D v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_=
SOURCE);
> +       *fmt =3D format->format;
>
>         return 0;
>  }
>
>  static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops =3D {
>         .enum_mbus_code =3D sun6i_csi_bridge_enum_mbus_code,
> -       .get_fmt        =3D sun6i_csi_bridge_get_fmt,
> +       .get_fmt        =3D v4l2_subdev_get_fmt,
>         .set_fmt        =3D sun6i_csi_bridge_set_fmt,
>  };
>
> @@ -780,8 +752,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>         };
>         int ret;
>
> -       mutex_init(&bridge->lock);
> -
>         /* V4L2 Subdev */
>
>         v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
> @@ -809,6 +779,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *=
csi_dev)
>         if (ret < 0)
>                 return ret;
>
> +       /* V4L2 Subdev finalize */
> +
> +       ret =3D v4l2_subdev_init_finalize(subdev);
> +       if (ret < 0)
> +               goto error_media_entity;
> +
>         /* V4L2 Subdev */
>
>         if (csi_dev->isp_available)
> @@ -818,7 +794,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>
>         if (ret) {
>                 dev_err(dev, "failed to register v4l2 subdev: %d\n", ret)=
;
> -               goto error_media_entity;
> +               goto error_subdev_finalize;
>         }
>
>         /* V4L2 Async */
> @@ -852,6 +828,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *c=
si_dev)
>         else
>                 v4l2_device_unregister_subdev(subdev);
>
> +error_subdev_finalize:
> +       v4l2_subdev_cleanup(subdev);
> +
>  error_media_entity:
>         media_entity_cleanup(&subdev->entity);
>
> @@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device=
 *csi_dev)
>
>         v4l2_device_unregister_subdev(subdev);
>
> +       v4l2_subdev_cleanup(subdev);
> +
>         media_entity_cleanup(&subdev->entity);
>  }
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> index 44653b38f722..a5b0a6f064dd 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> @@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
>         struct v4l2_subdev              subdev;
>         struct v4l2_async_notifier      notifier;
>         struct media_pad                pads[2];
> -       struct v4l2_mbus_framefmt       mbus_format;
> -       struct mutex                    lock; /* Mbus format lock. */
>
>         struct sun6i_csi_bridge_source  source_parallel;
>         struct sun6i_csi_bridge_source  source_mipi_csi2;
>  };
>
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -                                unsigned int *width, unsigned int *heigh=
t);
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -                            u32 *mbus_code, u32 *field);
> -
>  /* Format */
>
>  const struct sun6i_csi_bridge_format *
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 65879f4802c0..d90abba21309 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
>                 media_entity_to_video_device(link->sink->entity);
>         struct sun6i_csi_device *csi_dev =3D video_get_drvdata(video_dev)=
;
>         struct v4l2_device *v4l2_dev =3D csi_dev->v4l2_dev;
> +       struct v4l2_subdev *src_subdev =3D
> +               media_entity_to_v4l2_subdev(link->source->entity);
>         const struct sun6i_csi_capture_format *capture_format;
>         const struct sun6i_csi_bridge_format *bridge_format;
>         unsigned int capture_width, capture_height;
> -       unsigned int bridge_width, bridge_height;
>         const struct v4l2_format_info *format_info;
> +       struct v4l2_subdev_format src_fmt =3D {
> +               .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad =3D link->source->index
> +       };
>         u32 pixelformat, capture_field;
> -       u32 mbus_code, bridge_field;
>         bool match;
> +       int ret;
>
>         sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_he=
ight);
>
> @@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct m=
edia_link *link)
>         if (WARN_ON(!capture_format))
>                 return -EINVAL;
>
> -       sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_heigh=
t);
> +       /* Resolve csi bridge format. */
> +       ret =3D v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt=
);
> +       if (ret)
> +               return ret;
>
> -       sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
> -       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +       bridge_format =3D sun6i_csi_bridge_format_find(src_fmt.format.cod=
e);
>         if (WARN_ON(!bridge_format))
>                 return -EINVAL;
>
>         /* No cropping/scaling is supported. */
> -       if (capture_width !=3D bridge_width || capture_height !=3D bridge=
_height) {
> +       if (capture_width !=3D src_fmt.format.width ||
> +           capture_height !=3D src_fmt.format.height) {
>                 v4l2_err(v4l2_dev,
>                          "invalid input/output dimensions: %ux%u/%ux%u\n"=
,
> -                        bridge_width, bridge_height, capture_width,
> -                        capture_height);
> +                        src_fmt.format.width, src_fmt.format.height,
> +                        capture_width, capture_height);
>                 return -EINVAL;
>         }
>
> @@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct med=
ia_link *link)
>         /* With raw input mode, we need a 1:1 match between input and out=
put. */
>         if (bridge_format->input_format =3D=3D SUN6I_CSI_INPUT_FMT_RAW ||
>             capture_format->input_format_raw) {
> -               match =3D sun6i_csi_capture_format_match(pixelformat, mbu=
s_code);
> +               match =3D sun6i_csi_capture_format_match(pixelformat,
> +                                                      src_fmt.format.cod=
e);
>                 if (!match)
>                         goto invalid;
>         }
> --
> 2.54.0
>

--=20
Regards,
Arash Golgol
