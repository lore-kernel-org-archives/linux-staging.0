Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E8C7B
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 04:36:12 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id u6so15455837plq.12
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlv1Bdms+TGh7HRishBi7AL/M17q/GtZqMeMMOzK0zw=;
        b=n6BgtQ0l4s+izOjDnQPVaGG9g/QG4dlw3OUPyehypoZ53rQ3KDABpsw5YOTTBtAOaQ
         wGjyL4IG4CHTSV8gFO+yczEMdBUqXgz4Rq1pHGBwOc1Vhmy6R6xg6W7jgoNKoKzYQC8y
         5UxgeAhnR8f1gY45OCc5biZAQx+Tt3XEGDhliuIqozNKoAxdCPJ6nvQcqvxoqq1p7DrV
         YGqzvxUDUnMOH/Q5DMwXkJwSIGZWfFb/EYX4vXZwi9z4V8UKG5hk1nOjrKwUfPf5Khbb
         sKQYHRoG0lEGGwR3S4kCoHaSBfubMFp3RY9qV7iQeTvGTKm9fKjL3Z+p4SCQZyToCRCw
         2FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlv1Bdms+TGh7HRishBi7AL/M17q/GtZqMeMMOzK0zw=;
        b=BrRVGQ/9M7/y3EoSUK4lUGwNYpqbP6JsATH4Oc12ja9FLva5N+V6FwJZwIuvBz9LBr
         you8T1EKWX0MnXLv4B9RmL4gJcHjnKz8NTPW2lbY3IZ+t+QmMCHsBHN1wxpE3iZhfoO4
         A2AM0Eo5z5JB+Cs9LRErZlCSy+GY/ZAbRpOclPo5K5MkrUEmxbhET70HGuSqkrhI/mmJ
         x3BgsrpJMyPvIOONgmqAKyadK3/1nlnXE3CRB+vfKRQymLqBD01n+M8395vAfwl4AP4A
         Liqo4GNPGfNPR44j9BY3jdy+EUvL2nvI+mn8SLZX7cqR7kSsU3b/h1wUF6cDow15ALis
         rodg==
X-Gm-Message-State: ACrzQf3HU8XxUpeE6532H/mYjmPnrOs659N0MqlnE+ZT3v8l5vmCzGpl
	ciEbsn5TfoUQ+fVyhsYtVGI=
X-Google-Smtp-Source: AMsMyM4DyHp/kjqej/Y5tS5uY2KbKgfh9Dn0Y4gyCScMl6RqrCpobiIKjWLIxV2UX2DlZftZIPhG/w==
X-Received: by 2002:a17:902:d2c4:b0:187:a4e:f9c1 with SMTP id n4-20020a170902d2c400b001870a4ef9c1mr19877908plc.168.1667363771992;
        Tue, 01 Nov 2022 21:36:11 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-86.three.co.id. [180.214.233.86])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902a3cc00b00176ba091cd3sm7114888plb.196.2022.11.01.21.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 21:36:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 66E27103CEE; Wed,  2 Nov 2022 11:36:08 +0700 (WIB)
Date: Wed, 2 Nov 2022 11:36:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: chen zhang <chenzhang@kylinos.cn>
Cc: gregkh@linuxfoundation.org, error27@gmail.com, ztong0001@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH v2] staging: rtl8192u: Fix typo in comments
Message-ID: <Y2HzuCP9CJVs/jUp@debian.me>
References: <20221102030330.22049-1-chenzhang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dG04XqkRS/88ZThX"
Content-Disposition: inline
In-Reply-To: <20221102030330.22049-1-chenzhang@kylinos.cn>


--dG04XqkRS/88ZThX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2022 at 11:03:30AM +0800, chen zhang wrote:
> Fix spelling typo in comments.
>=20
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl=
8192u/r8192U_core.c
> index 0a60ef20107c..f6a0992b059b 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -4574,7 +4574,7 @@ static int rtl8192_usb_probe(struct usb_interface *=
intf,
>  	return ret;
>  }
> =20
> -/* detach all the work and timer structure declared or inititialize
> +/* detach all the work and timer structure declared or initialize
>   * in r8192U_init function.
>   */
>  static void rtl8192_cancel_deferred_work(struct r8192_priv *priv)

Hi,

Greg has already NAKed v1 of your patch due to him can't sure that your
patch was from @kylinos.cn domain. I also ask: why do you also Cc: your
other email addresses?

[1]: https://lore.kernel.org/lkml/Y2HNKwutTJh6kHXS@kroah.com/

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--dG04XqkRS/88ZThX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY2HztAAKCRD2uYlJVVFO
o2xEAP4oMVx8RDIo6MSUgetAKYbaXl4BXKRY6AiJX/LwOKQP4wEAzvPpCTmL2SIb
xVfcQwnad9qTU/LiYPwzNkK+uamAoww=
=NEPS
-----END PGP SIGNATURE-----

--dG04XqkRS/88ZThX--
