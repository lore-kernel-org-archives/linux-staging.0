Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DF410F9
	for <linux-staging@lists.linux.dev>; Tue, 27 Jun 2023 11:09:36 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6686708c986so4285499b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jun 2023 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687864176; x=1690456176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yCulnbK4UVAIuU+v53/85jZk8IWMeCcaI0WY2liGvPA=;
        b=nSQteyETBd9yYULRPcFvNVoWbGBsOC1cYjSgFH79kRXvgn8SuXMXSLEM783VzwITKB
         VoFg6CyUBRVuT1/iAjMetGHHakjnd2YetrF2bSGQlo9FpvLJzBDZEsDwIl0EIgngmxQf
         6OPHOUwjRgKQ6TsA7ge2uTny30tJZt/NaO6ePUFxhClwiDqZ044/hmYwOgCIlzFthWin
         jgqetGWFzxVerwt6HsL4QWiL2VcZLu/RVbFGnlDGg8oLrAIyxUeVAFkJx5fHOaaxHhEK
         sImVyu1YN56Zp7/CQpBf8gKz8G1OssLYZji7FWyuLpT54c+N1M/bzElxHzrtXCmX1xrF
         sEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864176; x=1690456176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCulnbK4UVAIuU+v53/85jZk8IWMeCcaI0WY2liGvPA=;
        b=WLPpkqC51SeLx4SP1GcnmO7Fn9RUhRChNsKtfNKxRhBVwpS8HbFqldhBiCx/YQ1Nbz
         N32QjWtUs0TiXSr8t2kg/2oA9F0HxSZTbQ7GzNIBh6jiY+eVu2vmDS2EGLO5Rbez/Mqj
         ZAyaDTlh54HKElGCBspMjNNnqGCTTHjhCGbzzF7Nq5gyf14MfPhq1/kFASut+qIsS5Si
         eA19ihhz8FtMesCJvSj5zdDqaQbODkeJQwXfraewZo1/ap7jKNDXpDFWmFZZ7mGUiVgf
         U21OEi93tEGo1qrQuwytqPdEo9x/XKVdZ+hJev2ljoCGjtT63pvJhdqm2DAP28DDn7nY
         PF9w==
X-Gm-Message-State: AC+VfDxUEg2JVdhV1Q3F84Mxy+o9X6V3oDihm6bz2DaLTmQR5tzwwvCi
	naRuw2vsk+9B8f6267c75I8=
X-Google-Smtp-Source: ACHHUZ7ynXpmy/G7SQYOF7SfsDAUzc6i/E7PnJ8qJA5IV2IA2fH9QwY4t2g4wMq7KeuEXN7eqFZBVA==
X-Received: by 2002:a05:6a20:3d81:b0:107:35ed:28a7 with SMTP id s1-20020a056a203d8100b0010735ed28a7mr41063430pzi.8.1687864176251;
        Tue, 27 Jun 2023 04:09:36 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b7fc5eee0esm3995591plb.197.2023.06.27.04.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 04:09:35 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3C38B81BD58A; Tue, 27 Jun 2023 18:09:31 +0700 (WIB)
Date: Tue, 27 Jun 2023 18:09:31 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Caleb D.S. Brzezinski" <calebdsb@protonmail.com>,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: ks7010: Wrap macro definitions in parenthesis
Message-ID: <ZJrDazgexlKD7EjI@debian.me>
References: <20210616212552.117604-1-calebdsb@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b/EBRw95GKhbiUfN"
Content-Disposition: inline
In-Reply-To: <20210616212552.117604-1-calebdsb@protonmail.com>


--b/EBRw95GKhbiUfN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 09:26:03PM +0000, Caleb D.S. Brzezinski wrote:
>  /* 11b rate */
> -#define TX_RATE_1M	(u8)(10 / 5)	/* 11b 11g basic rate */
> -#define TX_RATE_2M	(u8)(20 / 5)	/* 11b 11g basic rate */
> -#define TX_RATE_5M	(u8)(55 / 5)	/* 11g basic rate */
> -#define TX_RATE_11M	(u8)(110 / 5)	/* 11g basic rate */
> +#define TX_RATE_1M	((u8)(10 / 5))	/* 11b 11g basic rate */
> +#define TX_RATE_2M	((u8)(20 / 5))	/* 11b 11g basic rate */
> +#define TX_RATE_5M	((u8)(55 / 5))	/* 11g basic rate */
> +#define TX_RATE_11M	((u8)(110 / 5))	/* 11g basic rate */
> =20
>  /* 11g rate */
> -#define TX_RATE_6M	(u8)(60 / 5)	/* 11g basic rate */
> -#define TX_RATE_12M	(u8)(120 / 5)	/* 11g basic rate */
> -#define TX_RATE_24M	(u8)(240 / 5)	/* 11g basic rate */
> -#define TX_RATE_9M	(u8)(90 / 5)
> -#define TX_RATE_18M	(u8)(180 / 5)
> -#define TX_RATE_36M	(u8)(360 / 5)
> -#define TX_RATE_48M	(u8)(480 / 5)
> -#define TX_RATE_54M	(u8)(540 / 5)
> +#define TX_RATE_6M	((u8)(60 / 5))	/* 11g basic rate */
> +#define TX_RATE_12M	((u8)(120 / 5))	/* 11g basic rate */
> +#define TX_RATE_24M	((u8)(240 / 5))	/* 11g basic rate */
> +#define TX_RATE_9M	((u8)(90 / 5))
> +#define TX_RATE_18M	((u8)(180 / 5))
> +#define TX_RATE_36M	((u8)(360 / 5))
> +#define TX_RATE_48M	((u8)(480 / 5))
> +#define TX_RATE_54M	((u8)(540 / 5))
> =20

tl;dr (quoted from Greg's bot):

>  You sent a patch that has been sent multiple times in the past few
>  days, and is identical to ones that has been recently rejected.
>  Please always look at the mailing list traffic to determine if you are
>  duplicating other people's work.

Why? See discussions on [1] and [2].

[1]: https://lore.kernel.org/all/YCUAy1VhLV3lwa3H@kroah.com/
[2]: https://lore.kernel.org/all/20210222062849.GN2087@kadam/

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--b/EBRw95GKhbiUfN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZJrDZwAKCRD2uYlJVVFO
o4o+AP4kFJ0bFcTyIOndwfy4gS/8SGA/DJBOq0/mYtL9Wd5AVQEA7BP+wLRB5cFA
/G6ufCcKDnBj7clg9tHBRB0Rb9QPJQg=
=mNiQ
-----END PGP SIGNATURE-----

--b/EBRw95GKhbiUfN--
