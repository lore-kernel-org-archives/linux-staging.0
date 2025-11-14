Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B869E1DF75B
	for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132182; cv=none; b=GnBAjlkVPiKKOCq29qjrZgacRCbGWUrb0Vw76pwPOMZ60kmOQIgku0rDKRrO67srJ+jQ+xUX6dyH37TkdvusD/W9poDQIF0upCRjyk733EjiGmyU1v9CliZdCkMkulIWFw1Q1J+LDHaIVcu1QABl/0foZyJdbRwh6hBOxg0Jhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132182; c=relaxed/simple;
	bh=8C9FHp7PZ631e2Ybbwogq7Pblu3WU18LYULy9dqpPsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4XIRErJ1xx3U7OdPK1IYpzm3FnA8xeW4a4TykFkpukcfb7XELc3KkLNs5nz19IqnHOkqM+P48wT5f7/nykumf280N4cqPrbgnwsRLHGPr2CnZSJm/cwg6EdLWXVvRuaTaKgVPYCDk4THSv+sHtZjo5RUmV1nBistSCI63IC2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abjKPmzv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abjKPmzv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47118259fd8so16042195e9.3
        for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763132179; x=1763736979; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
        b=abjKPmzvEw80N2j2K85ibQ+SpjghNO1fjXgWmgEOLmOS9nLzl7Gp/26VKk5DCX4vsK
         UlT5l3BqambvS0gll4L6+PwP36q1Q/9ucSEmON07cxju0MIx6RZzOhJXLaZDKWEAM+r1
         leetNjf2WaZv2tvXvF3EA8dopnAnla/MWLdupM1NhR1wfoXzoykBmmLDreakW0fVT9qQ
         CScdSzaGgBhqsSy0vtV3UwygI4eZ4p6TkrGdsUGHS9cA8kMtSARzO4IMoy2f+BMulMxP
         PUuagCYRoYPufWY/bLMGRHMkiE/ic7zZwxoYVvU/P5AqXc8B3O7Kxgb0bUGkSeCrRwsG
         Ie3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132179; x=1763736979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
        b=U9IqD5FOkU0duKyTgvkiG+VXJC5ZTcZP8OsRmyI3E/pZ99tQ64ceYhNfIyxyQJH5cX
         6afwoJkBiKKluS6KWPSdSKgdZTCfCEEgUwFddvCZzTFTZJXO7j6R8ufZviGfffy6mEDS
         SyiLgmuNRduyjsL97Pagz/QWwGNfMgbT1lTEQxHpQOqA/Bi9a0n5kRWlIivq9ST8VNKB
         5sXVnyOq+txpiZr+IDbk7lkDaEuR3FX8c2BOkAMhItAZS40t2l/fTS1JfOFGRu+uEY2V
         5FAADAUtKWfoi9P196fwLZc4QppVnE1R13cod0yh3pASD7WUmapeTA6bqcZDuUfKHEsa
         OM9A==
X-Forwarded-Encrypted: i=1; AJvYcCXFcljp8LyreiQ1Jm5HAs3AzhRoMkpSzmMSDO8pLbTj0zhA/CG6DoHdNckrt9qyb4L6dSl6MlD1Wbyibu8v@lists.linux.dev
X-Gm-Message-State: AOJu0Yz81fjOLRLBGMzAlbhXMb64T0te51gkrZaSWNP1RxociZx7653b
	BFd/D0t+sybLoAJ4p0iwTPsky30ZlYEWSfULr3d/GwZjZH3EGLbSHIOjjfWkHg==
X-Gm-Gg: ASbGnctH6uucS4/YlfscJMjjpIdtEBMVrxU0eyDjED+5qDvVcqZTq5fRk0kydirgRR6
	XzW5ZJmCmZkv5kZZK6gcPCh/0oHxRV/UoTlvDM9iRQy/TGkQuy04CwwUXBpq+trkKludDHiEyCy
	5Wj8WvwniKraqFdJLggi1OH47STwLbbEZxo8d4Lo+aw/nK097IqldSW+JqZMtnEWyjOlQAq/hzr
	OC0m+xg7ooBCcfuXyuzfKKG8n0fy49+7TQVPuMuyNvPo0Ww7luZvIV9rDLDQ2cefqfEaLtoPtdT
	jIdw6uz70gMukPz5W2oUdANNrdZk6UUHcLJIh9OGOpHH7oeFRb8wS1sd5LzbTSesH3GVzDqgij3
	ZYiXjdB5wPxhRdOIU1Yh1t0RktZBOqqrFl4LU7jM3HiPG9SVOa9Ze1dXEpSieqA7FndEw7DZdly
	FZrwL+shXETSqw7ywRm2KsYJGXR72D/LShXnoyGvyTV9snZf1lYc+fTEhyU99/JbY=
X-Google-Smtp-Source: AGHT+IHH+QDPwizZAqaXOkEIZoWon24hqYUWks1VOVo0gf4ap+2tE/j3QWY4er5Dp7X0/B6XnzFATw==
X-Received: by 2002:a05:600c:4753:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4778fe5ff23mr34390975e9.1.1763132178710;
        Fri, 14 Nov 2025 06:56:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm148886025e9.2.2025.11.14.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:56:17 -0800 (PST)
Date: Fri, 14 Nov 2025 15:56:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <cd467v5xu6aaxtllfc5awt6sen6jw3u4vdr35ue3x6e5cao6vz@4kjeiwo63tce>
References: <20251022144930.73272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqyqdls54xm3etue"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>


--tqyqdls54xm3etue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:28PM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
>=20
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-csi.yaml

Applied, thanks.

Thierry

--tqyqdls54xm3etue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQw8ACgkQ3SOs138+
s6Fc0w//YzvvfrnY2oE+gg920G2CSw3rl1e0FAgNvins2Qt8x1QUys+Tr3GyLm3k
k2TYECD1jsXh6dGN5XWZUxY8m0G+pzXgFqZ8jnLRstWRC0I3Vn+nGsbXBUMpbp0F
ogRuV3DGK+9Z3eDBahsQulOIQtRMvM9fMO3csuzI/ql+XCVzwjFzD1yjWkwsgl55
spLXD/YnC2YRd6rB0CbTxKb4CZX7xJm6eFZ0JWAgWdUDemIKLQXEmFIK5ZoqCK/q
PYn9uuFLeebTTLQF5dCuvSGSjoQY+SrVHBPDRDUqFL5m2PQPIWdVIgWPTrQ5vllZ
AkED1KPfot8yoPt0lP97nynkWFaC6jp0aSSKGhNiv3gwunwF1Tzf4KMlwtn/NZhl
jGrwt2CkVE6i0pW2lf6xneM6Kg206eSuCA5Shla69u74LGB0f4+sCfdNfDxg0y4v
24rrOPlNcFrJduCiGW+wgszu3XiR1Uy/l/UlSV505O44uHTRck16zup+hA6mz9Xv
s12707JMhxwtvqNUlvHc5pyu6KU7dgOzG4X3ezHKd/o3Zuxun8ZOtqUsWvhlRrrd
XkLbkt11kNxmCuVgBPxIwLTXSgIDZZxDN641pvWfFUx/sV5QZ8RgObK79ne4d/yC
BvXV19RCcd0c/aYfIaOn92k74QkOzOgFR2h9HOzDlaxTHEY/hFo=
=ETS8
-----END PGP SIGNATURE-----

--tqyqdls54xm3etue--
