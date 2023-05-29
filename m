Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A579F0
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 18:14:28 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-62621035d15so11195456d6.2
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685384067; x=1687976067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJui6NkBOCC86UFu9kGeCzhYQdMBs+iB8KQkDUL5y78=;
        b=U9NsV7MwF6WP5KJASoqnhIghC5CjFAyX8FZmaUlz+mVkOT/tGTzxjOhU6P6QpFnwcQ
         fVVQhLBJcyv6qz+cMKoxRs4dacIxk3sYnb3Uk8oEa/XHhmqb8xgXI94jnp0aiS3TDEvf
         6UZbac4n0BolABMf0pg+t+ilSIdIu2nuu1J6KDR4Xu1jHaBI6wq1QWkzXVL3KGFxWXRw
         nDpdVfGX5pISQ+uNOmCeccd0oOQ9IPl2y05+JWWRALLHF0W6RFOBtKJA/hhdlw3MfnGu
         QATzNmKIKr5IDMHPhZ//C6PtCGYxxTN443ep6gDjV8SL7J1t+OJ2AAvtbbDbHYeaXyix
         t+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685384067; x=1687976067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJui6NkBOCC86UFu9kGeCzhYQdMBs+iB8KQkDUL5y78=;
        b=a0+n1ub7fxyrtVC0A7FdJqS6WZrVOKKhU4uhpI7iacF3QkvD7vjvl3HEpnT0g5bubv
         mn6CjoFqgvKB7AN3HXW9wuQS3mEWaLpkUky3YhjelZPdM37Hm/P0FyeXgnFcy0TpAaoP
         QFo2hTGU3gDnCyPE7NCs1GL4jn8LaBPHcIaSHdaz9aRliga2DBhd6/SPvfbdBwF0ZLm6
         o7cJ6o+Zhbxr1ppXDKeIp050cR1gHB0iZZywQ0H/4aZkkST/OOoGqdz9pDojPugc67+V
         +WMmKtTAqo5QMBPKdFWAeLFCZtgFRDZW5/KvQzTZVwYzLB1Omz+9YctJlRr5ZfWwgUtV
         aKGQ==
X-Gm-Message-State: AC+VfDyGh0OFcBPWyYpLQSZIbr/GPhbBzCdtuxwiC7EdilD/41aoIQvW
	uXJ47vbwKYpoER6Yl1l6pmQwxgN74vLb/8ZNnIc=
X-Google-Smtp-Source: ACHHUZ64IaFKvpOsU6Dnb7kaTq0j3WuLOJSCKIZVqEQrtQOf9JTOu7LgUd7MxGhYJYQhCnbO7LGQaWPNNs0RT9hPx0U=
X-Received: by 2002:a05:6214:e4b:b0:621:680d:55bf with SMTP id
 o11-20020a0562140e4b00b00621680d55bfmr11197510qvc.22.1685384067085; Mon, 29
 May 2023 11:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-6-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-6-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 May 2023 21:13:50 +0300
Message-ID: <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
Subject: Re: [PATCH 05/21] media: atomisp: ov2680: Add init_cfg pad-op
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Having an init_cfg to initialize the passed in subdev-state is
> important to make which =3D=3D V4L2_SUBDEV_FORMAT_TRY ops work when
> userspace is talking to a /dev/v4l2-subdev# node.
>
> Copy the ov2680_init_cfg() from the standard drivers/media/i2c/ov2680.c
> driver.
>
> This is esp. relevant once support for cropping is added where
> the v4l2_subdev_state.pads[pad].try_crop rectangle needs to be set
> correctly for set_fmt which =3D=3D V4L2_SUBDEV_FORMAT_TRY calls to work.

...

> +static int ov2680_init_cfg(struct v4l2_subdev *sd,
> +                          struct v4l2_subdev_state *sd_state)
> +{
> +       struct v4l2_subdev_format fmt =3D {
> +               .which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY
> +               : V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .format =3D {
> +                       .width =3D 800,
> +                       .height =3D 600,

> +               }

I would keep a trailing comma here.

> +       };
> +
> +       return ov2680_set_fmt(sd, sd_state, &fmt);
> +}

--=20
With Best Regards,
Andy Shevchenko
