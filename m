Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5923563EE
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218829; cv=none; b=qWz4jKBkqj1d/P+OT+sK2Rk+L1NTioCMZzPM9LY+eOc9zWXohErjDjQDHh7S7qETwwoxZaHH9AR0tr3KymkXJGBQ44iCXiViAcyu5Kjtl8gGpkRQOWimKYrIJ7yGmjEY1u/jCtssBjbVKSOvHFw4zHwjLsAkYMkP4I3GiPyr+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218829; c=relaxed/simple;
	bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoxHWhnjIjMxQrPGv8/5kQ3rnZ0sMZcwCUy3Oy6CWi0neJAiHdFDRs+VlWfLzjs5Wvt6vi3PGN8XrdSuphw7Pd2G+tmbfrC4Eo+GyhTcR9skY5F4zqhG9IWjs1MX2Z8U/073j/ix5qwSLSuRgGS0KsT6VzXSp6+qabYE7SvgVO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sCQIn4RE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sCQIn4RE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so52628765e9.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 03:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768218825; x=1768823625; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
        b=sCQIn4REp0Aa+XIv8QUYHN9RfLvL0mTm0bImXYI+5EsKKF4+bqN+vflE/CG3HKOO4X
         xOGts/ylRdxCzafyFYK9+tvdVgal7wLWex65X4IqVJ9+jKzNReAvAVXONQVwn/8KFPjC
         P3s49o4W6AAUOEU/m7O3JN64Juf4R57EV82YUPDcRTw9hiBqk9FtwPUaGOyrwz9HE1UT
         e8dwfLsLrO8k2BSnLRaIRIQBd8AP1I+1tbgb3uXUiVedrZu/HBjKPGLFjQiGRYjBK3Cu
         o+QIA4xv4uQwZgUnWZSMD6rxkWhBaWiJ4hCNZjvapG37FC34sECucPljWgJH7rkE5tsI
         TDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218825; x=1768823625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
        b=k1O4uCZgYgiTW3SCP+gJrxPemkLtzbWp/OJsieEa/wBZX1VBcA7p9meMd8WmXY7LRr
         C2kbqS7/rg8y75tpeEGrPvoBkn1oOCP+CEUWa8LQca0JGpmUgXfD4d7hj7HlxGbAKwqy
         Cui/7zysSrnUvFRoNRWtmeYN/VizqBZlIawWLBTN17PwTNeXaKyeGRGw5/9EqouUr7xr
         DFQeIj1hML69TG24r0COuSpNJDwpHmG/GCEEtLjcMllLtHA+4WESs+3ofWbJlcK8fts7
         js0s5HllpmEBSvg5qTfC3VBxqPCu/mcpMq61dzt8YGGugIv8ALlVUvyMR1dmpbIyXJht
         2mMA==
X-Forwarded-Encrypted: i=1; AJvYcCVjiM5wcL2BnjCruMaKsvZ6h61uyI6TbP8Its1iC0StH18VyxrXVzoyQ/5Ym6atJQYHenQ88KIRxY013Y+a@lists.linux.dev
X-Gm-Message-State: AOJu0YyoOeGHm19KFn5nj+/rl9XC1d94Qnp1E3nG703949ndCcLCHG/A
	ax6xnUiM0feV9qpvriIwN1DYlGdlpgeMKUKFTjBqFPOTpcvWPm9B6Ln7tQmaJkxmOZc=
X-Gm-Gg: AY/fxX6eXT4ujoe2/u9JwpwQ62QX1vZruDs+rPYVz6a+/asyUuq4PqFEat/ifUco1aI
	jQ8QJgriYNlwiO1YNrU7o+iLHnD91mS6SxxkqgoDzYMKCQqsXOeruPSrJ/vimPX8RCU5ixI+UxD
	0peQeWrEwUUq7RC/hi3uCZV4gqsNq+2s2xRBzbrxtgtE+Qbs7IuLfGnyzkGZuK8p2CqWrmAlnbi
	1LqMKgD+NpPXtvVe3KJdkIDfO5aWbWkV0sez2TCDfGVaz2odvOs93TGZyVhAKgGvg8sqhihJ2YN
	ge3LLrO/y617c8Qlv1X5vB2gAe+L7XqKKBzGNclZcYmLhTZ9R5PFpIjIr+VAQv7IIChUQVxpVpQ
	leGMiQAnxZdQl1RPurYfPEyLKkwHlXSNVkHumlvmH97kNhzY2ys8SCK5R5XdMTOCaKwZT8fZaB4
	1plk2uE9LqEzkS2a7xqO6Q30y7Wi2C/lMCoeYSQZ4bKkqtbPW4SBr6j6JBWmmCAyGnKsn4ND7tW
	w==
X-Google-Smtp-Source: AGHT+IHS+X3LSDt5qzxc7wN+ZiHbRa7V37jnrS+IUFcr2yrSlHBW3u8uORHbJtAGSuAyEXEXsweZBQ==
X-Received: by 2002:a05:600c:4ed1:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d84b54031mr204347325e9.33.1768218825500;
        Mon, 12 Jan 2026 03:53:45 -0800 (PST)
Received: from localhost (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:5084:e327:623:5b2b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d8660be14sm134733965e9.1.2026.01.12.03.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:53:44 -0800 (PST)
Date: Mon, 12 Jan 2026 12:53:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
Message-ID: <qqdjk5wi5xlily3cfa74lrepglo42ibnpoyam76vwkymju3hkh@b5dc4yg64mhs>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="atue6rojhx5cbpx3"
Content-Disposition: inline
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>


--atue6rojhx5cbpx3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
MIME-Version: 1.0

Hello,

On Wed, Dec 10, 2025 at 09:31:36AM +0100, Uwe Kleine-K=F6nig wrote:
> with the eventual goal to get rid of the callbacks .probe(), .remove()
> and .shutdown() in struct device_driver, migrate host1x to use bus
> callbacks instead.

This series got some positive feedback but nobody picked it up yet. Is
this still on someone's radar? The last patches to drivers/gpu/host1x
where picked up by Thierry.

Best regards
Uwe

--atue6rojhx5cbpx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlk4MUACgkQj4D7WH0S
/k5w/QgAhE2EAWGMq3JkMD2P64EjS1rMwsjti9FFnLXqoSgWOD1/HpSebIxgHVUH
9SjJD/+aDtRXdiEaEM0CWYWAcTk673HShaX+R5uJ+NUSegWvD1bO8RXbwYW2lW0l
5XEoBJro1TsCECL4gBAlxENblu01RKLwAnTAcCHRjTFEgjM833wJgTFdHrtUAZxZ
uiEOWaOT1mxK+8rPLf3lPzeu/3NAhDsUGyqIMDA1IQ4PUkSxBwR1A6CZPsL916r1
+Rr9xh8Jo7dY4QKqb7SseBTkAoqcbozDpROJPfpUmUbHCPld8WkAx7mt8I/DTJ+M
+lGuvDBluoPISCAslcMNqdQ44lcyOQ==
=kDAI
-----END PGP SIGNATURE-----

--atue6rojhx5cbpx3--
