Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B1F39184F
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803277; cv=none; b=VhGHWVc7vdUcFKiuCOH1Ml78yL2eLbmFFh+2LcSyUflNKHO3T4jAk0iec3PxjG6MHYHWeYm/ywTaAmCarpYsC6T7n+/wcH2vGHMpjn7tfCTS+jw0oBvtIIIfayhUqIUMY8AMQ0QtLJjgkvFvBZm6Kyt+i5MwRu68Ov4UUN3V9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803277; c=relaxed/simple;
	bh=gCRdoiNYDO3HoZ+F+DE/NVCumhqnZCgJkbrzQXX3S2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJCs5NHBnpuujdKS3USkOkyauxFBZz3GXQIcoiYimKPan4nkkgQMmBvCYCrYdYsLNPl8N2DQg0lMCvw0g1xcYiGHIePe9SmYOuobLOdIwrQVUNI/wrjRdrdrMLFQW/ORhkXcUpQFhsEJUP4jzTxvC9RqguzTpqFMXoicDKkCjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LH4s31Na; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LH4s31Na"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so17246455e9.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791803274; x=1792408074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7P/6e9/DIRLq+PtH8UCLLUQW4yirs+qPLm89lZGge2k=;
        b=LH4s31NaJoEV8JDnWrVjyVbrhKrAEAyZit//eDvOldfOkJ3BYZLGHFAy7lD0lyXQKI
         G6/xkVKSxZaPW/s0pNcE/co8paLLkevHS6nXoK12ohZJzsFMEKG7Yx5Md0amNwjKGDJI
         zHH7VIk6QCLueiOcnSDmKBAuM79HR6z4x0yyhNhN5Gn4s2YKwA1FwkIqwDBkeZVUT7Lk
         RpPwyw0Ktkj8zdAnVMKXRWRzt/XEC+RcYjZ8D2dnLkI2P6wRdpVW/mN6QDtI3suL8psy
         kBJoD10P33nyBl95L+HO7NIy2xFT/nnYi2UWTk69zdtvW/HUN0Vhv0QxdUHktNXvhCLF
         F1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803274; x=1792408074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7P/6e9/DIRLq+PtH8UCLLUQW4yirs+qPLm89lZGge2k=;
        b=S+IOfNPHBTiNsoyNYM5/ycOxrC7LnUGwf9WfwSyclqHyHDIa5q+NBSHsai+HgRXZRS
         g/V1damv+5lh3g9gtOyvxoLuC0s3A5o+FRDDLnxf//sBvoIUEd3i5UCvV67SejXRK+lm
         hTI12zp0Wvubh8rzhRyP1Le8B6kLOkquEdE0BOexlNJBG7Yx2TfQAcJznKCuNQF4/Cwy
         6a1fJfjxdyN3vsaJOGHtQ/KyYR/Zpsfwfg9DwCkx0IgKsOu12Hbg8hVf9SZCHBasMpI/
         ZPNHvEZMZMv+AbUpC17xeKqWDzcrd2uKG8lswbQuuE4vGY7m0vAtrl/+3NQxmyLZzxi7
         GerQ==
X-Forwarded-Encrypted: i=1; AKwUvBzerJQ4RLVYPHLvrSZjBdUHb4fW4lQsjK2xGHF3+QL6PtkhVbYvZfE83caUaMqjjZ1aMCoUP7BDHz8UlItv@lists.linux.dev
X-Gm-Message-State: AFq9FYI4fxHlk2IBUt1D0LlK7MC4VF6Rv3XDtOSnYa/jRx3AmEydssNp
	X6G3V2feBZm1I3T2LbVslk0JrILNd5MvVQie6r1shV/0qlKpir+RIlTRryZlBK98TQ8=
X-Gm-Gg: AYBFou0P1i0u/17aqyeLpMPVnMPgg2IK2Fi5O5B1l2/gdXaXusy5YE+tKXih9K6jwPK
	HeJEuXzmEDdVgkaEiP8SjRNResYHWoHPPOROc/6vaeklURmSFjfdja58lwXdvIEpKk1WV/zgWPi
	fCRtjQXDD98c0fFwXtzGFdzGeVktuQBnpc8lWxPBVGmScZpt9nmwp729CRP2+tjiIYIkq8yqE8s
	QOtndIFBkApWbjJiwPYzkAzcEwxImP9SDF1Yti94c11titOd0nJ4UH7CVyU8GvM7DrDfnawpjQF
	xm2l1RwZHNuiv3CEzqIj55XoyFSKWSZ69OitCwf+Wp4JmT+LLF6Gs5C4IYc/Dk1lZ+CFHZdMC+R
	W+N6+oCe+4gNvOPlcf0XrTWCtAV9em8FZMCTci5INH9RB1IZoHrHqJbpHCmU6HO7a2kbB5rPUH7
	xxGgYFAZ8SQ7PslKUY49OHU1MzsuT5i94WGkkEO1/CI83hz7q0s4Q6Kp5aSOchhCs/ujAV/Q3ow
	OYFWB73rf00eETFTqJH7H1os0zQOvfvSqmvtOgL0IoZYOCbb/YwHjWj4PieHg==
X-Received: by 2002:a05:600c:3e1b:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4a18e487239mr186335915e9.14.1791803274028;
        Mon, 12 Oct 2026 04:07:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bead84esm279131425e9.13.2026.10.12.04.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:07:52 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:07:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: Ramshouriesh R <rshouriesh@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Bingbu Cao <bingbu.cao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: hm1092: Add ACPI enumeration and the
 19.2 MHz configuration
Message-ID: <asy-3JrGjoZCseXU@monoceros>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <cover.1791608336.git.j@metarealtyinc.ca>
 <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kqxvnpytatkx6bm3"
Content-Disposition: inline
In-Reply-To: <b0d32a3b82eca233652f878b7ca91e4dc2d8e863.1791608336.git.j@metarealtyinc.ca>


--kqxvnpytatkx6bm3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/2] media: i2c: hm1092: Add ACPI enumeration and the
 19.2 MHz configuration
MIME-Version: 1.0

Hello,

On Sat, Oct 10, 2026 at 12:59:21AM -0400, Jake Steinman wrote:
>  #include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't add new usages of <linux/mod_devicetable.h>. The subsystem
headers provide their respective *_device_id structures already. So
<linux/i2c.h> already provides i2c_device_id (and of_device_id). If you
still think you need a specific header for these structures, please use
<linux/device-id/$subsystem.h>.

Best regards
Uwe

--kqxvnpytatkx6bm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMv4UACgkQj4D7WH0S
/k43Jwf9GrlIGDCBYKcBqQkWsgG0oiIQfvX7JHkUjt+RJwtNvuv6MTPBtuNY8dcB
Pigqb0PhlmTGfJaqgKSkc+tcny8ZN5928YFLO8q/KhLOq5fAkEksTgaGzWEw//CJ
GZKtUP/v5FIPb3hBLX7uNvKEDc1ZflbJd0Wxw+OSLIHwwsn2IbRcG2p9hRdxYc6b
6col15XvOq2Edshj3Rs+1f732N+aDBEYSvsdQmDkvZ6pSGGpDRUPCBbvfYg9vSo6
X4dffxXERL5epamRzrBNqZGl+BnzjdfZ1pU7Mi+jt8PAm5u4Q1fvPIgx6VN6TtYY
XUhHIk84okjCO1QVAMEyAnEaAtwRJw==
=RGI1
-----END PGP SIGNATURE-----

--kqxvnpytatkx6bm3--
