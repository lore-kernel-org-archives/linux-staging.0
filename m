Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9179A2690D1
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067942; cv=none; b=X3eZFbcfefSZZgsxqYSRwD+xbCPC+9m0VluyECgrvbNhLAqc86qW4GnUmbBS2JuSuOqFBZJTZsv+3cZ8fUSZU92we/f5hWjbHXqhlEKKZTlglZEiF/z2f7/hY8AQ/soTAGTg2+Mhk48kAHPmRCRsyQgi3Hm6H0LEpVEinKELQxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067942; c=relaxed/simple;
	bh=hOaZpIPU4+XxMnfRP6ushVxknuqbVC0AAepOfbfQUiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+MZL4RhqHLgR3+IuIPTWLfc6mkWKP29ZpGseJ46Cu7v7lCaKoahwM7hH/v/43ykRXtcn9rqrAuyNLVy5hbCewITPFTYdkOuIQuhdUx1F/6xSBsypNQGKlKYyXwpB8tezCeTK2PZDfo/UfYUGQpvd8roJnYXaTR2CL/bvjnSFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kY0T7NI+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kY0T7NI+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a1388cdac3so6325885ad.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766067940; x=1766672740; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJFttwe3pIjHyPLfagVpv1sywC4wqqLbZAgcahrnMHc=;
        b=kY0T7NI+7PIPZz5PR3YPasqMWEBgzo1ah4bGdQImoAE5JnRWOzV6WRw2K8vN16KvCg
         vnKjKXu3Klho0RvyISGu/b/3bS0g1xMjjm1zKhiwJ+FU7CwWc7JugPhhsIhjnc28ltjw
         +dVwwFZ/4N6VphWjFHjmsX9DU42ZzV5kK35NEi8EcsNkb01gFbAfT8VEVLhbnhRkDlaV
         o27JVqlSByaZuZzum/a51SAS0lHXc2g7H7rcE6oG/0JkwNK8H18o72UgS6G88SQZrD1V
         608TJT2A6yowk2SB0Un2wrx+jXn81bV5i8c4FO8KzWhSxl2BKUMort5Vv+NMn+yzshRB
         Xzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766067940; x=1766672740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJFttwe3pIjHyPLfagVpv1sywC4wqqLbZAgcahrnMHc=;
        b=Zp1IDJzuAj1Fj6gH+KehkJroVYzYq7cdycos0Iqy1lJJEIn0ZkiqKDvNcXi942ReKb
         iOg24sPGt18rP7PxOWePKB22ajOVG56h6LmcREnoX+ffp0s6yiJuw5cNwh5py8ok1VMY
         TqpJEKz6B/7Q9FflLdw8PKjUS0tVikpcaTM11iyIYeDEY835UOUz13YQEsmWhL7NBP9C
         ybMPwCGKylHRyxHHzFOi2b+B0HwJRdWOtozqIw9tw7C6/ljI8e4j0bAsHan0JjVBpcGP
         Sz0qTpiA2br/G+I1QobnGfra5QBGAy6qqHZuTx8Xb0B3FfncpzbiCEeGJgcZleRe06fg
         AAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgc3nN0pF8lHB9nmw+D1h6Hiq95YJ9yAEtR/JTq/1OPGxZu+eltSFGPHh3SpED5YEPsT8j+oblCAA7GPSn@lists.linux.dev
X-Gm-Message-State: AOJu0YzIusNCU4YUljmUy3fHX1hpXkwgB6IeAf6y3UfOe1Yixxrmyqb7
	0MPDC8cbgyPDfrB920senJbRwbdTqw1M+6NmeR7BZhluk9VUNxoKQASI
X-Gm-Gg: AY/fxX5g4uMmS9VrFkAI171WLrP+9hyKi6RBLus12/1yqKf2KkUj0AOWucZvzabJD/x
	eO4XIG37O6A8FWH+P8QqYG1CNKsiNLvOOH8eanOwO051gw9/c7ASwGGJZS9MrY52lMBkak8iNNU
	n60ORNakwxYc3F80YIunWEK569ruMzHt13xVh1ANeZlDeDD2wQFECCiSjXFjXRJLA6Dugsr48UO
	Hz8bDvq1wsyagRM4XZ8fvy+y5GTYzbsBOIFa5MhuEsvgAWNO9UkCaTnDVqdG6JcVt9Q0B4APQF4
	13btygpKgRldwryATkgdS/zNb7GY/lBj6/bUXmWVeTYBgleNedMtKKaagbuu92LpobVASi20Ini
	zEUMi4cbQq4xlLtzbjlGnyzvHGhuMM7ztPFrRj+uCX0SQScnglciwcnj2CrDRUKyI4x7bZjJ3hx
	qEUsozF+aP+sixgHQ16hU=
X-Google-Smtp-Source: AGHT+IGYRdEpECBqHBJfR3wJ5y9jJlkdT8kWACpnNRTlu0V4vK6d7wJxahfmcG1QE+eapNwLI97szw==
X-Received: by 2002:a05:7022:f904:b0:119:e56c:18a6 with SMTP id a92af1059eb24-11f34bc65bcmr13003744c88.14.1766067939535;
        Thu, 18 Dec 2025 06:25:39 -0800 (PST)
Received: from localhost ([2804:30c:165b:7000:d59:b973:da75:f845])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f5412esm8783938c88.6.2025.12.18.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:25:37 -0800 (PST)
Date: Thu, 18 Dec 2025 11:27:18 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/5] staging: iio: ad9832: clean up whitespace
Message-ID: <aUQPRsCbB-eXHSIx@debian-BULLSEYE-live-builder-AMD64>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
 <20251215190806.11003-2-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215190806.11003-2-tomasborquez13@gmail.com>

Hi Tomas,

LGTM.
One minor suggestion.

On 12/15, Tomas Borquez wrote:
> Remove unnecessary blank lines between comment sections to improve
> readability.
> 
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index e2ad3e5a7a..00813dab7c 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -26,7 +26,6 @@
>  #include "dds.h"
>  
>  /* Registers */
> -
>  #define AD9832_FREQ0LL		0x0
>  #define AD9832_FREQ0HL		0x1
>  #define AD9832_FREQ0LM		0x2
> @@ -50,7 +49,6 @@
>  #define AD9832_OUTPUT_EN	0x13

There is a blank line between AD9832_PHASE3H and AD9832_PHASE_SYM that could
also be removed, IMO.
 #define AD9832_PHASE3L		0xE
 #define AD9832_PHASE3H		0xF
-
 #define AD9832_PHASE_SYM	0x10
 #define AD9832_FREQ_SYM		0x11

>  
>  /* Command Control Bits */
> -
>  #define AD9832_CMD_PHA8BITSW	0x1
