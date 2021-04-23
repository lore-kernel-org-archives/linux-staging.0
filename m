Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925BB71
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 09:17:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w4so43906113wrt.5
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=zQzYGKwmer8FO3Nvs7yQ2PVsO3p5HZ2iuVDa85Jrybs=;
        b=EEb08Eo1vBkqYFi5Inv4M4Pce+uwawzwy3mlZS11DSQZ3jaPZo+GVpFQR1OAakPMc9
         rkmGi6nxDCEhqaVikGKZBoD9zEw2vO8d4s08UEDvxW6Coui9iECljYCUvS6xyqz8x0Ra
         eN2sfAaWEKRevtXjuotFynJSkD01NIhSjSO3LDLnz4fCm5ZoQ7DH4TpWSRAjAVng/2lI
         skDXFn/PycVcU9UnrCXMjh0b2gUp/nnvwrhm5PY1an5o0yDbPvoSPkT3UsgSGD5KzBZj
         ukBZFcLhanG6onuq9THa5RE8qLyLcx3oEuy+IrD1X3e5Qd6L1y0yJb7h/Vqw4OulZ77A
         3N0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=zQzYGKwmer8FO3Nvs7yQ2PVsO3p5HZ2iuVDa85Jrybs=;
        b=khE75fXCyiTSh9q6kQ5gfamP8e9i9zU/lbgyX+SkyU5zXNgyZjCgpMDNWcb8W0a2aW
         9Du0NCrhQLt5tm/shCEWcvpHu4cUTpEQjoGvt15IoMXmnwvQwryg0Ivp0XpEP1vGN5Wi
         xGJpGn7Xt7CYdkc6rjbciH1f6pkKelZR0Bq1A2HA67fIQxlj4w+10eYqSQijzeAFA/jq
         uKYmPqLIWStJoxVAIBi4r+PVAVTR9yFiv9wbRcFZihH6lZucZctWlognS63D6/PD+d7o
         3QG5GGJYCb8j3vZ8PGhGjwxyeRmElrDIGHYnhBU0JRxlO5+fRi5feHsC0OoVZRVhhCdm
         vJrg==
X-Gm-Message-State: AOAM533tuOX+ww5+bvX2jQycanDBE+y/a2+IZtjFoqsAiHqxZCTTpTpU
	8lz6XeyBocpzoLg7rGJw6MXaVxTi9cpi4g==
X-Google-Smtp-Source: ABdhPJzJAPWRx2x73WmUkyhlkZDcEiHLZ0PyQAkdOtudicsOsd9GwA7YtziwHUUws4yKCnTJK6XSFQ==
X-Received: by 2002:adf:fbcc:: with SMTP id d12mr3389389wrs.151.1619169437151;
        Fri, 23 Apr 2021 02:17:17 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:3108:4700:8d94:f633:2343:f95c? ([2a0c:5a80:3108:4700:8d94:f633:2343:f95c])
        by smtp.gmail.com with ESMTPSA id h17sm8282318wru.67.2021.04.23.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 02:17:16 -0700 (PDT)
Message-ID: <64ca0bdb9f93b33a80045b207a275fd7328c89d4.camel@gmail.com>
Subject: Re: [PATCH 03/10] staging: vchiq_core: introduce get_bulk_reason
From: nicolassaenzj@gmail.com
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 11:17:15 +0200
In-Reply-To: <1619122076-31785-4-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-4-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0vSoPR9OFqTZZ8nUJ5JS"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-0vSoPR9OFqTZZ8nUJ5JS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> Nesting multiple ternary operators over multiple lines isn't easy to
> read. Move this logic into a separate inline function.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Looks good to me modulo Fabio's comment.

Nicolas

--=-0vSoPR9OFqTZZ8nUJ5JS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmCCkJsACgkQlfZmHno8
x/5hkQf+JzlTUWKBHN8SQRtc368EY3lMXvfpUlZpMMZm+9Jtr9ZNGWD+AQGEauXs
Z1QyntVnYoFhgU3ftncUn4BUbWM8gifQJAe6H/qBpE3haFvMokSCgFk+s58dGkV4
EetMmw2ESUPNokbpgBUg0m+vJ7RfToT7HJ/hRpT8st+/fk+srW2nceRFy9TTzMWz
+0aAzb0apiELHjBfxT63KlHb0LPvvH4yJyzCObX5uQlNV9C3f9SD4QEqYG48yFfq
8wdeJUhW5sytFfSvSIc9qIOfpzwvjkoLnqbyx0pmHfLlmSXQ+e5mWeAfeeBXnmZm
U9KmFU4UOrnGjHY2rVmYhek0Gj6LOw==
=eSee
-----END PGP SIGNATURE-----

--=-0vSoPR9OFqTZZ8nUJ5JS--

