Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51378F78
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 22:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18985C433EF;
	Tue, 21 Feb 2023 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677017311;
	bh=0bDCc37RZMk8RynOgZTjNXQJhNd6CT6r7FfzrYYttJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5XPxWPbMbW/tAdU7Hqb28QdxCL1IVodMYfmI8ay7BzUDUAJZ6Axl4ZcbD6afo4pg
	 ys4yY4zghy3oURzE9fmYdKTmYPJUYThI+PkJ7a1932jWj/HS01EAlmzTDFuoDi+UVz
	 kqZE1DMUmbi0dKNATsCKtfSEJhp8iopo+aYOwHfTpEYPeu7wcKt3IfdamagVxVSelv
	 Vl4OJiznG2PO5eeC5oYMnsahSix0a/Gb85PPMVH/wREH4AHlvBqLb/O5DhmP8QGIJb
	 Sj9Ve0z4sc0UnRSET29GL025luO8c6Ee45ITWbXJNUoKMK2f2osP83/qXgQtYdhpGf
	 OCxh6nhmp7ecw==
Date: Tue, 21 Feb 2023 22:08:28 +0000
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
Subject: Re: [PATCH v1 02/10] sound: soc: jack: allow multiple interrupt per
 gpio
Message-ID: <Y/VA3HK/jGVPbrqb@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qmxly6Gn0iLCwqrs"
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-3-clamor95@gmail.com>
X-Cookie: Serving suggestion.


--qmxly6Gn0iLCwqrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 08:32:03PM +0200, Svyatoslav Ryhel wrote:
> This feature is required for coupled hp-mic quirk used
> by some Nvidia Tegra 3 based devices work properly.

Please submit this separately, there's no meaningful dependency
on the rest of the series.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--qmxly6Gn0iLCwqrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP1QNsACgkQJNaLcl1U
h9DWeQf/VRGoxVKrQTgsSjSQxv1jc70l5vn+sMEJB2VkseJw0TvSyTVBDvQlAvrP
y+gKeYz10KvANtdVfgXhWqeUnZv6criGYBX/aoT35qkboa0fk+eMz8Pmj2C+G3LB
YWRa+Q+Qy7MI3vF3vAYVBl8ElSzym4MKc5jAccVeFZGDIKC14nEKaPNDWC/odv7g
NXapa17rA/uezOIATkgqOmWfDZq3pj6WJM/IgIyJB7s/1EOF3RXUasX/BLbMer2u
rYr5sV7RWK47W9zqyXkFcTnLbwRfLBocJnuS39GSipXbRBHTuJLKfN0p17JYhEzY
2I/4OHcaaNxAMATbKQAt7rmK7MOmjw==
=BGs8
-----END PGP SIGNATURE-----

--qmxly6Gn0iLCwqrs--
