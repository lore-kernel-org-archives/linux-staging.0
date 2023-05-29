Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D2C28E7
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 20:58:29 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6261a25e9b6so8864276d6.0
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685393908; x=1687985908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wex1t4p8vc5FHp3UocS2+D8jLYoXryO1xiW8fbqf3SQ=;
        b=LUSe00oWaC756W4tMx+vWytCq53z1oDgkr+RGBoPhz0DzV2sBi5QflnZWM0WXQX2DT
         Q2i4QiZBNKm3X/lSycNAUG/BCuejWLJAOakAA3vrAXkZQ6Ta+OQA34P9/1Okc22zRqY5
         6Ey4/3zCMBvTobJCAOgoRSzJt3d0EmPr1JaOejirrHOw3AGURU8yZWi9A4lzxnEakoM0
         3XtRVkNtRzPCChGSTWD7V8NObUveGBQ34i2oUHaZNlmJ7FswSJajvlCzo7Di2EnCh9jI
         WBbcPQ7tBbKlZ2kPoWsq89nNXP4Q/ShdUJtvTPweg2itW4/jQc1I06Zfgf1DSg6+WQYn
         RO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685393908; x=1687985908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wex1t4p8vc5FHp3UocS2+D8jLYoXryO1xiW8fbqf3SQ=;
        b=RaIdQPRXO2aK4ybkt0nABq8Xe8ZPhfZ6Zzzhgm0iE7z2KTEkfD1eDGq/qRTvmh9Xnw
         IVTsbPENB6mMvo1z4fbilz4dW3PLoMyHa3lD8+zws8QUra4dR3bKrKbbgiLs5NDlh8VM
         xvfgCAf3uCoGpsmddurmK9doEPOHV1Hj+VyfkIL3XYJHHEggL4EucJYLIXY5+f5hIdKX
         TZnO9auaXPO8iYT1tqwOTlzBDrYf5fwI50x0C4TJZ+dt05r3ziu8XuF+9uqh0hSOsU9s
         DqgOkDgjcs9RVLIo81aBgffHMX77XD3krxMwUCghJBmBAxWCEcWOaSuFkUlGuWExC4rM
         dzRA==
X-Gm-Message-State: AC+VfDy4MLPXO+DAD/9yRMJVGkJenGWpoBFBaHTR28KhEtzhHF4g427i
	rwmB0g06NMXFwSDNyNfDZbMCwLc/FWel8jSIh3k=
X-Google-Smtp-Source: ACHHUZ53yeNLpZonvK+ffgfB1KtH4mOfKrjFv5Ox1XzovUNIfKqOqT5j2xazTUSW00vp0r7iH6+VWG4rAlflvczltLE=
X-Received: by 2002:a05:6214:d8a:b0:625:aa1a:b6de with SMTP id
 e10-20020a0562140d8a00b00625aa1ab6demr10725931qve.64.1685393908685; Mon, 29
 May 2023 13:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-14-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-14-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 May 2023 23:57:52 +0300
Message-ID: <CAHp75VfOfSs=mH90yusTwD1uVA4pLabvPSiZPbw_o9JuNnMR-w@mail.gmail.com>
Subject: Re: [PATCH 13/21] media: atomisp: Add ia_css_frame_pad_width() helper function
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
> Factor the code to go from width to a properly aligned pitch out of
> ia_css_frame_info_set_width().
>
> This is a preparation patch to fix try_fmt() calls returning a bogus
> bytesperline value.

...

> +       /*
> +        * frames with a U and V plane of 8 bits per pixel need to have

Frames

> +        * all planes aligned, this means double the alignment for the
> +        * Y plane if the horizontal decimation is 2.
> +        */
> +       if (format =3D=3D IA_CSS_FRAME_FORMAT_YUV420 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_YV12 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_NV12 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_NV21 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_BINARY_8 ||
> +           format =3D=3D IA_CSS_FRAME_FORMAT_YUV_LINE)
> +               return CEIL_MUL(width, 2 * HIVE_ISP_DDR_WORD_BYTES);

> +       else if (format =3D=3D IA_CSS_FRAME_FORMAT_NV12_TILEY)
> +               return CEIL_MUL(width, NV12_TILEY_TILE_WIDTH);
> +       else if (format =3D=3D IA_CSS_FRAME_FORMAT_RAW ||
> +                format =3D=3D IA_CSS_FRAME_FORMAT_RAW_PACKED)
> +               return CEIL_MUL(width, 2 * ISP_VEC_NELEMS);
> +       else

All 'else':s can be dropped.

> +               return CEIL_MUL(width, HIVE_ISP_DDR_WORD_BYTES);
> +}

--=20
With Best Regards,
Andy Shevchenko
