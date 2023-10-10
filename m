Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76427462
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbAmqn5a"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40537481094so54562565e9.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696954403; x=1697559203; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap+ERWrbz8gWnQjcESvO2qjRnXglMjuwKN0/PSGnFg0=;
        b=TbAmqn5aftmRbo65GQMOqW7wQ1g5nVB1GLIEpIYn3KTkZAlfS0Ja1reZrlKQqJHssT
         w0h57IJY522Do0bTTZjWVofPaHzEQmRrVOikPyq5aHbqgSWsD343UnvonIroVSUuARDc
         O/hPjntkiWZd5Dw9Vb/tiF4NMCyc5crmfILmnI9p348Ulzd0iwE8Emp56WKYlUISozLl
         hlCl4xAEvn5ZtMlka2+DP6ohVONo55OQziDV3mJ0ptryu0Q7xgXbJ60JJiU8XkbOcUhY
         yYo7l7sP0qv7s/OajjcIqac+IpD6rflIj69qgdhlicHfFVA7hCol74kZLZF4GoPBhyf8
         KGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954403; x=1697559203;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ap+ERWrbz8gWnQjcESvO2qjRnXglMjuwKN0/PSGnFg0=;
        b=afyJolrrQvpERQeppTdRpXLeMyjki+UO3sW9PfQcPPpQmAv3RrQ++EmMaCdl2ORvbD
         E/ymwMAUQHhQfOs09K2cS8uw1u3blYylddBVpFPwTaGFMAgDKVVCYGQihC93wUVpYq1/
         yn6cWmcF4pNbzAERM5R5KothRnYFzkh2N1qZ24GPjye8FcGbTX0ZIs+YAst1UnMWlpO9
         g6KSIJwaUUbfQIs0c68f7rvt8T1hNBv+ZdJmLM9LXfC37Ykm/HazhsQLZsnRM2SZvT6X
         dy+sRCzGrHy8W+aweZepSw1iRkLo5R8zxUjSx2LQfwsx7yaZlUYArWdlArqtU6OWvvAD
         mc9Q==
X-Gm-Message-State: AOJu0YwIPmHtkq3ZPVCBttNfvR3vF0z9VvWm2XA+C4FFludgJ4B2VZp6
	8g+KNffhOewmDPlLGWWrgYY=
X-Google-Smtp-Source: AGHT+IEypkUu60r/7M4MteaQGqYfpQ2I976+ro3MbRwmSKjVUz1bIssOulFjRMi9z/oK/sOWSHAQtg==
X-Received: by 2002:a05:600c:21d1:b0:405:3ae6:2413 with SMTP id x17-20020a05600c21d100b004053ae62413mr16441550wmj.25.1696954402610;
        Tue, 10 Oct 2023 09:13:22 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c020900b003feea62440bsm14455869wmi.43.2023.10.10.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 09:13:22 -0700 (PDT)
Date: Tue, 10 Oct 2023 18:13:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, ac100@lists.launchpad.net,
	gregkh@linuxfoundation.org, marvin24@gmx.de, alex@shruggie.ro
Subject: Re: [PATCH] staging: nvec: paz00: remove unneeded call to
 platform_set_drvdata()
Message-ID: <ZSV4ICULpZ0jSGGW@orome.fritz.box>
References: <20230809154211.15741-1-aboutphysycs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xXFtpkf/V8blOu7n"
Content-Disposition: inline
In-Reply-To: <20230809154211.15741-1-aboutphysycs@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--xXFtpkf/V8blOu7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 06:42:11PM +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>=20
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/staging/nvec/nvec_paz00.c | 2 --
>  1 file changed, 2 deletions(-)

Seems fine, and if Marc has tested it, that's good enough for me:

Acked-by: Thierry Reding <treding@nvidia.com>

--xXFtpkf/V8blOu7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUleCAACgkQ3SOs138+
s6Fwcg//dbOT+ITHbevm6Ruz8/p44G6Loe2ygmnkQ9V0VXcuLpF1u5+IlXy5Kiqu
8eRdplUrng9qkDBKLl7OtsPgbM4hF3pOZmyQf8wep+f7f/8/dP1ERtPE8gFpMlfN
RUZorVq5Ds8r8HMycIzUf7iNOLYM7gzVLjkWdzChjmC7pjsvcjFZ7kJuEwtNq7X/
FNDgfedUA0J1bx+QzNzW4hP9IgukUzipPxMc9P6DE+bRhFTIVOHjsYaIRDs7xHg2
+KCUBNo2ok6hz7Z3k5JGgQc3i5fceRjVCYjKI8QXSUXg81pXJXmW8YI15wP22lKg
eDKnvY20EgIDfLSYKKn+L4EsuX1qruyWn30rmY3gIJMaZR4wrXnaPsnht08AUuSh
pSOihARTyhOA6GuwJPtF5yUGKnsgT+wpKPBQHYSpaB2MtLFM6PqQ45+nh1WMw2CE
PURvns5vlfT2YnmOw32NR8QZf5MiAXS/K1aFfE51x6OvkNQyqZICO6m31UUZgYB+
loZLWXS7IlV0PI0PBsR+lPVdDyTdIXYoFO6iWHTL5fi+qsZn5cYAZ2ZzcJjxyEm4
2ZhdcAro3zpKa9Qb03RoVJwslzoo9uQiDEv1dUSytemeQGex9+YoWhpeODVikhaQ
3n0fliQGSr35dPgJqUmza/f+0KeMQMnch5tw/Qeg4c/iBtqJ9k4=
=rvpO
-----END PGP SIGNATURE-----

--xXFtpkf/V8blOu7n--
