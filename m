Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1A3C31
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 13:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAEBC433D2;
	Wed,  8 Mar 2023 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678280556;
	bh=x8A3q/wxd5DEV+ev4toYHG9IDX85FAj/ubBlRoLj+rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxQ78ea6I+OuV9L5hG5wgl8/LJYQDWgQhOsJViyJXBhzWDpaR6gkV/K0R5Lkt1+5P
	 93MtM8ZGLHlgG7jSBo4khLN3SOPOzsTQRW9WFri/rQ7+y+tc1FNgG5OdLhQc19hqJN
	 pCRtOXufu1/Bznv1fGpLpW28NeQo82hUmJrvH7KPSh/51iIVe/HRsXzGTMZBqVvi9H
	 3hJSg0LnQ6BDajF0cZ1gybgn50iTEHglNtGdPt0rKOaKoZfWWtxRBevtdEbrS0n1Yc
	 gRjUy8s0SEZENKmK7CTUIL5xTBs69RFrOBales9TfwTILFUQNrCKTf9NbXgMwuWENq
	 u40bB2B8KKyoQ==
Date: Wed, 8 Mar 2023 13:02:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 7/8] dt-bindings: sound: nvidia,tegra-audio: add
 MAX9808x CODEC
Message-ID: <8c24e719-2ca8-4571-8d00-cc9d488d56ff@sirena.org.uk>
References: <20230308073502.5421-1-clamor95@gmail.com>
 <20230308073502.5421-8-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ay+UYMHLXfir5e0/"
Content-Disposition: inline
In-Reply-To: <20230308073502.5421-8-clamor95@gmail.com>
X-Cookie: Minnie Mouse is a slow maze learner.


--ay+UYMHLXfir5e0/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 08, 2023 at 09:35:01AM +0200, Svyatoslav Ryhel wrote:
> Add dt-binding for MAX9808x CODEC.

This is adding a binding for a machine driver with these CODECs, not for
the CODEC itself.

--ay+UYMHLXfir5e0/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQIh2MACgkQJNaLcl1U
h9AnoQf+OpV1EbiGz6lefDAsEzUwcmFrYAkvKbhMSSQJK/tnDVX90PQPmPiL73dE
rVZ5+RmaRPRtj4jism7vnVrgpzF5YBSwOWNc8+cDLOR7tqqDxg2E/p6qMjiBemvi
kCWcaCb6PzRmkLSYdPBcqivC9gmbvD5eoMvrfMZkgmVXFbRoOIe2sdOpaTocmtgH
RQM6W1nKzKs1ApPEqoIw9cX601szP8lT9oCT7Zu0f2yhYXm/olE8c5yshCMBEPWx
dzLdZc/Rlq/5VUlrSHjdbRFNlzp7uQndVw1dP2LQot144rUnWea7YNTl2vzibRmn
lOX5dskV+Eob2wbmJ2AKPCO/QBeo8g==
=lQWu
-----END PGP SIGNATURE-----

--ay+UYMHLXfir5e0/--
