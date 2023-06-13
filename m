Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC7B2915
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 09:50:34 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DCBA33F26F
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686649826;
	bh=+S8RVn4cwZ2hxJXT/iwldZ/F9edrSEM7MNIbg+01La8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oggMr+VrzupefQ5YI9jTJ+1QI6ftAxJbype6LjY9+IW4y5zQeLjwOBXHh9jq1Y+fh
	 QeILcLKAbPVzKxlArgb452JDtcYjmtNI7Rieqm7DDaBL0CoGws1gYCiOaB+mbwp26R
	 PbY7Zkt18D2OYR6EINDm+avUh2ZBPdUg31Gu2xlEIc3IvjOdbFI/pZt/JhEtHB+7i1
	 tLpS8fLnRpO3hi011Lf2p4RrwiV5eUNKssEx0IpiMp3d3vkUc1rx1cBwMS5VZNmOEe
	 y/VxMej23M+K8Hvuh6hytnaLYSNNGc9N3XBYslwMshtmHS8k8Xa88IecYqOHuaXXab
	 MQTzSPQXewJlw==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30b590d5931so1975870f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 02:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686649821; x=1689241821;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S8RVn4cwZ2hxJXT/iwldZ/F9edrSEM7MNIbg+01La8=;
        b=Aswcpoa+CLwQS+07ENQnd937v2rlsN9E2UlZwnoXG5VNfI5LWpiDP4iZ02h9iTu2rX
         LuFM7I4+JCuBlhN4iT2gEz6l7fNWVAl13cYX0br81t0XSBszGISz2yWy8IjllrrTxWfX
         vw1T+xIl5qO3z94T1WPlaUnvmv+/IdMTZyQU2AHuWDlGgW+cDo86cqZO4SosAk98AWoy
         5SnrLPA7sOM1rWtmkWxa/7PFr62SFwwVg2E/UyCiUG4dX2OKq7oejIr6NvoRJKo7P0Ks
         yj400+pe8EeKDWNU7TV6RHbsD9Uehu6cShMU7gTz7nhPUz0sc9Hz0QNzJ4bSUPUEUSmU
         1mtg==
X-Gm-Message-State: AC+VfDw/sdcP9MCt6MDVyodt5UTj5caCfG5hPKs096lRw6fCcY/UQ9Cv
	uXSpGsOKpnfZjWXT4zMLkndTaGJXLXwCqS3Fx+4lmLY7CS/8G1b3kiKfaQE3LVmToPkqphqEJti
	wow8+9U7IW014/fLCWDwC3fIbDH/+3SeZRAcBXs+FxSw=
X-Received: by 2002:adf:f5d1:0:b0:30a:e973:b182 with SMTP id k17-20020adff5d1000000b0030ae973b182mr5621219wrp.1.1686649821375;
        Tue, 13 Jun 2023 02:50:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qsylu7h96z/YokKVYhvI775gxBdTlvE0mtDesHac9WjQrm8pjsK7JHPCjjoGLyNjMF04RdA==
X-Received: by 2002:adf:f5d1:0:b0:30a:e973:b182 with SMTP id k17-20020adff5d1000000b0030ae973b182mr5621204wrp.1.1686649821059;
        Tue, 13 Jun 2023 02:50:21 -0700 (PDT)
Received: from gollum ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id q3-20020adff503000000b0030fa3567541sm11795106wro.48.2023.06.13.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:50:20 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:50:18 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: gregkh@linuxfoundation.org, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 martin.blumenstingl@googlemail.com, mchehab@kernel.org,
 narmstrong@baylibre.com
Subject: Re: [PATCH v2 resend] media: meson: vdec: Add MODULE_FIRMWARE macro
Message-ID: <20230613115018.562c843f@gollum>
In-Reply-To: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
References: <20220818064810.17856-1-juerg.haefliger@canonical.com>
	<20230126153258.1558471-1-juerg.haefliger@canonical.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ghcr7VuYGJ=w+H+lw1iLJue";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/ghcr7VuYGJ=w+H+lw1iLJue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ping


> The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
> provide that information via modinfo.
>=20
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>=20
> ---
> v2:
>   - Drop duplicates
>   - Add Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/staging/media/meson/vdec/vdec_platform.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/s=
taging/media/meson/vdec/vdec_platform.c
> index 88c9d72e1c83..70c9fd7c8bc5 100644
> --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> @@ -280,3 +280,12 @@ const struct vdec_platform vdec_platform_sm1 =3D {
>  	.num_formats =3D ARRAY_SIZE(vdec_formats_sm1),
>  	.revision =3D VDEC_REVISION_SM1,
>  };
> +
> +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
> +MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
> +MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");


--Sig_/ghcr7VuYGJ=w+H+lw1iLJue
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmSIO9oACgkQD9OLCQum
QrcQVA//Xnyo7NgEIg7RU1068vZ3jYv79u7ET2NDlEqPLkXRGNpC09DHkjFbVsh6
pIKGdGT27w2eN7UoOueSXoX3UMr5ZMXVdfh/zsQSmfb7Jxm1cAujfJwiBLwtnGZz
J2IBevnvVy8BddBMtAlxcR1cVWj0H5SZWoO2rYGQWJ3udpA0l7kb2taZndeUNs4i
Pklfe4w7FsgFWoIAyG67C3prc9LQh657mYzLvdWWNfnhhFGmy/SvXXWaLMKraboF
u97X7QT92k8dOn08zUwCGfzFePuFUidcSFQMrf0hf1hCWSzxYMP1ELWqJNBnqo4l
pt4ivVVr2RarOXRpnJfM8+sCjVcJh3HNsW5zZp0nACBUQ2dLarBvf8Zwmo59oQC6
e2VjXIrLImN03fz+rlFG4w+Y12fRJq0tDNoCoAcksZx361ppaAWgjyU414hDpXjp
WNIcZXhEwpgqqUCHpb8Os9q3y6LbMy45ybhoxhpf3HkvZ2QgUdOEZkDtk90GHPxY
5ApOAm9Z1fZdD/wv+3JIMu7GZ41+F12cT6fnt9Xk1shNv9kqOFVlLy1r1il92wZ9
kqLfQBqg1PU9aBRJ+331N+ILCDxM3L/NV5pAftDB+oI9oB3x872Ap+Kk/4K5zMjz
B/yf3x6QDrX8eJKRmcOYR93LIgb5vMquSlhJ18eoWhimhazb5qc=
=sYn1
-----END PGP SIGNATURE-----

--Sig_/ghcr7VuYGJ=w+H+lw1iLJue--
