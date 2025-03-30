Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95782B2DA
	for <linux-staging@lists.linux.dev>; Sun, 30 Mar 2025 15:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743349431; cv=none; b=QT9b6Jz6kVEiWgD3Fe3PrrkkEUAJBlmpLUsNtAJyS68HKJ8xnIyL7GsJde2NcY5jdExBzPLtPZFFVc0mfYFoXt9/32GwC759n8+1kp9tPfECmMfWaqa0trNtyuvPfQaxWfKrrfx8sNxY1w1YLdFGf7+/3qM0Pr7zJ3aPqnQvcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743349431; c=relaxed/simple;
	bh=DY/QoIgUcxlYWKWErAMultP4tK424psP9SLBssFPk1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n81+D6VN9MG02S2gtpsYYNLM6jG4xajvCHml0DTZbzrSovZibewiRzPZFTi1GmILI31+YiqbxPjnqE4RIn/ULYhafQKgJd4YoAg0kQYeePTNAI8jIrPxx3aa3W8E2+Ue4jbh8iaqfzRTdiZiI3KNiG+U4kNuxNuyR5dnjVLxj8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE4OxGDp; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE4OxGDp"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3031354f134so4838828a91.3
        for <linux-staging@lists.linux.dev>; Sun, 30 Mar 2025 08:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743349429; x=1743954229; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYhteagEyzg+N5CaIO1iHsEXBTHsWVMkEKuAyOQorjA=;
        b=UE4OxGDpOHRN+rMLBXJwUJPuZ1A0xAld2tWYZwc7G79nR9MjKig2YxOtRv0Qx/ylWM
         xUhZdmdo52SHpyiM0XnJoVsx8Bj2u2nn+uFTGs2s9pYMgrAPkqi9LsMoA44R+ntXGOH0
         1zW25gLJTNch7KZZ3QZJyK5Bdj6WZOn61AezhrkOH8UoJHAUY23CCSUMuHQNZy6O0j7b
         STPxn1bL00LXMb1mC+ktCFlzVQqmypX3bAjPfRWfvGQHg9eD/xTdxnhHbk1vVNIa+kDP
         Jy2W8VpTBNZG2wCTQZ/PFwVgYOfsduqZBwIsjgWo+hzrb8vCSpr9JGATpmFNtUJ7aczR
         pQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743349429; x=1743954229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYhteagEyzg+N5CaIO1iHsEXBTHsWVMkEKuAyOQorjA=;
        b=wGJwZ4dzr3vY4PCuLskl2J5PN2kC+eiwUS4t0MPD/44TZR4pEDPp1nUjr9dsEyMukh
         YQUd2coQ1kUmjIoapUj/g5iHgmWSR014G0UUWFusmO0E7/iwyBvJRUpLuuFsatEpTQv5
         SGVYgT6AlNpneHTkSMcPW/GKPrCrLOcxIEYVgZip8hTIlv0wJIHdnVUBLAJ28JJ107Zf
         XgKokmZ6QplGWFBBhgCVASkIKkwvlBjq5gp9hwaQPCBbY7XGBscRfkaGHrifVCOjZOfl
         wDKCpo373T9XGWKVVBJtNLHKtZWSvc+dTwc/K3hFkBi2Hm1iLZ8fMvPuPaCJWUme0Lr8
         CouQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRmUZKQ5N9mpsTH15DncniIp3xAn9Ut+tVhoRJnKtgNz+bp6A8FIuQfZ+o3gkqgwdFmPnwp34SPYC9TP2A@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+aU9Fytt+JGH1YUQMjhKWlgIb71JFZRvtkMzvo+bgrf7xRCqW
	VA4agSgNrwco1owWhwy+cTxj4yAX4MnNOv1dUvNEc/qZJa7Tqjmf
X-Gm-Gg: ASbGnctGtlFA/RtMmYr3amGMUPOY3Lkb3+OjosxVVzQCbxiWRUkOAVUKDQgaKY+ilXI
	xX6OqXLyRtkNqTzFKeBNjQAQOUuBCnrYmGqJVZH5UU5Q85ieDZyiWO0JXpIdf1/jm81JwDpUGu2
	rINHqJqKONydEQCg+/+hENdvyutImf8xDS85Nb8Hsu2fuxdKKDa7wKdyJ1rgdGlO/n0Yx7HZ4ol
	oOWtJXtyBaqs9g2tA3hcxnCD7ZFOVlB+4YXEuWRUU8Mc0eI4MVyH0JlEyDG34FmyCvZkaT7wgc9
	eRkMPrrEWQb+bvgKym+WmGP5jRt1dvDij6ASIljwqDFmMuW7FVsz6WWUxe2mwMwW
X-Google-Smtp-Source: AGHT+IFQ1NR4OoxulZ7bvgn4OOzRV3N3uO6d2kuqzhU72/7pKS2qxDZ/gPmXAxdv5zgchB26Xkyk0A==
X-Received: by 2002:a17:90b:2e88:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-305320afbbfmr9008735a91.19.1743349428908;
        Sun, 30 Mar 2025 08:43:48 -0700 (PDT)
Received: from localhost ([2804:30c:b03:ee00:e0b8:a8b8:44aa:8d0b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30516d62964sm5567734a91.26.2025.03.30.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 08:43:47 -0700 (PDT)
Date: Sun, 30 Mar 2025 12:44:50 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	jic23@kernel.org, Michael.Hennerich@analog.com, lars@metafoo.de
Subject: Re: [PATCH v5] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z-lm8l1ILFuJE5YS@debian-BULLSEYE-live-builder-AMD64>
References: <20250330135402.105418-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330135402.105418-1-simeddon@gmail.com>

Hi Siddharth,

Some suggestions in addition to what Jonathan has provided in his review.

On 03/30, Siddharth Menon wrote:
> Use bitfield and bitmask macros to clearly specify AD9832 SPI
> command fields to make register write code more readable.
> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  v1->v2:
>  - remove CMD_SHIFT and ADD_SHIFT
>  - use GENMASK
>  - store regval in an array and iterate through it
>  v2->v3:
>  - add missing header
>  - refactor code in the previously introduced loops
>  v3->v4:
>  - update commit message with a better one
>  - convert AD9832_PHASE and RES_MASK to masks
>  - cleanup a few if else blocks
>  v4->v5
>  - remove unnecessary inversion (val ? 0 : 1) used
>    with AD9832_PHASE_MASK introduced in v4
>  - use ARRAY_SIZE instead of fixed integers
>  - use reverse xmas tree order
>  - align mask macros
>  drivers/staging/iio/frequency/ad9832.c | 85 +++++++++++++-------------
>  1 file changed, 44 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 140ee4f9c137..e74d085fb4f2 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -16,6 +16,9 @@
>  #include <linux/slab.h>
>  #include <linux/spi/spi.h>
>  #include <linux/sysfs.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/unaligned.h>
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -59,17 +62,18 @@
>  #define AD9832_CMD_SLEEPRESCLR	0xC
>  
>  #define AD9832_FREQ		BIT(11)
> -#define AD9832_PHASE(x)		(((x) & 3) << 9)
> +#define AD9832_PHASE_MASK	GENMASK(10, 9)
>  #define AD9832_SYNC		BIT(13)
>  #define AD9832_SELSRC		BIT(12)
>  #define AD9832_SLEEP		BIT(13)
>  #define AD9832_RESET		BIT(12)
>  #define AD9832_CLR		BIT(11)
> -#define CMD_SHIFT		12
> -#define ADD_SHIFT		8
>  #define AD9832_FREQ_BITS	32
>  #define AD9832_PHASE_BITS	12
> -#define RES_MASK(bits)		((1 << (bits)) - 1)
> +#define RES_MASK(bits)		GENMASK((bits) - 1, 0)
I also don't see RES_MASK being used by ad9832 so just drop it.

> +#define AD9832_CMD_MSK		GENMASK(15, 12)
> +#define AD9832_ADD_MSK		GENMASK(11, 8)
> +#define AD9832_DAT_MSK		GENMASK(7, 0)
>  
...
>  	case AD9832_FREQ_SYM:
> -		if (val == 1) {
> -			st->ctrl_fp |= AD9832_FREQ;
> -		} else if (val == 0) {
> +		if (val == 1 || val == 0) {
>  			st->ctrl_fp &= ~AD9832_FREQ;
> +			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 0 : 1);
The previous implementation would set ctrl_fp if val == 1 and unset it if val == 0.
This patch seems to be doing the reverse (setting ctrl_fp if val == 0, and
unsetting it if val != 0). Was the previous implementation potentially buggy?
If not, I think we can just do

		st->ctrl_fp &= ~AD9832_FREQ;
		st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, !!val);

>  		} else {
>  			ret = -EINVAL;
>  			break;
>  		}
and drop the error path. Slight change in interface but guess no problem with that.

> -		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
>  					st->ctrl_fp);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> @@ -224,21 +230,18 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  			break;
>  		}
>  
> -		st->ctrl_fp &= ~AD9832_PHASE(3);
> -		st->ctrl_fp |= AD9832_PHASE(val);
> +		st->ctrl_fp &= ~FIELD_PREP(AD9832_PHASE_MASK, 3);
> +		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);

This seems to be a typical modify use case as exemplified in
include/linux/bitfield.h. So,

		st->ctrl_fp &= ~AD9832_PHASE_MASK;
		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);

>  
> -		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
>  					st->ctrl_fp);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
>  	case AD9832_OUTPUT_EN:
> -		if (val)
> -			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
> -					AD9832_CLR);
> -		else
> -			st->ctrl_src |= AD9832_RESET;
> +		st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
> +		st->ctrl_src |= FIELD_PREP(AD9832_RESET, val ? 0 : 1);
Hmm, this is modifying behavior. AD9832_SLEEP and AD9832_CLR were only being
modified if something other than 0 was written to output enable sysfs file.
Is the patch code mode appropriate than how the driver was before?

>  
> -		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
>  					st->ctrl_src);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;

Regards,
Marcelo
