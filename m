Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455A7339872
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953750; cv=pass; b=Dg1Ojbx00XzMFBRuMc1LWsOJurojceebeN5z7kFNABP+z5kVRDl3icA8vjpXIPFazYyxGbH7ygQ0FcyI26db48bXh+MP8XyY3c37dJEjB9vWDg1b9Ak8vIovb3yl041m0K61y5hIyFdKcsh4BumFXb/TqO/cFVz3smX3SdBFhxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953750; c=relaxed/simple;
	bh=8Nvv30A+3WElDIyVWIGJ6U51jBycEW5osp0TGNnbCqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qInms+TNtORQtleIaX2rmWVTDVfLAvyBIqgCExkl3QFnMHL6VTrQPYdi/Df4vbVF68AsRc/PJCnE4CnaxyI55+LaJsmeOCKAf202FeO/YSSgb5TxBjIaSbr3KvcaI33GCt5lNIO7ysqlsuJ2l4Mu9grsUTM1csE4lHgjDYElEcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TihDamj8; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TihDamj8"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43b53f048beso5146906fac.1
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779953748; cv=none;
        d=google.com; s=arc-20240605;
        b=YyZCBsr1zNaIaxsKAWadpAKWTaqulyW/tWnjG+x8pMul/tIvlMtPDbuqXtU9ZOQNhM
         SZeWv3TUKsp6doe7vVwHNkOjhInL+wWbGRpOamI0965cYi6d4neVnckwFXgCY9qG/4yH
         hYyTmjSsyKrDzO+uORShMj1TIM290NrJC/TLwRgxbTw4mPyyhszeK/3xNq+v+Qz6tjVW
         uhpkk1F7/lCOIeA1R7KMDl7A5GAXbfLB9DW+tG/3IpvzWWkuoJfz7xVeKyFTRC78u/Lm
         qby7wQNpM+DE/08E2fBlARvZ3FhBD8jGN5o+3C3lNITyw3t8QRsFIBi6WhLGtUJE9e2i
         ed6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        fh=ANAsC/NtPpRC00Qufa88ausxXqzzZKEJDhDViGTkIps=;
        b=C84wFseo/KyKuVMMcCGyvJVFE4OJBhzt9iaX+F44hmDAh9+W5rmFfTgzA1X3E6JXWS
         W28yPWN7IJqNgOvR6Orgdv+4EoNC4ieOqpcDnbJp51X6Fkg7lF01yCVdbnS6wlLqHrKA
         nUITwoYpC3uBbj4zRe0tvNKCtpYOw1LTkEJFiku/VqB0s7oqK6Vit2qcdZlS4kp3zBwQ
         yUJoAfZWCrPYcCeEHmJgoZPwulbKdxlZEuCndXFvFTupSwpvleVsBzXxO8evwndbhKU0
         lsFJYCHSMBRex7BPcqlYiAJ5j2J1Ha84m1w+JCwSJeTY4pXgk9Ibeuc2t7NeA8vAa4P/
         zMlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779953748; x=1780558548; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=TihDamj8O5bng0V+D2K3gwCq1s2nh2YmGut3tqt0Bqi3RlT/SDszgMKpSbWspOXIOH
         kEsI4SW9N6SkhzwzfLmqynm2ZELZkPAPz+RN6YtCIzTMfkXB/KqoMLCKyaxAc1uZo6nT
         z/tUuse0FgQsvOkHf3h33zjZGzsuFu+QmWyzl1oSLE35s7vptH4AR74jrQbchHiWfJHN
         TR+plRjO2jjY8jIIYX9R6iTKpjmXUQTMzoP4gwNYwNep5tgBdpEuPWk8kXKuItUQe84h
         8Lds0TiVjzX9jOd/fLM2Uk8P/bmaQFQMpirBnMyYjBpM54hQYExvUmf4Pen56VdL5lCi
         VT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953748; x=1780558548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T20GWQ7AAxX56WT8tx5xeyPGgn/3xota+hYuh6TNyvE=;
        b=d/R9vcqAtMVVO6o8pXlYsVdgNtjLjA7HtogwHbSwESpb1d+jyzWV7MR2rhtwci/3Ty
         T5lN9b83Rg3yAjioOSwoGvQ05TFQFGnwV+qCr2c0ugEz6rJqX+silazYSr928rLBhbq7
         UKpzxUzLJVSLiNQIVQWWTB0FF27RfckAgclHlW1QUR9ADieuUF17vztbt1ThrFV8vkpI
         z4vkelB8ARp8zQAEPPvmSQx2jc8d1swYdVrm3lblEyN2rfY3sjHmxs3LkOon4TfF+Gjy
         HY5tDLeC6mf5pxUc6/nM8C0t94Irr50CnpiUS8gK3eCXcN40xNqeY0E4OczXW7Rijz4V
         hdVA==
X-Forwarded-Encrypted: i=1; AFNElJ+c+sg9uZC1+QOz7WEaPMftBT2xZOx9TvB1Yd/BXOr8maIP9h7ZSh/Iy58kr7F57ojAYd0j13S5g+U4dzPP@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Zo6DdPjiuRKYmewaEHpGv5wYYwxLEbxVdRUNUZZWkdmlY5r8
	PoMA3RPyF85ZED8nimLGx8VuoIRXpxiBxzJ9neoeP8dJOp7nH9SabkUvynYip0RIB3sg5QZVM+Q
	3YysTUzpsQy4PF1679I7CG87h9iiL2CU=
X-Gm-Gg: Acq92OHEmpTko293ZcERKjRqsqjtpUuSfp/VnSCBHTC+fqs9uhMp+H0zGTCJjmNjXRh
	yXL2jmQSYBiHEDjnPmsAM2mLm55bO0VqpfBy/6K0/M0gr+Bxqmy1zf14ZqQtvhtT3SyaKXvh9EY
	XkeQdibht/+i79ykbi4bh49dpzUHT22rAJaVF8XNzY7N9N+cVkEPwNTiLrjBLNHdsk4/8Ubzd/g
	AwKLrhgs43dtclTWkExFpz1c6VM3hrpdB6ZTvcuX3q39kOOEbqvKH/QMJq7BZEUnZepsoBJm5vI
	oJnXBXlUxogI+t6676S5l2P3KxsRjknVth1Yvn5qd3XkN4KfDH7/+t+Os5ptC9DtSbkbKNle1O9
	4Dno/
X-Received: by 2002:a05:6820:1f12:b0:696:72e9:f92e with SMTP id
 006d021491bc7-69dfa6b3709mr148717eaf.10.1779953748060; Thu, 28 May 2026
 00:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-16-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-16-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 28 May 2026 11:05:17 +0330
X-Gm-Features: AVHnY4IhmJJCXbj-tzl_ytWMhmyKPHjpmYamO2huuqsWLPnQ9-WnNbsuHTjiYbE
Message-ID: <CAMxPZkjhxJQ3ST6HrcwudkMzqwtvtVizng-PkiZd=xU4rrSxeA@mail.gmail.com>
Subject: Re: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric format enumeration
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
> Just make sure the provided mbus code is supported and carry on with the
> existing implementation since the pixelformat is independent from the
> mbus code.
>
> The params video node only supports a single format and does not care
> about the mbus format, but we can still report MC-centric support.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c    | 9 ++++++++-
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 24e731bcabe9..372b9331bd6d 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -436,8 +436,14 @@ static int sun6i_isp_capture_querycap(struct file *f=
ile, void *priv,
>  static int sun6i_isp_capture_enum_fmt(struct file *file, void *priv,
>                                       struct v4l2_fmtdesc *fmtdesc)
>  {
> +       u32 mbus_code =3D fmtdesc->mbus_code;
>         u32 index =3D fmtdesc->index;
>
> +       if (mbus_code && !sun6i_isp_proc_format_find(mbus_code))
> +               return -EINVAL;
> +
> +       /* Capture format is independent from proc format. */
> +
>         if (index >=3D ARRAY_SIZE(sun6i_isp_capture_formats))
>                 return -EINVAL;
>
> @@ -697,7 +703,8 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *=
isp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_CAPTURE_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING;
> +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_RX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_capture_fops;
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 0cc48e2bc8c6..2622e5a07817 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *i=
sp_dev)
>
>         strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING;
> +       video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAM=
ING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_TX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_isp_params_fops;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified MC-centric format enumeration on the ISP capture node with
multiple mbus codes supported by sun6i-isp-proc.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
