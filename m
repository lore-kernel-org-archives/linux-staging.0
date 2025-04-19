Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6B3BBC9
	for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745077261; cv=none; b=CY+ZBoL6kupq2DPYxZe5IY+dE0jUUTLzvSQPikmu/Isqd/NgZYuKcCBl6FtjgHQ2d12ma1olSur0DdOZeha8quyCU7LrEkiTEdmRCFdMX3LSn7D3u4xYgo0UOliB0XjehxR4luxeiQegs8S3bhjx/InU4QxXBwp86RNgFOWka3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745077261; c=relaxed/simple;
	bh=ClRqyqgxMLLpFcx6qh/lm1yOPfxBYfbYfpqcbOlA2Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lylWG2m3Q9/wtWDWGJoKfpNNmETYWCg0xiHhm+yMEeHT8Eu0hAjwSe39l4YZ0kJuRybSxlZUwLkuQCCId5317hY/BdZd2T+3SVZ7un6qefhbhEaKMxRv5T53rgLRscIMq/RqM8alG2QhHjJ5eZV+521lq+I7Ix4njAbQKte7neo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZw7qVhU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZw7qVhU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227b828de00so28611245ad.1
        for <linux-staging@lists.linux.dev>; Sat, 19 Apr 2025 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745077259; x=1745682059; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dn9YmC5jj3loNIVPlHSXEKzB0SKqb9PRU18qmUPEZFQ=;
        b=NZw7qVhUIk3JgOlmAm90aFU7M5UfmQtbvjHlD1DVY86qo8aMcNGtY4IdsDI7kbMr1n
         iirBb06ttR6kFrV0FcxDh3Nfs0jz3qYhWlwFwI4TYDnmoCUrK3ufQFeRz9kMzvKTgHsn
         tb/T2F/aFXHqHJN//pM1+wdUfUxCNmQ7PehNyeuz0Vlja4qtmV1jJTujtjNQcXZTstiN
         sGnTvMo5biQUWIXeqzT3s8suuF7vEYaLJbnL+V1lWF8pvYORqgFLsJKzEX0BJqTvoF8O
         NuXvemKH1ykFx3umU39CfktYYcCHQnOpnoK1XiApsSyJtFzX5I8yb8nmrH3XahCZNte5
         b9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745077259; x=1745682059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn9YmC5jj3loNIVPlHSXEKzB0SKqb9PRU18qmUPEZFQ=;
        b=EUMpOIKIyaIki75XXDgIZFTUn6zDOvmpDi8zFa9qPyEfb8ybhpMBAtGJOBoa5y+QrB
         6zvOKW4Ufl7PIvA7fN2BINbevqHXOyOLxHeu7pAqrDCmy3heWazJyArfpMI9ujuKLnjw
         apq6PtJwA3f7wHNpCetyz6ELI7/FEkJ3UrAc4XjXXaIwR4pQT080yergPFAuLXZyS+XX
         BySYr40oQ7y2djmxGAWH7RHCVvakqfL0s4Lc4aVI910zfNBC3iC7Wfc+r5IZQde8C4qk
         M9cAvi6tVllTJDf3+Fb2atoawxe1+Xig8OOjBjkKVoVqI5/ba4ett0xEhp0QSzli/wYT
         bSRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU05RmC6al/azda369A/ehFDazQibnfOLg3sbu5sov3r3YMi9hGS7dxlX6GzI4Dm2ijFT7yksLIuEHvHlLL@lists.linux.dev
X-Gm-Message-State: AOJu0YxrKTjEOpCRZnVfY7LtmiABhAKSnCC3d0YsB9a/TCz363tSYhqV
	ZOL2w7RMBArRLg5l43zhe7MyTjr6vSWLNcW69790kzVYqZbADKvc
X-Gm-Gg: ASbGncuQRayqqiQr8nweBj3LV4/8JmZQlSlq1yzN2BntF297sokM5+rSHsIv64OEKbm
	rRS8inTGV5U9A/ctO0xI3C3dt+6K1K1xordTbL/IABEEgKsjoMPBEpsSqd+e654x17bVQ2goYGK
	X4BQRVQrnUHRSGpOP1PjSNicTx2tVFbyYoPBvS9Kzj4IzcA9bORVYdREd9dAKNQJ4WnBTKYXlGV
	Z7e3drqX1pPwz02jIJnT11Hdgf+B7Jl3/mhWvyExfwXWJLc77HsOd/Xxurp4vxmalHDOJxzjp8P
	igRQUlBL4Rd546rQTSnVuUKxdzH0ogR2MyvMPScy2fuDxtYl
X-Google-Smtp-Source: AGHT+IEWxIwIoF5MmQuLAZOIj8CNlNUAGZybSbGFdV3b5ddUwG0nulVS/wk6vS0WXNJWoD84WcF+iw==
X-Received: by 2002:a17:903:1a0d:b0:220:e156:63e0 with SMTP id d9443c01a7336-22c53566fe7mr76317705ad.8.1745077258807;
        Sat, 19 Apr 2025 08:40:58 -0700 (PDT)
Received: from localhost ([2804:30c:1646:2b00:fd36:404b:e47:81e9])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73dbfaacf48sm3550125b3a.148.2025.04.19.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 08:40:58 -0700 (PDT)
Date: Sat, 19 Apr 2025 12:42:09 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: ad5933: Correct settling cycles encoding per
 datasheet
Message-ID: <aAPEUUAHsG2CvFbr@debian-BULLSEYE-live-builder-AMD64>
References: <20250416142219.554938-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416142219.554938-1-gshahrouzi@gmail.com>

Hi Gabriel,

Probably a thing for a separate patch but, would it make code more readable if
use masks and bitfield to set register data?
See comments bellow.

Regards,
Marcelo

On 04/16, Gabriel Shahrouzi wrote:
> Implement the settling cycles encoding as specified in the AD5933
> datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> previous logic did not correctly translate the user-requested effective
> cycle count into the required 9-bit base + 2-bit multiplier format
> (D10..D0) for values exceeding 511.
> 
> Clamp the user input for out_altvoltage0_settling_cycles to the
> maximum effective value of 2044 cycles (511 * 4x multiplier).
> 
> Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  .../staging/iio/impedance-analyzer/ad5933.c   | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
> index d5544fc2fe989..5a8c5039bb159 100644
> --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> @@ -28,7 +28,7 @@
>  #define AD5933_REG_FREQ_START		0x82	/* R/W, 3 bytes */
>  #define AD5933_REG_FREQ_INC		0x85	/* R/W, 3 bytes */
>  #define AD5933_REG_INC_NUM		0x88	/* R/W, 2 bytes, 9 bit */
> -#define AD5933_REG_SETTLING_CYCLES	0x8A	/* R/W, 2 bytes */
> +#define AD5933_REG_SETTLING_CYCLES	0x8A	/* R/W, 2 bytes, 11+2 bit */
>  #define AD5933_REG_STATUS		0x8F	/* R, 1 byte */
>  #define AD5933_REG_TEMP_DATA		0x92	/* R, 2 bytes*/
>  #define AD5933_REG_REAL_DATA		0x94	/* R, 2 bytes*/
> @@ -71,6 +71,8 @@
>  #define AD5933_INT_OSC_FREQ_Hz		16776000
>  #define AD5933_MAX_OUTPUT_FREQ_Hz	100000
>  #define AD5933_MAX_RETRIES		100
> +#define AD5933_MAX_FREQ_POINTS		511
> +#define AD5933_MAX_SETTLING_CYCLES	2044 /* 511 * 4 */
>  
>  #define AD5933_OUT_RANGE		1
>  #define AD5933_OUT_RANGE_AVAIL		2
> @@ -82,6 +84,10 @@
>  #define AD5933_POLL_TIME_ms		10
>  #define AD5933_INIT_EXCITATION_TIME_ms	100
>  
> +/* Settling cycles multiplier bits D10, D9 */
> +#define AD5933_SETTLE_MUL_2X		BIT(9)
> +#define AD5933_SETTLE_MUL_4X		(BIT(9) | BIT(10))
In addition to making the above a mask as suggested by Jonathan, we could also
have a mask for the number of settling time cycles. E.g.
#define AD5933_SETTLING_TIME_CYCLES_MSK	GENMASK(8, 0)

Would also need to update defines to something like
#define AD5933_SETTLE_MUL_2X		0x1
#define AD5933_SETTLE_MUL_4X		0x3

masks and define names up to you.

> +
>  struct ad5933_state {
>  	struct i2c_client		*client;
>  	struct clk			*mclk;
> @@ -411,14 +417,15 @@ static ssize_t ad5933_store(struct device *dev,
>  		ret = ad5933_cmd(st, 0);
>  		break;
>  	case AD5933_OUT_SETTLING_CYCLES:
> -		val = clamp(val, (u16)0, (u16)0x7FF);
> +		val = clamp(val, (u16)0, (u16)AD5933_MAX_SETTLING_CYCLES);
>  		st->settling_cycles = val;
>  
> -		/* 2x, 4x handling, see datasheet */
> +		/* Encode value for register: D10..D0 */
> +		/* Datasheet Table 13: If cycles > 1022 -> val/4, set bits D10=1, D9=1 */
>  		if (val > 1022)
> -			val = (val >> 2) | (3 << 9);
> -		else if (val > 511)
> -			val = (val >> 1) | BIT(9);
> +			val = (val >> 2) | AD5933_SETTLE_MUL_4X;
then this would become something like

		reg_data &= ~AD5933_SETTLE_MUL_MSK;
		reg_data |= FIELD_PREP(AD5933_SETTLE_MUL_MSK, AD5933_SETTLE_MUL_4X);
		reg_data &= ~AD5933_SETTLING_TIME_CYCLES_MSK;
		reg_data |= FIELD_PREP(AD5933_SETTLING_TIME_CYCLES_MSK, val >> 2);
...

Though, I guess it would then be preferable to use masks and bitfield macros for
all other places where we handle register data in ad5933 driver. Probably
something for a different patch (if worth it).

> +		else if (val > 511) /* Datasheet: If cycles > 511 -> val/2, set bit D9=1 */
> +			val = (val >> 1) | AD5933_SETTLE_MUL_2X;
>  
