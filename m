Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1F3A932
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 22:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B47C433EF;
	Tue, 21 Feb 2023 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677019309;
	bh=0jWSrZiIEN4x32uRTklDrYs3W6jpjgamnp/3khg4KpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8Cw740x+y9QfrLGKgcC2J8j48ETLPsHL6ZB57DG9jiyQejRF3aPx3uXfKG+AU76M
	 hnEJ0G5VrTVkQ15o8E626ubweoVSpx19c1CYVkf/krW0rlN98dt/3C0pgS7KX/tEG3
	 7oWCM/2NtObu8QWigvFXcAeaOLQ6sAo3Ic+2IJLuQhbQq9c8LuzZJUvfg9LfSDQF3U
	 8vlM3KCInnerWHFqeQcH6FNaC2JdIu+9jVf3T36nMAsvVHrZgK/IbyY4PnpSWqxE6l
	 2FVrtdTK+JWX33aOgsPTLmQVrrQX7OJXBzfQATXkeyxcFA5Vg/EkntAj9oOuZvNN+9
	 vekCI7YvuWHfw==
Date: Tue, 21 Feb 2023 22:41:41 +0000
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
Message-ID: <Y/VIpVwFu5gUUcsz@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t+XYRlFjbWnfVnHi"
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-10-clamor95@gmail.com>
X-Cookie: Serving suggestion.


--t+XYRlFjbWnfVnHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> FM34NE is digital sound processing chip used for active
> noise suppression mainly on ASUS Transformers.

This looks like it should be fairly straightforward to support
within ASoC without too much work, and since it's in the audio
path it should probably be referenced from the sound card it'll
end up having an ABI impact on the card.  Take a look at wm9090
for a moderately complex example of an analogue only device
(which this appears to be in terms of system integration).

--t+XYRlFjbWnfVnHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP1SKQACgkQJNaLcl1U
h9DDVwf+K70Y1qVzg5TOp77al5H538FgUpnrUexBgtqevxsnf2pfTG1u1FhzAIPx
ailEywGHqikGuQiQnRlJ7QJ/nq2PVnZ48f+yjdRrvE5Y6gPfuVAVaXMUlO0cVF+g
gHuBj6tIxjz+ovqg9plyLwp0+6Pq2hkBOfMgRLU5YrfK2uUa991io9enHztwPJ1K
EDBwItdOm7Z7rA3eYR6SYwDaA/DrGoqcrZkj4JCsOYi6yxHUyoXWeRKUQUcC9G8b
KBTABkNAykYsDQpp1ePy5k3DNPeTzWCTlnp6FkEeVI2CSbiCO2WCNUamZR+LPS9o
DHJiBUmskQVX14bLBWBufAXsfXgFsw==
=ItYQ
-----END PGP SIGNATURE-----

--t+XYRlFjbWnfVnHi--
