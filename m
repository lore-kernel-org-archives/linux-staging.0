Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F822094
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708181845; cv=none; b=RBpR98khklmQmSnKEpjXtloTTzdit6dNUiRKxY4GnZzELiupuyyk63ID2TW2VYZ5BjPbJvF4yJpFHK76AkOZFKlrMnjUZaQO2h/sNxFqH5XjdYwrl256lAKsLRuFGXDH6gMtnX+W57k6g2bMiXdJoYFxjHgK7q0JczBybeCTyIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708181845; c=relaxed/simple;
	bh=sFEY2qx23OzeKRh0hg75fwr8fMicqyM1I3ZJ2yvJE78=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PghINN+puosRGSBi5zio3+hYbtLxcF4oYi7CdOUZxBDX5khb4f20OXjy6jWm0Zk5asA5QMMy1k/2lyBIoLPskDoZDGphMCDV/rXmsF9vScHSxlAGwkr8M4temaflg3EP0xVnzqxCUtBIdGb3jcjGR7aLWoICe8O49+UBToJpb+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YdUg89uJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YdUg89uJ"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC8606DE;
	Sat, 17 Feb 2024 15:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708181829;
	bh=sFEY2qx23OzeKRh0hg75fwr8fMicqyM1I3ZJ2yvJE78=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YdUg89uJwEVWklTcV+BVTQcH3UBIb74PqGqdIAaVUAPy1oOV2FBZNtpUBd8n14f8b
	 nsJCJluLVdeDW2sQIwKIg87NB6p5NLX9qYe00JPN5HvbwwU4036Ou25j57w1LLil3Y
	 wERtExUikP7/wEQjmFoSxz1DV2qYpR7JciKiOT+E=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240217112438.15240-2-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-2-hdegoede@redhat.com>
Subject: Re: [PATCH 1/9] media: atomisp: Remove isp_subdev_propagate()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 14:57:12 +0000
Message-ID: <170818183208.1206667.5879506548240105674@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-17 11:24:30)
> isp_subdev_propagate() is a wrapper around atomisp_subdev_set_selection()
> which gets only used in a single place.
>=20
> Scall atomisp_subdev_set_selection() directly in that single place instea=
d.

s/Scall/Call/

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/pci/atomisp_subdev.c        | 38 ++++---------------
>  1 file changed, 7 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers=
/staging/media/atomisp/pci/atomisp_subdev.c
> index a87fc74159e2..8293bda0c681 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -287,35 +287,6 @@ static void isp_get_fmt_rect(struct v4l2_subdev *sd,
>         }
>  }
> =20
> -static void isp_subdev_propagate(struct v4l2_subdev *sd,
> -                                struct v4l2_subdev_state *sd_state,
> -                                u32 which, uint32_t pad, uint32_t target,
> -                                uint32_t flags)
> -{
> -       struct v4l2_mbus_framefmt *ffmt[ATOMISP_SUBDEV_PADS_NUM];
> -       struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
> -                      *comp[ATOMISP_SUBDEV_PADS_NUM];
> -
> -       if (flags & V4L2_SEL_FLAG_KEEP_CONFIG)
> -               return;
> -
> -       isp_get_fmt_rect(sd, sd_state, which, ffmt, crop, comp);
> -
> -       switch (pad) {
> -       case ATOMISP_SUBDEV_PAD_SINK: {
> -               struct v4l2_rect r =3D {0};
> -
> -               /* Only crop target supported on sink pad. */
> -               r.width =3D ffmt[pad]->width;
> -               r.height =3D ffmt[pad]->height;
> -
> -               atomisp_subdev_set_selection(sd, sd_state, which, pad,
> -                                            target, flags, &r);
> -               break;
> -       }
> -       }
> -}
> -
>  static int isp_subdev_get_selection(struct v4l2_subdev *sd,
>                                     struct v4l2_subdev_state *sd_state,
>                                     struct v4l2_subdev_selection *sel)
> @@ -541,6 +512,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
>         case ATOMISP_SUBDEV_PAD_SINK: {
>                 const struct atomisp_in_fmt_conv *fc =3D
>                     atomisp_find_in_fmt_conv(ffmt->code);
> +               struct v4l2_rect r =3D {};
> =20
>                 if (!fc) {
>                         fc =3D atomisp_in_fmt_conv;
> @@ -551,8 +523,12 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
> =20
>                 *__ffmt =3D *ffmt;
> =20
> -               isp_subdev_propagate(sd, sd_state, which, pad,
> -                                    V4L2_SEL_TGT_CROP, 0);
> +               /* Propagate new ffmt to selection */
> +               r.width =3D ffmt->width;
> +               r.height =3D ffmt->height;
> +               /* Only crop target supported on sink pad. */
> +               atomisp_subdev_set_selection(sd, sd_state, which, pad,
> +                                            V4L2_SEL_TGT_CROP, 0, &r);
> =20
>                 if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
>                         atomisp_css_input_set_resolution(isp_sd,
> --=20
> 2.43.0
>
