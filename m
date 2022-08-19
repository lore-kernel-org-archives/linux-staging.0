Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CFE7B;
	Fri, 19 Aug 2022 04:17:22 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f22so4244810edc.7;
        Thu, 18 Aug 2022 21:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6lvvXLfM5LOdFLVUiNZsTdpLpiUI86D4rWn+DOqYFh0=;
        b=ibp45+6h5fzr/+9Ziardi4SQETtREv18AtDH1XSs3KsI5cHwHF+5uBV1cGVZfS474j
         LTn9qriJulu3ZlRobCNa78GUscmgvcP+nyJMmnM4Mh35zz2vO+4mG5i09awCM2ke1j67
         DjBFoLSOxKuCDw8E7bt/YhxFOP6HAAE5XKjxYo/o1aWh+DnYfjt1P6m7zTiyjCtMsBml
         Bz7lGsm5uId/cMoWDTsbWVwCLmneLNdCobEijmfF5sDwrXM+KTzFdD0GXeMzP+AKGWOk
         +yk1i3hsmKLrfQJGz7mMoK2aLgQiDqpS8sUUYn55LXo9wuJ4jcaKDZ2f9gmigw1ouO1Y
         nq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6lvvXLfM5LOdFLVUiNZsTdpLpiUI86D4rWn+DOqYFh0=;
        b=Y/q7PUs4yDXbUB88qjKKkFBdEatfLVFzJdi+2u7/0KY69mWibdCFNYDlM2trPdf9IQ
         MYREs6nTnrXR74Pt6tttzD2P2yCsdDUVemuDWsvHLprNTL1/Rf9Sm3pQiEx/nhu9rbJM
         0lgB/mcSw02gWRa+dZS2Jfr1cXhAi+hL7D59xnA3DageUb5bcjVobv2f7FjFvomChcD8
         E+6LiKP+rpeeZ0I/26MJvPDX9nU0h7OVyzKcUUPEbymXtnm/0dgxsnVRF6hMrVFMhSI6
         KdpssxY+EawTlin/aN1qP22h9Uooy7fHwyjwRApOLdViFCuf9FMajlSi9OJL8ZZJhkIz
         j9qw==
X-Gm-Message-State: ACgBeo1XOwuFSczzxXKIGOuELJ514GzMyg3jZNCsThvD2iIwZGOIYrun
	nbrAnsaUF8/EH4JAE9o8gsk=
X-Google-Smtp-Source: AA6agR5Z07MgU4moBeeqztDOefM0MAGvbUBpqvrsjjGU91Kk0uWVg/sUdlSZTVDXHp7liUsXnY3Lqg==
X-Received: by 2002:a05:6402:1f87:b0:43b:b88d:1d93 with SMTP id c7-20020a0564021f8700b0043bb88d1d93mr4507704edc.314.1660882640878;
        Thu, 18 Aug 2022 21:17:20 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id d2-20020a170906304200b0073c37199b86sm1234394ejd.159.2022.08.18.21.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 21:17:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>, stable@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] media: cedrus: Set the platform driver data earlier
Date: Fri, 19 Aug 2022 06:17:19 +0200
Message-ID: <4418189.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20220818203308.439043-3-nicolas.dufresne@collabora.com>
References: <20220818203308.439043-1-nicolas.dufresne@collabora.com> <20220818203308.439043-3-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 18. avgust 2022 ob 22:33:07 CEST je Nicolas Dufresne napi=
sal(a):
> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>=20
> The cedrus_hw_resume() crashes with NULL deference on driver probe if
> runtime PM is disabled because it uses platform data that hasn't been
> set up yet. Fix this by setting the platform data earlier during probe.

Does it even work without PM? Maybe it would be better if Cedrus would sele=
ct=20
PM in Kconfig.

Best regards,
Jernej

>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> 960a0130cd620..55c54dfdc585c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -448,6 +448,8 @@ static int cedrus_probe(struct platform_device *pdev)
>  	if (!dev)
>  		return -ENOMEM;
>=20
> +	platform_set_drvdata(pdev, dev);
> +
>  	dev->vfd =3D cedrus_video_device;
>  	dev->dev =3D &pdev->dev;
>  	dev->pdev =3D pdev;
> @@ -521,8 +523,6 @@ static int cedrus_probe(struct platform_device *pdev)
>  		goto err_m2m_mc;
>  	}
>=20
> -	platform_set_drvdata(pdev, dev);
> -
>  	return 0;
>=20
>  err_m2m_mc:




