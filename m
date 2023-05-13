Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EE2263B
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 13:29:50 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7577ef2fa31so2215367785a.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 06:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683984589; x=1686576589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmjfa5yVgz89XK2CMXoqtiI9C/6FTHnHaGEc1CV8zIY=;
        b=ePmeH3PY6l9BJtG/C3Rt3ze+8sLB1NnBglebTapvtn1SOIB53m1kQAbu89TeoQSEpk
         we3Ydhhv1eFKJ+4s8YvcQED8Sw6K2hHAdgyoLcvTgSGXTqhGmWVm1cc1qCnEJVutAryK
         02FE0mFPV+WFgRREzTq32g+8ci6Nw5+Q9uoZGSVbFeFGJKtjxkekUL4Tds4aXKq+R291
         zJq4G2PIMY0DomXSInEX2chVCHfnrXK9cr088B0yzIsAc2o7c9DwZeOUN//zNd/aiIPa
         VyYzejP7NGkP6W69e53xwyDoZR2W/c7wM2nWSTaZmIANjABi+C1kFwm5RJew0oK4EeNg
         /nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683984589; x=1686576589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mmjfa5yVgz89XK2CMXoqtiI9C/6FTHnHaGEc1CV8zIY=;
        b=EpfoxJkA5XFskAuChlm+yLi0Eo/hQP7X0jlKeOx9KTSKz6Yf0dOUTmVzNfrXPa2kWS
         YCH/F5LVXemjDHQaQhhnUzlpI9PgXN2LVym6ubhBncCo8KQq4vdl7WJMncN14E72k6VG
         +1R9dJGPN3DWh+ZD4US8iGusVU8jrm/lrN/S04qqf5e70H3tqEsx5Zc68hFhbcxQoVfa
         4P+RFf5mM8BnXKnb7XzG8X4zcob2+ntIsGzsKzjMqdxjsmupcOwpQ8tQcxzpIR4g6IL9
         OBSdomodHrDOfX9XSb6ne9POdKvO5mgVVqn9Z+05FKB+W1UFE9709RYkRQsBrBweKZ4X
         Bh/g==
X-Gm-Message-State: AC+VfDzP8Lr9DEX2po1Lz7CMxiqWklzyq09Sii6gFreI6QNpGGk/DMUi
	5pOP/un9cPrvZ87VPM158C4LpeMnEMIELbfnU/k=
X-Google-Smtp-Source: ACHHUZ407gP13ItmzQi75curzOMniseqHxeHblJZE3AW1Ptm2LcY0iYe0blnaUUHM79KO6r5SYWab0yGZ+TWtas4ZwU=
X-Received: by 2002:a05:6214:5297:b0:61b:58ec:24c8 with SMTP id
 kj23-20020a056214529700b0061b58ec24c8mr46320532qvb.10.1683984588864; Sat, 13
 May 2023 06:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-3-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 13 May 2023 16:29:12 +0300
Message-ID: <CAHp75VetX5LD-kXC0iVGc6ckguTN_s0k+Sww3MuuvyUEth3wZQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] media: atomisp: Remove Continuous capture and SDV run-modes
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Since we no longer support Continuous mode, setting the run_mode to
> ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE no longer make sense, so remove
> this.
>
> While at it also remove ATOMISP_RUN_MODE_SDV, which was never exposed

it, also

> to userspace in the first place.

...

>  #define V4L2_CID_RUN_MODE                      (V4L2_CID_CAMERA_LASTP1 +=
 20)
>  #define ATOMISP_RUN_MODE_VIDEO                 1
>  #define ATOMISP_RUN_MODE_STILL_CAPTURE         2
> -#define ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE    3
> -#define ATOMISP_RUN_MODE_PREVIEW               4
> -#define ATOMISP_RUN_MODE_SDV                   5
> +#define ATOMISP_RUN_MODE_PREVIEW               3

Wouldn't it be better to add here a _MODE_MIN and _MODE_MAX and...
(see at the end of this message)

...

> @@ -758,7 +758,6 @@ static const char *const ctrl_run_mode_menu[] =3D {
>         NULL,
>         "Video",
>         "Still capture",
> -       "Continuous capture",
>         "Preview",

Wouldn't be more robust to use indices like

  [_MODE_PREVIEW] =3D "Preview",

?

...

>         .type =3D V4L2_CTRL_TYPE_MENU,
>         .min =3D 1,
>         .def =3D 1,
> -       .max =3D 4,
> +       .max =3D 3,

...use it here? Or did I miss these min and max meanings?

>         .qmenu =3D ctrl_run_mode_menu,

--=20
With Best Regards,
Andy Shevchenko
