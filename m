Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D5384
	for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 01:32:24 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6bf04263dc8so4544228a34.3
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 18:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694568744; x=1695173544; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq8SgHFXKS/TzFJSEmQtwxfAWXj6dXC3+mc9FsXzQZg=;
        b=Y25Rj4LagrrtZgoDUmnHj1ir21pUl6sB0u8ocaZYi1FNfqhd2SZutWvINDzwMNK9uB
         4RKx97AqJKv2PN/4pgYf0QT4uezNzJFJ4e7HcsqhgVSpHNdmdWrNa4mKq6wqJW8YT4qK
         D905c2rTtBEeDlq/Z5a0K0MpHlLuU1QX9BQjokWMYmEDwOKMKb/ZDxy0Q2fOCEdOQRWX
         Prtu7Uy9TamHcckGISgTJPR+S/sfO3aEWdZ6xhTfQNstUTFVOdgLZwn8J3w49txMfyUu
         rXQqOvj+3fQHO6JhKProtYVsWZY7XVQMNTyr63UTUtN74l7mEzXBz+zs/7rx3Tc4xWrl
         05PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694568744; x=1695173544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vq8SgHFXKS/TzFJSEmQtwxfAWXj6dXC3+mc9FsXzQZg=;
        b=U1axtivLfT2jFYlkb56L2soW4poZoTZdwi7b1oolJ3Vo1LLdJNJX16eFni22XA94Mk
         g7LSBeGFdmSITL04vHydt5s6IESjXUz14qE/H6/gtS813y8OAw1QcwvHnXsHqwA3Je0k
         xst1/TVik0BZbcyuxnQc9G6xsTYwSWVBcbvy9wf/v5J7NkiH0Qvdr9ByRMTbhIaMMmPJ
         QRIwaj8NIg/sIn2B9NhudfRHt4jTiWwmJ1HJ50QKEyvMQXiAUfN12NhCW2j7QRx2O92H
         18P+0xxiN6UtENFWZ8/zyd5RcNykvAMYibZFwmzzlcVZGKqTidvlcb6giVJvrG9cqpMA
         SoDA==
X-Gm-Message-State: AOJu0YxMWH3Pp0wNpq/R80l0zeUjQH291OTO1fVXQTpP5guWZWYzNnfj
	J0z6E+6kjKxnVsmDE94YZOU=
X-Google-Smtp-Source: AGHT+IEt/bNpU0mRtK+AR7hsEVoqnuNX7FLGK81vCmsCoUDqeDEL7zNOB7lGTmHbnmb1jDXtdgZqDQ==
X-Received: by 2002:a05:6358:2611:b0:135:3f5c:9675 with SMTP id l17-20020a056358261100b001353f5c9675mr1730097rwc.19.1694568743861;
        Tue, 12 Sep 2023 18:32:23 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id c14-20020aa781ce000000b00687dde8ae5dsm7997630pfn.154.2023.09.12.18.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 18:32:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6773E89F3BBE; Wed, 13 Sep 2023 08:32:20 +0700 (WIB)
Date: Wed, 13 Sep 2023 08:32:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Angus Gardner <angusg778@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Removed unnecessary parenthesis around
 conditions to comply with the checkpatch coding style.
Message-ID: <ZQERJIGOOeYxgX3E@debian.me>
References: <ZQEKFR1OPoXGI2lO@midnight>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x1+FQVa4UDBiUUPt"
Content-Disposition: inline
In-Reply-To: <ZQEKFR1OPoXGI2lO@midnight>


--x1+FQVa4UDBiUUPt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:02:13AM +1000, Angus Gardner wrote:
> ---
>  drivers/staging/fbtft/fb_ra8875.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

No patch description and SoB, so Greg can't take this as-is.

> -	if ((par->info->var.xres =3D=3D 320) && (par->info->var.yres =3D=3D 240=
)) {
> +	if (par->info->var.xres =3D=3D 320 && par->info->var.yres =3D=3D 240) {

Greg prefers explicit parentheses on complex expressions (see [1] and [2]
for examples), hence NAK.

Thanks.

[1]: https://lore.kernel.org/linux-staging/ZCWGOZqdH1kWtOEq@kroah.com/
[2]: https://lore.kernel.org/linux-staging/Y%2FiaYtKk4VSokAFz@kroah.com/

--=20
An old man doll... just what I always wanted! - Clara

--x1+FQVa4UDBiUUPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQERHgAKCRD2uYlJVVFO
o73FAQCZr9WVvTPdXrwCR23Z8ew/F2TTSZkLjZY6t94QNZFc4gD8CN1oD399IWU0
p9IhzWXKtA85w37Q5pwbRZUfvAEcmwg=
=8y2y
-----END PGP SIGNATURE-----

--x1+FQVa4UDBiUUPt--
