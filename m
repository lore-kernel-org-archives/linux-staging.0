Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924785;
	b=m+Eq5DGK0m1iSLAcuIV+cYbIuj9JACslBPQG2JRcOkVueyCz8QT+Yd3nANc4joz5YuV8
	 rUp1PHpZu9/WeoS9Vea5pUbajIUQ0Gvo6KRizbRsB7MRKGXbhPbooO0w/s9FccXdJSrzA
	 4xmOr56LwiGr+tvkALzbSbFqYs9cH6CrG2v2CZUcIw3o4zfxSILtJ0g6bPfSI4Pmm5shV
	 jVi8L++eFIYAUg0H6mOR66jPd4p5IYDIVxc6lbNRdEmVU8Lo4eLpZKrZmZmB5rakRsRXh
	 8BP9PET5st4axwIckaJKKP4S/ZcyAIGsT3W7S6oVcl0P0JFlbMVo0SP1b3AtEJibo7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
	b=3yPqGpt2HoKQ/3mUzkQEmHsQdHEg7VrjRGuO/WQ+/NmM2KXjKP96OewEgZv9hon/aEon
	 dGJxDebazaA2zrDol3U8eG1u3/bpNi+UgPIDbnBhqEG0pq7esHcq4kDEdPPrUSy7FPCNq
	 3/g/UlOa5nPCYolbCla5sjM6bvYoF9rS27qiloOBF3IkcNdH4kuD5I+r8tzWRbH0tPX43
	 ZwDxxkbDWCuq2umB1xiDwlXrC7jyKo1hKkGPR1SF02WGJw+YZsOahlVc3HHVXDHXYS8hA
	 MUXQnn/6n/0uYt03cAUp9nboeZLeJXfedFdXnvSWPaTh1dIb8zcQscdWyAjW1jq3/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lix53bEw;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE52606BD02
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 14:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE52606BD02
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lix53bEw
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so762401766b.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924784; x=1795529584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
        b=lix53bEw6D6miyTQa90yDlGIY2+tJDEb99cp39kwTUDrUhP6Tu+7cMRBgqfNh6c8OO
         RpgEib0VDHKYHiLznVLonHZoKO6YOiT7j+AUDHM8n7cz6bQzLaAQwjQMPGI+sh3F5pOB
         RbV4iOMZ1955mJmPy75lP6kay6wyNxR9x5yJb4W5VHZ7W0ABWk+0xFa7eYuH0WLXu2Wb
         xyMf1AVMr+FKlFHFZmenZC7NG6HL9fFk56sYpfwdgedot3ZwOMZGln0Q5WC+vwrlZfYT
         PTEDBMHDnvhCZhXwGnbPdB55qpe9kp2CFa5MI0eopnOWA/LMdbPMs0RPSHjpTpcptW0n
         nOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924784; x=1795529584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
        b=QoosQEepFtU27DkLwuCGdZX0cUVlUj4JhN9msno6D5I9QD9ARngFCHClqaEK9J7iN9
         s64MQJPher8rMCeY5NN9mzhn5p0Da+cb+aQFXpDw98BavvmOpcj3+Z5ZlSyKJvEPlQWO
         jdM3hk6p9PYuA6WLP+qsqqmwJGI/qCJLHzepIrllc70u5n+W38gPg/MObYsE1pdZdX4E
         DwGawLM4g1jgUwmu2o3sznFmpJwHH3IwsHQdNWxRSOWLxl3Fn98GWltw6tlzk0p4lNZu
         GHomtRT34aAVDdOpSezabcXosj5/dRFRRAv8U/Xu1+ZRFPR3vFuwwXaIVFTXlwSom96c
         t7ww==
X-Forwarded-Encrypted: i=1; AL+hErFtQF1IexuWP7lfSO/KThTAHcOUbTeRSG2wiKHc4Md5PX8N+npBgCMLdPbJooiwgEQeXzCpBc1/8Qpao8ZN@lists.linux.dev
X-Gm-Message-State: APuU4Z91s+x498f5ZRfb0zwzDbdm1bOvfmWNexGuVc4UCHhZSzCO5DYk
	A3CKYqftefTHTH8rdGF6n90jNq6RX7ZCHSuQOUZTGvD4oqapAPmJurQP7IX7afn63Jg=
X-Gm-Gg: AYBFou1hev/04F6NxJlGPDanbM89zbMBoEL3gvbEZQJJRhld1rlqel+XhZiN8tUVVDb
	+Ggt+kMrDbHCSEPPJ8sBnc58QkFtfwtVQ0dR5m0ZGCUca2cLecdj3prW4TWN3bP9WegwGpsFnu1
	LXTS9rrCx4HjVjuafgIzg1UR8aeJLw8uFt++6ZVounOTxmNr8Fp3Xq6n0CJiUH9ZEj573S/J4qF
	+uyD3PTNhq5uG9T9sXp+xrVR7X3nvn50Mwt4n5gWofRWtkQv/M/o9wmq8T2nU9o/nT38Ld0LY0C
	odLpLN7HgSSu461t3r4gO2n81BZQ72IZ3FLAJoMgICoYqlcnXNm/8HUpblnJbJX9sM2YJNy+N8P
	0yV2V/zL5u1YWTWWFD6rO7zVaKCjoRePRRvAvVGPupdQfJpYpacRPWXYk3yn9rAPeQVh0LJt8bc
	y7+DrDrHAXlFov7OW9HI752ZAGtLb6jHYYBG54cTj54axVumGbzrnJfMGVb1BttSGiR5G4lq4od
	OUkRRo+LnxIMGB5jOi/NaBIgckuDOnzPxN/IvpYE5jpLGKL5knHhHAso9KwByjLvIci66gbTme0
	Z3hmFDG/tC9vZ6JY7XjxGVkzfuRuakMiPnv4vQRtA0SO6pYF37dqi7/RFbGMIG5rtpnRVAj4SnR
	XvmlW/DozXPi/bciz4OvxCmH5s2yaAGpMWTTB
X-Received: by 2002:a17:907:6d08:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c50963d803amr1154764166b.28.1794924783580;
        Tue, 17 Nov 2026 06:13:03 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c5095b42480sm554754666b.36.2026.11.17.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:13:02 -0800 (PST)
Date: Tue, 17 Nov 2026 15:13:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
Message-ID: <avxghetYnw4cMzDQ@monoceros>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-2-volodymyrchapman@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yk5ynk2fbcq67ijt"
Content-Disposition: inline
In-Reply-To: <20261116175151.20150-2-volodymyrchapman@gmail.com>


--yk5ynk2fbcq67ijt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 05:51:49PM +0000, Volodymyr Chapman wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> already
provides i2c_device_id, so you can just drop it.

> [...]
> +static const struct acpi_device_id imx175_acpi_ids[] = {
> +	{ "INTCF1A" },

Please make this:

	{ .id = "INTCF1A" },


> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx175_acpi_ids);

Best regards
Uwe

--yk5ynk2fbcq67ijt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YOkACgkQj4D7WH0S
/k5y1Qf+OUVwH0rsGj/2gGo5J7ZQAl3fbtha40ZCFyB6EPF33IgI6wEfhKe/QjCv
jxF/n/mCkvgddsUdiFRG76OMPUyguHq3EVTzK8ULs9ZzcjLEYLt4vI87yAcgkISM
flKuKZh9rZ9Xyk/Zwy36taNqMbjB6lK8zpx1zLop5FthwvDvpYhiLeiyc64XXgCd
hNLM4MTT4s6E8/syfX7XYyZcgW7i5DieZDEKE0YFUD74MacPeGa2bbXTMeti2FoM
M8jBI1CHmGcyPJEgoFN2c0sy18MzqVs+yqM/PEyr6+oN54Q1NA1/22Mx6zV6Wi06
uiYps95UlTprmxCHkXhX7uVYug+nBQ==
=mGJq
-----END PGP SIGNATURE-----

--yk5ynk2fbcq67ijt--
