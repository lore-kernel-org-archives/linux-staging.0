Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7E17FE6
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 11:52:08 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6261a1a7454so25158466d6.3
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685447528; x=1688039528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDQ5OD/DoJde7mR1ZbWpY8CBeCYf0nyLyKUyxLEq9Is=;
        b=g3TX7IR9h+1pIoNmS6wRkSeKGkxfLLpDVN/OKj7wQM1l8W4C/JLWANKamjT92NQKwg
         lFH9fEdJO6DPY4ah5OMwJaTcxu6usdKaJ44U3Z6dIXT8ELT8xIUKDZoCRfizVI/THrl3
         VZj7b5gcNrlS5iyjKKtqBDkF6Ntln+linZswktBGGmIKhr8SQuQM1bMLwViQcnyDX5ch
         r2cODawlw42BMJTa9QtgZ3Uo10ZHwjmru4GpeU9S6C5Aey88+l/+6ySCvNaKFcmTvNxk
         D04D56UXJB1TSae0asWxZvJUCz6fFVJd8cxTzg+i4UEg7ckXjpyt+B8kuUUKAmeQb7k9
         56Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685447528; x=1688039528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDQ5OD/DoJde7mR1ZbWpY8CBeCYf0nyLyKUyxLEq9Is=;
        b=U06p5+P2evlo7IX6OnqfnVSd1T9MR1fGDGrrUz57p16e8mOiYp/Mc/KJKuVgjtScOv
         VQ597Ce/gjdNT/Xq+UWyfBXCwmENKmFcDPZAxk71ad/truZReTp7Zka494RhNxhVGMS2
         kE6fbbchWx1Uz1YJjcGVvBCIK0+NgMTiGjreWblE+5yEe6J1eKH+/1LuPHhw18R+AF71
         gH2m3h2cg6NzyuZ7E1zPhiAWdUEP8RY6UEGRy5ar/GP9cgfdNjZry3cHbHLqvp43oPZg
         9f/U/eRS9NYqNM3Bwk1wvgci8CVd69IwNOSELXsSRoLCLdZXbVDj65tNEe4OdSJxFPMG
         l0aA==
X-Gm-Message-State: AC+VfDw7RXw1yPytLv+3kju9FRBCJuDGYvr22relmG87WGrzPlfrECNw
	nfWS376LSWUF9YCfZ0VydnQykUz/7SJYJrbIl6I=
X-Google-Smtp-Source: ACHHUZ6oU4fZIf4ubg47vfhzP8spJ6yDVUnxPtBkn9EYJBtIEjOH+EoJvgJ7jRYsAgZnKrpPoJXnspMebJDBadClMYo=
X-Received: by 2002:a05:6214:1c4a:b0:5e0:3825:9ad9 with SMTP id
 if10-20020a0562141c4a00b005e038259ad9mr2078324qvb.2.1685447527721; Tue, 30
 May 2023 04:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-6-hdegoede@redhat.com>
 <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
In-Reply-To: <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2023 14:51:31 +0300
Message-ID: <CAHp75VecdMCp=pqfxFfZ2h81ugGcDjJgQeV8X7fnJ39Bfr2hgg@mail.gmail.com>
Subject: Re: [PATCH 05/21] media: atomisp: ov2680: Add init_cfg pad-op
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 9:13=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:

...

> > +static int ov2680_init_cfg(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *sd_state)
> > +{
> > +       struct v4l2_subdev_format fmt =3D {
> > +               .which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY
> > +               : V4L2_SUBDEV_FORMAT_ACTIVE,
> > +               .format =3D {
> > +                       .width =3D 800,
> > +                       .height =3D 600,
>
> > +               }
>
> I would keep a trailing comma here.
>
> > +       };
> > +
> > +       return ov2680_set_fmt(sd, sd_state, &fmt);
> > +}

This is not addressed in your branch.


--
With Best Regards,
Andy Shevchenko
