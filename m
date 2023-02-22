Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00C46BF
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 12:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E94C433EF;
	Wed, 22 Feb 2023 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677069398;
	bh=lpdKAQ9bkkAwZ+0+Rsk48kOP1Zq/fFx7wHJ/7dSJWHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKqNDxJA/DlMtrPWwGzBTTtgPyIYt5wX+oDxTASynfoYAYCNXpQMPhN6mmf1gcizq
	 Yl4hznauC6FDR6KwHQPFG5IrtAEkEA4eGxHWkGy0mMKZo8mDD4mnN5sUjG4BSQ3Acv
	 bI1UPgkmnHNNso9eKdnH00aIj3Pi8BqfWvsJVc6bIHaeYE/ohxFCxdss3Ucis4cq+w
	 I1+22ydPS9OZD/d+pBTHJ9Z7y4f/OssGs2hqo4aeOIB1p3HDZBmR/soznHvr0HYYm9
	 S1bkE9TzNgFceo6pfSc/slBDQsny6qErZKUEVPL71dfBkEVZnn4o7xBgpE31WoGqX2
	 6VzDHGbSHPljw==
Date: Wed, 22 Feb 2023 12:36:31 +0000
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
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/YMTzvxkY/Qi07G@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/VIpVwFu5gUUcsz@sirena.org.uk>
 <CAPVz0n34MMs-AeHfuxpC3dL=0MKSqrSn3zgrCHbjozR183CWnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iscGT2sPbj0UkQrL"
Content-Disposition: inline
In-Reply-To: <CAPVz0n34MMs-AeHfuxpC3dL=0MKSqrSn3zgrCHbjozR183CWnA@mail.gmail.com>
X-Cookie: My LESLIE GORE record is BROKEN ...


--iscGT2sPbj0UkQrL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 10:14:02AM +0200, Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:41 Mark Brown=
 <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > > FM34NE is digital sound processing chip used for active
> > > noise suppression mainly on ASUS Transformers.
> >
> > This looks like it should be fairly straightforward to support
> > within ASoC without too much work, and since it's in the audio
> > path it should probably be referenced from the sound card it'll
> > end up having an ABI impact on the card.  Take a look at wm9090
>=20
> wm9090 is a sound codec, like rt5631 or wm8903 while fm34 is NOT a
> sound codec. It is sound processing device which must be active only

The WM9090 is not a CODEC, it is an analog amplifier with no digital
inputs or outputs.  That is exactly the same from a system integration
point of view, it takes an audio stream in and routes it to an output
with some processing.

> when DMIC is used. In all other cases it has to be bypassed. At the same =
time,
> it has to be set up because else there will be no sound on the actual dev=
ice.

DAPM can sort all that out for you.

--iscGT2sPbj0UkQrL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2DE4ACgkQJNaLcl1U
h9BIhwf/aW1HNPouVqOsY274P90l0014MlkovLQ1jnmzmiy7bwy8nwClvKprKLFP
uoNYds+IhHTdoSDdpm8s2a3Xpujyfzf6t65fjmnG5DGipjci+nOwZUgeIAnWcHnR
CY4c6imROCp9Mt9ZLOm+ax0BEV5XzzkHLUcLxUTbImF8g1h9y2KvjAyIkR86evQD
aWH+GsMaRL4aPh0+s7EcXqDIzXmzrVwUso7liqrq3AqxrtLwS3CxB2lLsH3Ef37A
kWSeNBq7D0r+vGMbFYVdLzUyy2uXjHYR0tYI89WCrAEsHpYenfV8W/xanEzo3F1I
ovL/eQvrCLSa7V2mh3ufL2wyfzeS8Q==
=+/y8
-----END PGP SIGNATURE-----

--iscGT2sPbj0UkQrL--
