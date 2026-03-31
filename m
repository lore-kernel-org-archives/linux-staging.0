Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70F3A9623
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954416; cv=none; b=ipm63BB2zBRDZsmbEsaDzMULSeTiulfW3x0SDKfacpb9dEVFnXTkcKglBN4nIpGvMLYF+E7ToP70gMmzVAwobLgDqvXzmGWYy9AYzIgYtmFsMZBvRSgaNzcJBNqf9yULHcbvkF1xfB67IiPtOKL8tICXjATo0MDZ96EObWmK3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954416; c=relaxed/simple;
	bh=1beTnN06koyNBSVTQfdbOfurajogUefCKLowuUktPxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOn6EDGkh3VXlg6Wr4/PgAwWRHy9syHKusfImdKu5p6Pb99yPo0pf84dqiLre9cz4lnQpFuPuW5kqsaFwpIdLjRxhWRMiOC7r75NS48n7XJcT0Xofb79t1k9W7MnpE2DT7B3ZfSuXNiNjKRjuzb231iA3XTpZsvWVYn0cq7pOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnUnCNPE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnUnCNPE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so1364713f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 03:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774954413; x=1775559213; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7jBCp0gY6pbDMjUAdx0JWqcLwsV/+HgtxuJ3aV5c+VY=;
        b=JnUnCNPEX7feX3lAl/YpFIxPSMMNHrfpzyo6ErP3nO76MHGr0U0Ty+dP8YavhxvxzC
         FMYhfaqUThHMRHlLQp7kx0M+e0MSDZZZZ/N89RxzfLa6fqqyOttlECICcwjLeX4LoCqn
         GpiFM4hIrs3yccbeMKGDz9XoO908Vtej9Ek1JLtaSjOsILpzLypr78GOqbHmFmBjF8sR
         W1AeSivbVyeKWB+jnBDUyNkHIh2/uRGM6dUZoxyd1YuufqLIhEp1Ei4Vezr7lf5WuzVj
         3l5zZG+Aklcied291+XFH2ctAzIyyh9FvE5jkgOMysm1WTmGLnW+p1+ljFBILnjzf9Z4
         fokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954413; x=1775559213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jBCp0gY6pbDMjUAdx0JWqcLwsV/+HgtxuJ3aV5c+VY=;
        b=lRvXany2lu8pkoZx88M3+rqrG4PojoWfJyAF0KGvnfMc8nbqn5cUEhSbV7fx/lZWf2
         aWmU0odOdSWGMYflV48KXnqo5BWCl85yjDH8TE8BmBcFARROWRqHY13+/04HCijah5d6
         Ny/5at4UZLZcPA/k1MmWhAQT2ZNQqFgij/eZ40s7uIPPT8R5R2iGd1DSjff9epcjvMc7
         HS7Gi81cbsZll3WaIbUYKab1V2/pqLX2NF9waefwE3NjJE5iN6SfRvOYps/fyn0NRd80
         sNw2zm+itW+rQO80D6DRSTg6fTItBWQbJf4++300oY6xEzFCeu/XUxx+GJniBwDNSS8f
         GvDg==
X-Forwarded-Encrypted: i=1; AJvYcCWycbxGnxqJn6S0LnJWkyJOGwcbAr69/nddv2eVcveih8gsRiJ2Gv/nTO+6dga2MxFxfAtky2O3Qvmuwugf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzih0qby3Fh4PNVrkErcGhdgFJZju7RMYkmqLkKRTsSSm2feAKa
	IQDR+ernp0JZ6EqN3/LXxAHMeqMf5V4PT7MqROGqMmzBrUmzuU9cJTEc
X-Gm-Gg: ATEYQzwqTwDOfHSKRpKn08iOnwdoqRJ9lwHu+gFplM7Xozzyhk4Y2M+QvSxdZOlYl0K
	xCSSF/G/bp1UOW10DVIeh6rHZQyF9M9lWAk/jaUNxLSug5nlwzZvdZ82/63+N+qbVLEnFn4u/xa
	ompGQeQMFqSuFhvCztXuMAvwqZCjBNHm6CesByPhVCzsPrPYBtmkdis/XNLXC6/NFkgWop79y/w
	sqPIYAOceRNOlZ+zzPoXu3zl6yWjQ9BnsY4u80SHJn7Z5kWjMNPl0e/9h4j6czhC0ZNz+gJYLc8
	dLsD+QTCw53ovUfKlx0hRCNUWPMbApnPmVk8k87I6g1QZ1TYjD8JzNUhEPVR6dh/413f66spejz
	HL3JlMtjjO/k0XouyKs4NmBHSDqIyJLvdS0eMdJS5lVWtamHRgmrDPj1ZwvK74Modp4w6npm2B6
	IZQwx1Z1uIXf0Np02PZ+xEGRbwtneSSQ==
X-Received: by 2002:a05:6000:18a9:b0:43d:29a:e42a with SMTP id ffacd0b85a97d-43d029ae49bmr9955894f8f.29.1774954412827;
        Tue, 31 Mar 2026 03:53:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm26444532f8f.29.2026.03.31.03.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:53:32 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:53:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] staging: iio: adc: ad7816: redefine mode
 constants to start from 0
Message-ID: <acunqXdKj7im8tH7@stanley.mountain>
References: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
 <20260330181710.23258-2-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330181710.23258-2-mdmahmudulhasan1511@gmail.com>

On Tue, Mar 31, 2026 at 12:17:07AM +0600, Md. Mahmudul Hasan Mabud wrote:
> Redefine AD7816_FULL and AD7816_PD constants to start from 0 instead
> of 1. This change is necessary to use these constants as direct
> indices for the mode string array and to align with standard
> indexing in modern sysfs helpers.
> 
> Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 172acf135..5acfceb90 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -22,8 +22,8 @@
>  /*
>   * AD7816 config masks
>   */
> -#define AD7816_FULL			0x1
> -#define AD7816_PD			0x2
> +#define AD7816_FULL			0
> +#define AD7816_PD			1

I don't love this.  AD7816_PD used to be related to the spec but now
it's just a random number which tricks you into thinking it has
meaning but it doesn't.

if (chip->mode == AD7816_PD) { /* operating mode 2 */

regards,
dan carpenter

