Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7571E5B88
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 04:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779510903; cv=pass; b=YKyY8kg/EgpsEtlo9LKmTO6Gd4heupBxaMG3LZ03Oc08QTcFfZzNyecrFeiVMSCes/2s9oIvhkM3TS8sssm1e65gr+fjvqw9aE2t159i3omktmmStrCjnwpYA1/TuVNrl/uwhgu0sdCtyPQm6KjWHnfsw3v3c48GyHve2HDF64U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779510903; c=relaxed/simple;
	bh=jpTwqZr/Q5gQVOlqJ0S2yDPGDJKQkPbLyOemLlhRRsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRZjxiyLLVLq68i5N/8VmMbCcqnUFXuo5d2D+si6UQHK6UcN71N6O6/VGQNhFeBlYg69b8/GBVoOl8fzK/teTMTwp69l5N4grLY1W52rbqTkt8ar0XwghcYlLsztSRSpet8uOvUdzFCkeaY5LjlEBE8Hd1YefRWjcW9ugBeXxCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfbC/4ps; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfbC/4ps"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-69d60694c9bso2100979eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 21:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779510901; cv=none;
        d=google.com; s=arc-20240605;
        b=QoCmhihELr4zEY5H7oJYwsBHvvZPncx2SNlkCdx1X2+qBrkNeGmw2d6qbNfymWRnwy
         1GogvIPhh+H22f/VZBy2xU6Y0fsSF+J4b56vZNaUBStyH9ZZBzcwcamowQsW52jVRuCW
         7Y8on978wqaviZHkviE/i78q+ememGka9GEyDMeaFeFRu4xVul5XXbKh5tYP4FvwpX0b
         sDaWzuUtkCDSvmeL7QJi2C68LysbFY5IebrLqLFnTt4BEznYzHvi1hoH9DZcsLyEW2mt
         7pgmYnnnCLtjVF7UMs+tuUatP32RPTYdAS2baR+VX1kboxeUNCwincivUQdZ2Yw5dsRu
         N9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        fh=AH7qPbPEkDRnYw11nlIyqKL1XXL8EgrAOZHqTX4hV/Y=;
        b=Oh9HuHk3SmsuH1FuSU8Qu33z8fd0SXWV+tVfVC+Afvq0JOfeIkuchBNwcRsWFaqA+q
         d9CNJL3N4LLKhL6JKEFKMTdtXU3C8/L3Tkdmth0XdnJATb/KsMYPGhRzkaNAdfnaBYlZ
         GYlCqoodhm2PQC6ioTaCcACX7IQDupjiPv2qZ89jcmdPhYH3ggzMMXbzKPUOAqQPe8rP
         jTiPmbBzQrJwlimiJakf3LmvbY6tBlh/G1FJ60b7JeJtur74OvyzLZhIli6eV6tyYkaB
         tU7AzbC3GtQQrL9xJDAnGsbsGYtZYLQVVYv01N0LhqhcUqb5bopPg+5ss5GSML1jQjXY
         Oq7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779510901; x=1780115701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=GfbC/4psRuAp+TRnYeBx9u2OohtgaQgxHLLdVBGNiIHZD1X/ZMZIBghwg+F4ozUCQQ
         F7E6v7syGqFmsbSIK89r+2cd3QIQCDgFTMgkvE1KCW7OuEPxLZgOoq/Cv3YT51bsNmpB
         xhE+TxNkuYlEEnIBvwP3CxY1ziVe48Jtr9MSGEa7CCzOajCN0iw92ZbS65r2ZvZKq8qo
         Uh75amfY3jTeBnVOW3qf1gsfmYAIG3JhnW+0+CZYc3DH6TwpX49MvF3DAjE5EcjD5qpz
         fI/1MXv88oQIa8M+82EqlxCjuN2GowqA69jMTszvjOyy5qkOWEMN/s1YootTT8AZkFT7
         C9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779510901; x=1780115701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=beI2SpeqbWUYJJkhtYfs4sQlFHyYfmbXaGj3j9S5te8jFKlFH9EHvwEpJ8Q98l3drN
         FCuZ5t9pLx9yeW7zDRqjGB41ALtgZYoHSHiBtYldAH5AKTu3HVAjvyxcCkQM2Ee9gn70
         +o8R9//mo4QUN7utKQaws2Gpqt30wgXOrSIXZzv8JtwquYc/scRTyT3iMwLMeQlyaiKq
         yg5SLoSFS9avFNv/E2Zg2oefQPFgOHaALnFFKiZ1n8HkEyclX/OlhfD6jqhb4/sYF0TT
         uWJmlNRMGfRU14qCVE1nWOAi/aHIxk1Ko2Sq5TId9+akBAcWMx0kf7b9bDgqogtUPO+G
         gMkQ==
X-Forwarded-Encrypted: i=1; AFNElJ83GvuSaMe6gOd8CCt090eJ8tVC0VQWUGO8j5iXynxnj2oGmiWwn++0AZ+PA712R0tc58l2MiSush2CmEra@lists.linux.dev
X-Gm-Message-State: AOJu0YyrEB63NYazLNn0O+QW7pTAfe9ms/myWkdxbBpCI19XBi/9Vy2k
	EACSsw+p9oGN/hxW+CJLwIGwWuS2MS0UHzRPObrW0C9I7sT1NmoJbWlM2LVpU4Zg2o0thoUYDZ/
	Bt9pN8AbsLvcy2mMigmsDiZNjdcmIhnw=
X-Gm-Gg: Acq92OHRXB7mxMqNb1qZa8b8z7p6ZdaFx9gs6wFYJ7HYagiiHYRpRU+gk945TfNirZb
	SruDRfHboGtfO9VCNHawnK0udmK6dMhog8k6OcFsCiX+AjGCroCcls0gYKbOC8fGoN2M5lmYj99
	UqBN5pej4T71X6+GVMHPJMPaBbmYrGjE+kDLt9J5/FLgXPOkEdA2+3ngCOMn85KZmmOs76chkkB
	AmWuHJ6+kmJxPCeSFcJRVJJJ3PwybJxz5vdyaCRQXwq7aBzHx+AaoZwRHjvTOAt+w8k2MK9KHZS
	T2xJ603T+IwPap7f1hm85LgvcC0PqJkTRJeKLut9cgNxv0Mh8EocVfI+hmB8IqdJ6g==
X-Received: by 2002:a05:6820:1527:b0:67e:16b4:aa13 with SMTP id
 006d021491bc7-69d7ed3ddb2mr3655129eaf.58.1779510900956; Fri, 22 May 2026
 21:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-17-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-17-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 08:04:50 +0330
X-Gm-Features: AVHnY4JvnA7ojDWW97GlknLev-z2MRzqG6cGTuP_DqdsaaWX-ot3wdOD3pLiTkg
Message-ID: <CAMxPZkgODpNgaFAnaQQNum79VQyt9nV7LpEk6WZqpcqnKgUiGw@mail.gmail.com>
Subject: Re: [PATCH 16/16] media: sun6i-isp: Add support for frame size enumeration
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
> This implements the enum_framesizes operation, which reports support for
> even sizes.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 372b9331bd6d..e638ec32c7cd 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -452,6 +452,26 @@ static int sun6i_isp_capture_enum_fmt(struct file *f=
ile, void *priv,
>         return 0;
>  }
>
> +static int sun6i_isp_capture_enum_framesizes(struct file *file, void *fh=
,
> +                                            struct v4l2_frmsizeenum *frm=
size)
> +{
> +       if (frmsize->index)
> +               return -EINVAL;
> +
> +       if (!sun6i_isp_capture_format_find(frmsize->pixel_format))
> +               return -EINVAL;
> +
> +       frmsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +       frmsize->stepwise.min_width =3D SUN6I_ISP_CAPTURE_WIDTH_MIN;
> +       frmsize->stepwise.max_width =3D SUN6I_ISP_CAPTURE_WIDTH_MAX;
> +       frmsize->stepwise.min_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MIN;
> +       frmsize->stepwise.max_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MAX;
> +       frmsize->stepwise.step_width =3D 2;
> +       frmsize->stepwise.step_height =3D 2;
> +
> +       return 0;
> +}
> +
>  static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
>                                    struct v4l2_format *format)
>  {
> @@ -522,6 +542,8 @@ static const struct v4l2_ioctl_ops sun6i_isp_capture_=
ioctl_ops =3D {
>         .vidioc_s_fmt_vid_cap           =3D sun6i_isp_capture_s_fmt,
>         .vidioc_try_fmt_vid_cap         =3D sun6i_isp_capture_try_fmt,
>
> +       .vidioc_enum_framesizes         =3D sun6i_isp_capture_enum_frames=
izes,
> +
>         .vidioc_enum_input              =3D sun6i_isp_capture_enum_input,
>         .vidioc_g_input                 =3D sun6i_isp_capture_g_input,
>         .vidioc_s_input                 =3D sun6i_isp_capture_s_input,
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the ov5647 camera setup.

The enum_framesizes implementation behaves as expected and reports the
supported even frame sizes correctly.

Tested-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
