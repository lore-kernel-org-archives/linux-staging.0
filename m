Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F657283FDD
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 03:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779679570; cv=pass; b=SGkHXt91v/soFt2Fj0ID4+bM0loJ8ceKWp28zj4eOhPmcSfnZ6vHOcWOt5nw6+pE+E4Ph2/FrI37qFfIEbl6d3hvpB3rKLn81WIqo1WzdxfswaGgh/d9Sy/ePX9hqADcTyS7s7BhMerhGPifCIPKd/yuyBHzM8bc/GlG6nv0XC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779679570; c=relaxed/simple;
	bh=Tcjwar0ujMRUYwQNWOI9owhqHhcwp71+Xytox09KV28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bR8Ospak95/GuD9LM/TOtDxAFqAFM6G6RWIHSo5BuIKx3PhcNzHFSZPJ690mLWZiWMYVyhmDOERMW8BcXxB5PzTmxRp7kFKpfsR3g3KiSZtVUr0cv100S82FkXBOnb48k/GcxFuUrUKMKOQMk0ykp3IqprzbZKhrYCDfxg5rOYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQU6b9mP; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQU6b9mP"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e61b59e03eso1249534a34.2
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 20:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779679568; cv=none;
        d=google.com; s=arc-20240605;
        b=IwzE9A76v8Z3lg8a8wXap/IIH2xOe8jfTj83PSuW3O4GDSvFmDOsx7F4nE1UvGbGq6
         wG9sx1M71itefmgzdcC6bVDV9cNjI73i61gvAWsJRpFdI6FdbF1rBrCJ4WEeaJ/livsG
         8l8Sk27kCqNzKjmQxhsyKZtIIBrPeU02l4sb3v18HqI+qUGmsiawuLDBfMieGnD3+NRV
         rYWzTjXFFBHVefuFJkvOPMSfxChARAAn8/Yx6Rfs2m/7cS0Jwj+y1ikNm8xchgZukD4C
         olTcr5uvWu7bg7WO0U9/eLNd09z/nM/4VhtGCNGSHjHyqsW9FyRDpIFBCfIWxgurztQ3
         wYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        fh=yC+C6zkKJOE8MG5SFNBhUZa2C5fItUilmV9cQZaX6S8=;
        b=ZpDoRkOd3Zt0yZIyOpGYclYggwUrBwFknyiLHVK9xiuUqdFgoZOaCmX8Gc4k6N3Oqs
         knCWRfK/VuGcP2Pju7Q07SZSQTDZr8My54xj86EUOeLXcA4yXjvHKQgdTuOJMYszEPaC
         z5/jU+fifYstN1goTRLWpY33J0KHkjDQ42Dwes1C47b0sMe+YyksDJap8tAE11PGEuO5
         aCQ4wxE9BJVC1/6XwJB3/L7Cv24sriAS8TsfcNhzx9/589jwfBTsGYCkioS5K6Ir9ful
         OBS2i0aACdTGJNQj/Jj7uNUQvLHnsL2YJp/CTS4FxeOIPYyYbiPSlIYI0syizFlSlSxh
         b/0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779679568; x=1780284368; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=qQU6b9mPKqEQIgWFfoBrgFFcHhn02Fv/PwpFH+hN2gaKcSUMTTDUTmTjfgj2v4aTgE
         KgOa+Z1FGqM07ujUSHQJon6hTDI14kQdUtF15vfdqRA6AJ3H7rzIPIer0rRwLp2XbD6i
         v4HbgwAY6txOWp8kZxpbl1lwQuArfktSbET+78Rn0qbB9NeEbwzYtW9qGLj1jDhV3r5J
         /8NmuymI+MSFXqCHE8Shx7VVJUDCMcKsLW/ziE8kXF7eNP42TJys1yFPE/+SeD11MaCn
         6JSU/C0iB/tjwJ1+k1GtcAh/P9zg1X+mNjOgvWD1yOqwzKV3oqhYG8XzQ2Us7VB1kNvl
         BD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779679568; x=1780284368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=SxqEgzQQEV0MpZWQ80QymfEvNwNln1kYGAWkvYMBlVdckla+iLXVgApJRMYWW5anAp
         GxxguG8W+A7u8v+xp3Spirg5x99n9HnWfQwxKcgGHlMckQNbM3AdRGa8WnPAn7giqYe0
         EwZP0yAmeWFKLB5B9+CsAt3Dp6sgKSbblr8pKrSOVKzF4Q5jPX4ZnOq+NUV+sxwVnAr3
         KQhnNg2bhkOjp3wWQO66t22bpZogyZ1SUFx06jAQFBiGRhocRmgplNt9XIGsepqtzSwT
         Ognnlt8WFoeMBQHgD84suLj3oD5c1G5tK0hS86pawy+QPGn/1t2P5sWb+jpYE2Jigwq+
         hjIg==
X-Forwarded-Encrypted: i=1; AFNElJ9zcKxdW8QfYBEFEwy9nWeMXXN/ohALEoGuXTRLOh8w7MWMqVn3uUzfIOlLky2lth8h5ek8U+q1NxgtsYDg@lists.linux.dev
X-Gm-Message-State: AOJu0YwWiEPYP+DU8fRTMqyZfumSwpO4GN35S7ZwtrY/f8+QvoAfBcPP
	ZWa4+ds3FDhOoxnOD0fdF2wFN4xCHY2EI7xKlagMTOwiN9W1FFkVwfobnu88UXGmgepn0RujBsG
	zPruDZyKIWhyCqfiv//oOoD87AfcxtiM=
X-Gm-Gg: Acq92OGPMM6/Ous/XkuB2f32O7srivzmILnLCNvCm5Kl++G6EFNycLhVRynp9vnIRxC
	pyoQOTU7WTH64oIImQu6QU/7vfIopt+kup8mL2NnCRPPqEOvHbCHKlSe+qF/+9BfEeTAWEGa5eB
	Pka7c5C1WYIFFlCYlOtRoJA9d0RNrj+0LlmTUQfQHWNmnS1lfGHxmJ9K7r7TC7izZzywR4nnDfV
	h6MyYfdy8sqGdRNUSQWxDv3CkKMMrQ5PQH3hIhnBI8nCsQMszeKOB/t/N5L1YhN5zl6H/i5doXS
	5jewfyDj/JtHnRiqqhU0gUnV5RGE7w/ioQo1wUlDQnwWrqvqkIo9cdiXgtifyxZwfZBV
X-Received: by 2002:a05:6820:4b09:b0:67e:2ff7:2a6e with SMTP id
 006d021491bc7-69d7eb501dbmr7243815eaf.18.1779679568125; Sun, 24 May 2026
 20:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-14-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-14-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 25 May 2026 06:55:48 +0330
X-Gm-Features: AVHnY4KUuBcGh4fPuvaF9wKJBQKBE4TDK2MAAseg_T5QDDf0jB-H1zPi4i_Lwlk
Message-ID: <CAMxPZkjfWckb89HeZ1aZU6szkvfPm6J20HH2+O2C-ZoftR1YsQ@mail.gmail.com>
Subject: Re: [PATCH 13/16] media: sun6i-isp: Add dummy params link_validate implementation
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

On Mon, May 18, 2026 at 2:01=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> There isn't anything configurable about the params video device link,
> but the v4l2 core complains that no op is provided so implement a dummy
> one to make it happy.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 77c2d06c0436..b7ef33fa2b13 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -450,6 +450,18 @@ static const struct v4l2_file_operations sun6i_isp_p=
arams_fops =3D {
>         .poll           =3D vb2_fop_poll,
>  };
>
> +/* Media Entity */
> +
> +static int sun6i_isp_params_link_validate(struct media_link *link)
> +{
> +       /* Nothing to validate here. */
> +       return 0;
> +}
> +
> +static const struct media_entity_operations sun6i_isp_params_entity_ops =
=3D {
> +       .link_validate  =3D sun6i_isp_params_link_validate,
> +};
> +
>  /* Params */
>
>  int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
> @@ -470,6 +482,10 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *=
isp_dev)
>         INIT_LIST_HEAD(&state->queue);
>         spin_lock_init(&state->lock);
>
> +       /* Media Entity */
> +
> +       video_dev->entity.ops =3D &sun6i_isp_params_entity_ops;
> +
>         /* Media Pads */
>
>         pad->flags =3D MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified that streaming through the ISP pipeline works correctly
after this change and that the previous .link_validate() warning for
'sun6i-isp-params' device is no longer triggered.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
