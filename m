Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F220297E
	for <linux-staging@lists.linux.dev>; Sat, 15 Mar 2025 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050966; cv=none; b=mxmDN05b6B0J7ebzXxkVP/TaNyCmJ8b7h/ow1M1gdhxEmjDQvKb8EDD5j8OuGHDhy7Jx4zetXr2JuIhVIV0OXnFWrAOXBtmAqs5cvZeIRQblmi8QQ2FdSpPqZ9rH28Ofe8p3jnJATQKX53z4ZCMf+0X37HdWy69jo0n3G+RB9Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050966; c=relaxed/simple;
	bh=XqF3IeZzTFF40J3s4HW9OVwOhxZElMbeqnL/RHeXcqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4OLsWhcN/wW2DYGhMVnjTwdvPEoYh/kBSw2WfmIVXwn/dRxl3rR6Fn2za5Kwq+pFfwxEEE0Z1OpvNXPB/0lu35lF1/Yd/aEThouYu1MZYIdYR4Zb2WODR3PodrEL7cWj5TZGBcstxdN/SsvUpBmsHX149qv2324fFBd//XWkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grqRvOKD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grqRvOKD"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301493f461eso695286a91.3
        for <linux-staging@lists.linux.dev>; Sat, 15 Mar 2025 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742050964; x=1742655764; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d36rr9lbrju2jUirQ00gDiMRY8Q66JkPVxj4yJNU2u0=;
        b=grqRvOKDc27t/WMlT0BXBG8O+d3O7luvvdBAZIqT3zt+dbjgnww2Bvh03HRwkFQ4gF
         2YD7s0DKbzrJ6HGVuB90bu5A3TPecigzpdb0nKpniGyjeu17KRPXDBrv/glLwfFSGsvX
         s14lUXn0mllC9koltNbal0iGhodQIHT1fileuD4e9ByxgMaV5MydttJQGOcudiRhYxap
         oIlItGXe+0BPhP6IY4IzsqkEwFIr2FDhlWzLMvMnIP3JZEGQnsUrm83aHed7J+EoIMqz
         h+iGAEgwi/uvANlY0dNq26iTHHOQYQ8eB6/kyGbmnYBpqhSCqfiP5BhNhhsSFXKxvAoB
         VQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742050964; x=1742655764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d36rr9lbrju2jUirQ00gDiMRY8Q66JkPVxj4yJNU2u0=;
        b=baq0yLZBg9IwwjDTiDGTLXPtiGBdet+gdjpjEs1e2naCH5J0fVz0FBB6tLO3n5PxoU
         0k07X7b920+FF3//9It2iSRhnrnbfqZDkdpbmYR9rACcU1szX5yjI5dKUl/y9HsK4T8Z
         xBR+KUGJn1J2/IbJaGAl3pC7K6PDRE6VYeqRIYUaRsxnzmKw8cmlErX28RxCt7lApLTX
         P5A7nUz9Te08z3JyI76GdFYqKN4DouIbmuCUhQv7/4q7ZKrc1zWrGuzNCk4gswZ8yTTI
         +HEI+GqHoPwqZ8xKgmVtpKnGR1SS1StSGoh6HJ5NwIwduM+UOglrhw2c8w2+1oCfjYUn
         rlOg==
X-Forwarded-Encrypted: i=1; AJvYcCUxfUX85j7rmT4fCHoz2W1UavIyehQXOYZuWvEcUoV3yseJJ/cIfF3EjSVOKvXe7lsTwMINmBE0r1CzN+GJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxzRRnBLE4Ba2wQJOqxGfYjlrOUPQm1OZWfZRXbxe1fgHQWONxG
	uUkL/kMdlhiugLZB0yydgv4IBCHYwdPz6KqmmDZoDE5NTElh5tOE
X-Gm-Gg: ASbGncsXtUEgEISNwqodhgIqbgAiyACJdf9czoff91hjvwbrWDXwzXPORWE0WjpUq1a
	hUQxjum4KOmD0TDczCb92Sdic/KNMFLg73SKepZSI1VAoBCWSRbghtHDEd2OSn6W5PX2hdJKk3L
	98ah8OIIVmx3EXRk9hBFpMW6Jdcqk12JK9sWXOOom9Vx6xGdpeZaUOiqOUFc8uiTQz02H9Chfr5
	k1HD5xGtlXTrxBt6z1J7guBZ1tpJKw2SOlGvW772urAtkechhzD0Zrpsz7HQT/3JyFNHEInoh2e
	LuDLR1bp6UD5a5k3Y6NPDFGuQglYhZg+rygMeFPExKD8vwxR35CMsw==
X-Google-Smtp-Source: AGHT+IHvcEmAdvz4RKtwFUcK1Fgq2J0xP+4bcNXQJl3RwHxm388HFDW0oxHY+0N5ExqvwKIHv7yTkg==
X-Received: by 2002:a17:90b:2dcc:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-30151c7a2f4mr9616945a91.14.1742050964191;
        Sat, 15 Mar 2025 08:02:44 -0700 (PDT)
Received: from localhost ([2804:30c:b31:2d00:277c:5cbe:7f44:752b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-301539d3f4bsm2834921a91.5.2025.03.15.08.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:02:43 -0700 (PDT)
Date: Sat, 15 Mar 2025 12:03:40 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] iio: frequency: ad9832: Use FIELD_PREP macro to set bit
 fields
Message-ID: <Z9WWzMGdBga76zm9@debian-BULLSEYE-live-builder-AMD64>
References: <20250313195442.30264-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313195442.30264-1-simeddon@gmail.com>

Hi Siddharth,

Adding some comments inline. If what Jonathan suggested + what I suggest bellow
is still insufficient to avoid those lots of shifting to make up a write
command, then probably not worth it to change those as Jonathan said.

On 03/14, Siddharth Menon wrote:
> Refactor code to use the FIELD_PREP macro for setting bit fields
> instead of manual bit manipulation.
> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 39 ++++++++++++++------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 140ee4f9c137..bbde1f0e84ff 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -70,6 +70,9 @@
>  #define AD9832_FREQ_BITS	32
>  #define AD9832_PHASE_BITS	12
>  #define RES_MASK(bits)		((1 << (bits)) - 1)
> +#define DATA_MASK       0xFF
> +#define CMD_MASK        (0xF << CMD_SHIFT)
> +#define ADD_MASK        (0xF << ADD_SHIFT)

We could have masks for each part of the write command. For example,

#define CMD_MASK		GENMASK(15, 12)
#define ADD_MASK		GENMASK(11, 8)
#define DATA_MASK		GENMASK(7, 0)

>  
>  /**
>   * struct ad9832_state - driver instance specific data
> @@ -139,18 +142,18 @@ static int ad9832_write_frequency(struct ad9832_state *st,
>  
>  	regval = ad9832_calc_freqreg(clk_freq, fout);
>  
> -	st->freq_data[0] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
> -					(addr << ADD_SHIFT) |
> -					((regval >> 24) & 0xFF));
> -	st->freq_data[1] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
> -					((addr - 1) << ADD_SHIFT) |
> -					((regval >> 16) & 0xFF));
> -	st->freq_data[2] = cpu_to_be16((AD9832_CMD_FRE8BITSW << CMD_SHIFT) |
> -					((addr - 2) << ADD_SHIFT) |
> -					((regval >> 8) & 0xFF));
> -	st->freq_data[3] = cpu_to_be16((AD9832_CMD_FRE16BITSW << CMD_SHIFT) |
> -					((addr - 3) << ADD_SHIFT) |
> -					((regval >> 0) & 0xFF));
> +	st->freq_data[0] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE8BITSW) |
> +					FIELD_PREP(ADD_MASK, addr) |
> +					FIELD_PREP(DATA_MASK, (regval >> 24) & 0xFF));

Then we can use FIELD_PREP() in combination with the masks. Example,

	st->freq_data[0] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE8BITSW) |
			   	       FIELD_PREP(ADD_MASK, addr) |
			   	       FIELD_PREP(DATA_MASK, (regval >> 24));

> +	st->freq_data[1] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE16BITSW) |
> +					FIELD_PREP(ADD_MASK, (addr - 1)) |
> +					FIELD_PREP(DATA_MASK, (regval >> 16) & 0xFF));
> +	st->freq_data[2] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE8BITSW) |
> +					FIELD_PREP(ADD_MASK, (addr - 2)) |
> +					FIELD_PREP(DATA_MASK, (regval >> 8) & 0xFF));
> +	st->freq_data[3] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE16BITSW) |
> +					FIELD_PREP(ADD_MASK, (addr - 3)) |
> +					FIELD_PREP(DATA_MASK, (regval >> 0) & 0xFF));

If able to make regval an array as Jonathan suggested, the above may become
something like

for (i = 0; i < ARRAY_SIZE(st->freq_data); i++)
	st->freq_data[i] = cpu_to_be16(FIELD_PREP(CMD_MASK, AD9832_CMD_FRE8BITSW) |
			   	       FIELD_PREP(ADD_MASK, addr) |
			   	       FIELD_PREP(DATA_MASK, (regval[i])));

Note the command alternates between AD9832_CMD_FRE8BITSW and
AD9832_CMD_FRE16BITSW so maybe also put the command constants into an array or
use some ternary operation like i % 2 == 0 ? AD9832_CMD_FRE8BITSW : AD9832_CMD_FRE16BITS.
