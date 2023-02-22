Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D65384
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 12:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D750CC433EF;
	Wed, 22 Feb 2023 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677068270;
	bh=9GmlRFeLaq0xJqlHCBlxHmEflw/cjNCvQ8EomYvQCy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwiNeLZFsPjnrK4I+Cu2ffSonN5hQxzvPUEPiaLXEonn7wSrFU9RUcpneslt9wZDp
	 d2jOWJQfQNjjWouQ/O0dtu0YQxZYBDTl2cIjd1IM+fnBntIOn3xoJeAh3LZHQ983cH
	 cLQnRQFlH73ykE/SIXs0fjnJt6ArAeuPZVN7PWRUGvuyH8NyD1xkgLCk4SHLrktU0H
	 JpMOwiWf1pvq4ul7ATU2wI9PMJ3Ox8QDapE26fFVLX4x2xjW8iGEpnuRUO3IooI0rZ
	 U/E9SjSEshbI8TxP8VnWsikub+Ipciqm39stdS5OfZ8LLqA8HATdsG2+Mvo1O/mlqR
	 ymUiXch60Q1PQ==
Date: Wed, 22 Feb 2023 12:17:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
Message-ID: <Y/YH5eqUgZ53vwnc@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
 <Y/VEUaOIE1mk1utt@sirena.org.uk>
 <CAPVz0n1kkXQDNhzFoa8xwqaFErNDTHSaqM07TDUHRPSnH+PvkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NGrKRoeMMLtTRJ90"
Content-Disposition: inline
In-Reply-To: <CAPVz0n1kkXQDNhzFoa8xwqaFErNDTHSaqM07TDUHRPSnH+PvkQ@mail.gmail.com>
X-Cookie: My LESLIE GORE record is BROKEN ...


--NGrKRoeMMLtTRJ90
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 10:00:58AM +0200, Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:23 Mark Brown=
 <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:

> > It feels like this is complicated enough and looks like the
> > clocking is flexible enough that it might be easier to just have
> > a table of values or otherwise enumerate standard rates, seeing
> > the code I feel like I need to worry about what happens if we
> > pick a clock rate over 6MHz (the loop could give a value over
> > that), and it's not clear why we have the switch statement rather
> > than just starting at a multiple of 128 and looping an extra time.

> > I suspect there's going to be no meaningful downside for having
> > the clock held at over 3MHz on a tablet form factor, the usual
> > issue would be power consumption but between the larger battery
> > size you tend to have on a tablet and the power draw of the
> > screen if that's on it's likely to be into the noise practially
> > speaking.

> This is how downstream handled mclk rate for RT5631.

That doesn't mean it shouldn't be fixed or improved.

--NGrKRoeMMLtTRJ90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2B+QACgkQJNaLcl1U
h9AD1ggAgGEXkKHQTxxtVxDQMk02dT4bJ/dorByL9oNrnCr19ruII/5BBJ9hmnsw
J6iCIEvHYDaaFGATbUGWfKylQjgepRI6bTsnsOkpnvzlK6kn/tGxKBhZ5/sxWu+n
ngzW35tcAX9l66cPsi3J3TpACmNzlehJobYqPtPLCq8+GHwRjqCPp3MxlDKw35lA
46nf76vZCfp34GIZ9VqOni9GKvQjudaKcOUKu3xN3IjNQd+nKElWsWwLh8b7X4Ji
1LPnwP+Xhze3ow0OpoCPsJGN4Kz8INyKEqrOaWEIcq23N83FNX7l8huDzWNVFkEk
AygpzBLJacRRd1otNcxO7BxXYAE+TA==
=QGGQ
-----END PGP SIGNATURE-----

--NGrKRoeMMLtTRJ90--
