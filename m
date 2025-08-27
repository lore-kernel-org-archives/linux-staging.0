Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBAB303C9A
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 12:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756296996; cv=none; b=s5ded4cU2nvtNPlNw1NvNm7d2HN8zfAkiXroq2ulKuhO4d8ffyZisKPu/rtsZCML2YjNlIqUB9OuzTDh6+LubdPYa4D3+s4JzCgWA0+VjpgHT3Y9gYH1Qwr/2idwUMSvzR9I0U2BUG0PBDZK/ute99UCofRK4ruFxgHhslDTuJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756296996; c=relaxed/simple;
	bh=6afP3JGdSF5+WRW1WU+EjRrsvtZ+hFqZy+HPKDnl0OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp5TvuX1xl4y2iiEgfejcz7Ehma1qqwCTrAOWKbM34tYw9qZQ17LfCdH11PtgH4GdGDL3Svuk8ef+L0bEminOaITOzvj+PTQ7B5RL4POI9H1+GD61EvLHXNXgIRemvF42IMLpLbr9ABbFPgrOaFs3qqPVT3mOujdCcGB6BoEd9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C4q65O+l; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C4q65O+l"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3cbb0df3981so879154f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 05:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756296993; x=1756901793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CzWMrazf1iXoHpSc4zbm1dvGcCsF29470EBb0U9ecSk=;
        b=C4q65O+lH5CdOGqlF3ds13xktqzDGyDviwBtK9ztRhEHISV8tu+UiyUOF3hMfbRz42
         7yE4eM41vNKpUsgopn2EiLWkJA11vYX/bevzSMCV1I5QCugN/x1r6iGiFk0xCqKue+J/
         m1kqwCwyFd4xt5AW9gmIvv7BXqkkmjq9u4wIEINEgeS1ijNWZyFauJrvJdoBaLliBiZp
         H69Jofa8sctFCCGGzus+uue558OVcUYsh6qUPrW/EINTEB9vHCTTs7iJp6B5UN5klgz6
         5RV1GCkzPHxOZ+WBXw55S+SrlEJTMuixB2bbFpJruI4r8FQp16GxxdUXyzUJ6KP68tcZ
         NrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756296993; x=1756901793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzWMrazf1iXoHpSc4zbm1dvGcCsF29470EBb0U9ecSk=;
        b=dV9e2b4+RLuVEBRPAEnUawcR4eKz13w3x17Xeny8EjOj6beHDaxs+tHasUNhGfGVIA
         xJhHdrKdV9cSZQ4GwsxarMnnjLyQrhBOtTFAmHZxsSW/kz0947c/popujW+gB1WRBWyn
         oB95JlCp2UZ5q9fwfyxx/1wDzoMTKMz6iQ+mLrq4RROfZFW2OqPPV4p+Z8oaDjt2ujEx
         Iva9WkaZEH2kULr5ojf3E6XfT9pP5XLFwlYiLSX4U6O2tG4P6VYE6Jx9VVc1C6p4TTWN
         yPUfj7v6/9RR37wi2TVryy6BKnzWUEl/TA+L4ZcBa/XIvz7Bk8ZwKS/fjBp0OM3+x6mc
         IrPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUNcbkABey/gqaS63qDi12ybZW9xD1uDIM5Vtcb3reI5MsNJ21QifCJmvd6BI1Vu8Y25bnYM0KJSDdSgca@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm8MkpZ2+kNwhSLdg5VdnF9cvjMeK58ylW+xJ1MLHAs9yivPz+
	MqZOZ5ltq2yannR5Szs95rvERDDJMrt0FX5ofc+SOEFJAyzQrC0uN40Vq5LKAZHd+ck=
X-Gm-Gg: ASbGncs2uyLilYQd33Ki/3+yPZzwYPkj5qj7Af66clr2ElqRkuh0OVD1mRPrqW2s7Gn
	YTwcNF9NyoFT8/EoL7c9hFaAcVMvAaE3IzLDEUfBO0Loq69F5UG0H0DozvC7Ww1+Hrg2ID3wF02
	FASapEYhIF4m7Hf9IJZS6bInyyfc8d+0N8PnMXBxd6/5CAZN8VPes4cEQvLFSKT8ZZrW73/Q9C7
	T43w2NlADGbINOoOSyy3Ifwh97jDNAY2T2vmVc/e8v35zsfCCJ3qDRtj0pGVmQ9rIyZB2sYKt4u
	nESHLe5b6cQZRROsmvsaSr1mCYFJqMUHYREXVFli3kJqGm+oGPDyj5sD/rwbjUngPfp2hcU5USL
	JiDtqIKur9AvF7BNq9kc+gcGVlpI=
X-Google-Smtp-Source: AGHT+IGgg8De7RE7Ql6a6iRKfTa/K3diiP5L1gX09i5MplkQcx7MQCeB9Oarr+2CgGS8lKSCVWsfrQ==
X-Received: by 2002:a05:6000:2888:b0:3b7:9613:adef with SMTP id ffacd0b85a97d-3c5de347ce5mr12999054f8f.55.1756296992639;
        Wed, 27 Aug 2025 05:16:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c70ef566dcsm20200486f8f.24.2025.08.27.05.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:16:32 -0700 (PDT)
Date: Wed, 27 Aug 2025 15:16:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	matchstick@neverthere.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: gpib: simplify and fix get_data_lines
Message-ID: <aK73HPDKu6rqg9Ya@stanley.mountain>
References: <20250827113858.17265-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827113858.17265-1-osama.abdelkader@gmail.com>

On Wed, Aug 27, 2025 at 01:38:57PM +0200, Osama Abdelkader wrote:
> The function `get_data_lines()` in gpib_bitbang.c currently reads 8
> GPIO descriptors individually and combines them into a byte.
> This has two issues:
> 
>   * `gpiod_get_value()` returns an `int` which may be negative on
>     error. Assigning it directly into a `u8` may propagate unexpected
>     values. Masking ensures only the LSB is used.

This part isn't really true any more.

>   * The code is repetitive and harder to extend.
> 
> Fix this by introducing a local array of GPIO descriptors and looping
> over them, while masking the return value to its least significant bit.

There really isn't any need to mask now that we're checking for
negatives.

> 
> This reduces duplication, makes the code more maintainable, and avoids
> possible data corruption from negative `gpiod_get_value()` returns.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> Just print the gpio pin error and leave the bit as zero
> ---
>  drivers/staging/gpib/gpio/gpib_bitbang.c | 28 ++++++++++++++----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
> index 17884810fd69..f4ca59c007dd 100644
> --- a/drivers/staging/gpib/gpio/gpib_bitbang.c
> +++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
> @@ -1403,17 +1403,23 @@ static void set_data_lines(u8 byte)
>  
>  static u8 get_data_lines(void)
>  {
> -	u8 ret;
> -
> -	ret = gpiod_get_value(D01);
> -	ret |= gpiod_get_value(D02) << 1;
> -	ret |= gpiod_get_value(D03) << 2;
> -	ret |= gpiod_get_value(D04) << 3;
> -	ret |= gpiod_get_value(D05) << 4;
> -	ret |= gpiod_get_value(D06) << 5;
> -	ret |= gpiod_get_value(D07) << 6;
> -	ret |= gpiod_get_value(D08) << 7;
> -	return ~ret;
> +	struct gpio_desc *lines[8] = {
> +		D01, D02, D03, D04, D05, D06, D07, D08
> +	};
> +

Delete this blank line.

> +	u8 val = 0;
> +	int ret, i;
> +
> +	for (i = 0; i < 8; i++) {
> +		ret = gpiod_get_value(lines[i]);
> +		if (ret < 0) {
> +			pr_err("get GPIO pin %d error: %d\n", i, ret);
> +			continue;
> +		}
> +		val |= (ret & 1) << i;

Delete the mask.

(I wavered on whether I should comment on the nit picky things I've
said in this email, but in the end it was the out of date commit
message which pushed me over the edge.  I would have ignored the
other things otherwise).

regards,
dan carpenter


