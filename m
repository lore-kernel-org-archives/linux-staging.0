Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4EFA56
	for <linux-staging@lists.linux.dev>; Wed, 23 Feb 2022 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645614927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UzJJ6mljner/MBUQSdtls4XtlY3JNobyNXXaK/j+JUo=;
	b=boiQsZN09Ska3HbSOXB3V2m0iZ3HhNsjol0teokSKzA+o6fzf0poDs+MLKpvelWH6Bk0TU
	CcCEC0r16b94DS64j0RRthEU/XqOJrijG49yiyQI3XX7zDWWUwzpu9TYa1X/qYvkSK9Min
	ioRHYPGgMG4I01oJ0sUotfYkwFwvgj0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-ggxod5U1M1yl1hhm7m604g-1; Wed, 23 Feb 2022 06:15:26 -0500
X-MC-Unique: ggxod5U1M1yl1hhm7m604g-1
Received: by mail-lj1-f200.google.com with SMTP id a5-20020a2eb545000000b002462b5eddb3so5943933ljn.14
        for <linux-staging@lists.linux.dev>; Wed, 23 Feb 2022 03:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzJJ6mljner/MBUQSdtls4XtlY3JNobyNXXaK/j+JUo=;
        b=txKg/eaMmangWU0LT/BQ537L+AUDt7o2cXGzR3RzGWayNjFH4ysyUxZrmaLXlnLyH1
         IxwCnce6oPbPHPZa3ET3VT/qSaIh/1R2uhWH335gGDmNoqCEvFl8IYUqv/1Di/GXNlhe
         pjarl/g8oGTYzTjSjAOzVl3QGsyDczGZ4X0IsDzNzCQlQn1nau6/zEw+rLi6oF/NqmfO
         vU45BWvRUql7fGn4o7zmp8nuqbAvH4NmU9ci6P51F0XOG+90nP+qUv13PuTBJmiClIJ/
         CB3ZLN4g9z87dzbKbATy1k8L8D5H4iVL4j8rq9/mAqThSEh0SOmCj56JIcIIEI0a08OL
         P5Kw==
X-Gm-Message-State: AOAM530FwtbeXJ8KomwfIoco2VorLRQy6h/ozYAUViac4SGu8f34zAHb
	0sD1PpeIZHj1rA08BhKQGiRSzSNxauR5R1KICxlxUo04KHpfwtD58PZa5KEVxJq5V9SzdvHA5gl
	e7Pt7Mcfg3Vaf55YkmBNXHgcdkfBDJgEqdvlOwb7k4g==
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id y2-20020a05651c154200b00246036c8d1fmr21400787ljp.311.1645614924994;
        Wed, 23 Feb 2022 03:15:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKCRtUYUVZDftHSAkNClaClo65AZ1dkZqXQjImzDVuPaD2hhoEuZQ1M6JV/CnN9ddStdHdmJToNTyLX7HTIEk=
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id
 y2-20020a05651c154200b00246036c8d1fmr21400761ljp.311.1645614924659; Wed, 23
 Feb 2022 03:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220223090648.41989-1-hpa@redhat.com> <20220223090648.41989-2-hpa@redhat.com>
In-Reply-To: <20220223090648.41989-2-hpa@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 23 Feb 2022 19:15:13 +0800
Message-ID: <CAEth8oHRidJ24Wp81vLQe_VO=ddw_yFMvhuNE1XS+ekwa4ZUJA@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Hans De Goede <hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 23, 2022 at 5:07 PM Kate Hsuan <hpa@redhat.com> wrote:
>
> For the AF configuration, if the rightmost stripe is used, the AF scene
> will be at the incorrect location of the sensor.
>
> The AF coordinate may be set to the right part of the sensor. This
> configuration would lead to x_start being greater than the
> down_scaled_stripes offset and the leftmost stripe would be disabled
> and only the rightmost stripe is used to control the AF coordinate. If
> the x_start doesn't perform any adjustments, the AF coordinate will be
> at the wrong place of the sensor since down_scaled_stripes offset
> would be the new zero of the coordinate system.
>
> In this patch, if only the rightmost stripe is used, x_start should
> minus down_scaled_stripes offset to maintain its correctness of AF
> scene coordinate.
>
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index d9e3c3785075..efe4de8ef205 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -2556,6 +2556,14 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>                 /* Enable only for rightmost stripe, disable left */
>                 acc->af.stripes[0].grid_cfg.y_start &=
>                         ~IPU3_UAPI_GRID_Y_START_EN;
> +               acc->af.stripes[0].grid_cfg.x_start -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
> +               acc->af.stripes[0].grid_cfg.x_end -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
> +               acc->af.stripes[1].grid_cfg.x_start -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
> +               acc->af.stripes[1].grid_cfg.x_end -=
> +                       acc->stripe.down_scaled_stripes[1].offset;
>         } else if (acc->af.config.grid_cfg.x_end <=
>                    acc->stripe.bds_out_stripes[0].width - min_overlap) {
>                 /* Enable only for leftmost stripe, disable right */
> @@ -2563,7 +2571,6 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
>                         ~IPU3_UAPI_GRID_Y_START_EN;
>         } else {
>                 /* Enable for both stripes */
> -
>                 acc->af.stripes[0].grid_cfg.width =
>                         (acc->stripe.bds_out_stripes[0].width - min_overlap -
>                          acc->af.config.grid_cfg.x_start + 1) >>
> --
> 2.35.1
>

Sorry, I forget to loop Jean-Michel in. Resend the mail again.

Thank you.

-- 
BR,
Kate

