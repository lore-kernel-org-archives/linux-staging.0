Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD661C2E;
	Thu, 25 Aug 2022 20:33:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id d5so10761505wms.5;
        Thu, 25 Aug 2022 13:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qVqkkNnf4SASPkgKSjn2GG1shVqF3TWmPJPS8FLXE3I=;
        b=gbr/XcfRW4/g0YwuvJN8eIeMGEpDvRnLXU4M0ltlr36lQlhVjhEpEQ4KTnDurtaN4O
         cmBGpATpwU8rU88mI1DN6YaK3l0BJ2mzyKsaRD0npSylctOnqFCqk171t3zniI/qIvRv
         zS7/eZdHgAM+6FuLuxcLD/wejbAY3PxgCycwMZu42It3h7TZKe7YvnApYlP0+ox3B7l9
         4356e0je1uRA+n5XAfZvswom2ijbgNG9mBOvsQ6VsSn1ruI2P8c7qCgmAj+Yk8Zl9I8T
         8fxPom+kgbvKMiI1xm18KoF59MMrNlXiwvWSWzODSeDm+HEJnYM+GsNVsvnjU62KNuE3
         wpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qVqkkNnf4SASPkgKSjn2GG1shVqF3TWmPJPS8FLXE3I=;
        b=d9+1ThR8YQzsD7zmySucZvfK9c+VxUT7sn3jbUFV/MW+4GTeKAVxbW4z4zumZVpGy5
         nHBZ744a6yYT1ZhRFZ4X/xbQem+JP0NgoA6EGXWGkfhOhv4PAzgJ/iHdXMCH64gxy/io
         7fRP9ySf4lCgvrfo6wWrLI9XCcS7pdPPL/hNAtu9bim/4TBUgiGMLqb7aTwwNIuhQUc5
         CtoH6nzpkEIRwBxOvAXGZFtQCOzw5zjKo8dM+c+ZKfGKzvJH+qsYBEJWP4zHGwEU2hkR
         WcN9xMy2j9H63vC+0li+ja/LDDy1HSGKdAQDfv8xac5iC/9Hc/kMd+NGXXnUyHZgph/b
         VADA==
X-Gm-Message-State: ACgBeo33ehMuIWKLyk/RaFpoGPq/AllX2si2DSnl5DDdQejO+N4Eb7wF
	7A5aLki2xu2TmdBb104V0xU=
X-Google-Smtp-Source: AA6agR5Ynz7Rmm7gcdFxsN3lveFtTF3/kHvW9oN+UTgyFfVQkQRjOaoG2/21rmBBvay2fnTa8CJoVw==
X-Received: by 2002:a05:600c:3d90:b0:3a6:161b:4d77 with SMTP id bi16-20020a05600c3d9000b003a6161b4d77mr9089022wmb.87.1661459629000;
        Thu, 25 Aug 2022 13:33:49 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c155000b003a5c75bd36fsm7363625wmg.10.2022.08.25.13.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:33:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/7] media: sunxi: Add a Kconfig dependencies on RESET_CONTROLLER
Date: Thu, 25 Aug 2022 22:33:47 +0200
Message-ID: <4420213.LvFx2qVVIh@kista>
In-Reply-To: <20220825102035.419087-1-paul.kocialkowski@bootlin.com>
References: <20220825102035.419087-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 25. avgust 2022 ob 12:20:28 CEST je Paul Kocialkowski nap=
isal(a):
> Changes since v1:
> - Added collected tag;
> - Added cedrus to the list of drivers to fix;
> - Added fixes tags on all commits as requested.
>=20
> Paul Kocialkowski (7):
>   media: sun6i-mipi-csi2: Add a Kconfig dependency on RESET_CONTROLLER
>   media: sun8i-a83t-mipi-csi2: Add a Kconfig dependency on
>     RESET_CONTROLLER
>   media: sun6i-csi: Add a Kconfig dependency on RESET_CONTROLLER
>   media: sun4i-csi: Add a Kconfig dependency on RESET_CONTROLLER
>   media: sun8i-di: Add a Kconfig dependency on RESET_CONTROLLER
>   media: sun8i-rotate: Add a Kconfig dependency on RESET_CONTROLLER
>   media: cedrus: Add a Kconfig dependency on RESET_CONTROLLER

Looks good. Whole series is:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
>  drivers/media/platform/sunxi/sun4i-csi/Kconfig            | 2 +-
>  drivers/media/platform/sunxi/sun6i-csi/Kconfig            | 2 +-
>  drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig      | 2 +-
>  drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig | 2 +-
>  drivers/media/platform/sunxi/sun8i-di/Kconfig             | 2 +-
>  drivers/media/platform/sunxi/sun8i-rotate/Kconfig         | 2 +-
>  drivers/staging/media/sunxi/cedrus/Kconfig                | 1 +
>  7 files changed, 7 insertions(+), 6 deletions(-)
>=20
> --
> 2.37.1


