Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0DD2EE268
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 09:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756719492; cv=none; b=ByVvVDee0lQGZlbPqUqZ1/BjUiSHl2xXhehBVLpnVhtHwPlURIBUDWE+u6o7sEu62excdMqmOgeZ6iMSOKOBjqdX0utAm3olCjo8IoYLtp97FLEiH4OqS+n+h91cC89jYz24oZh4plkYx7n7fGvFwuBmvCOTp1O0I2uaoBEDSPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756719492; c=relaxed/simple;
	bh=PoWmp6BTuJf52NGuYT9JTcAkjotRrjBMjDMhdQU+LDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrLTDZ6VpoTVvrPu+02XwVubJaduCxCYJ4k2ZSLPzTRuEMUb9HOThfkVzRlYPFpSbbNsuv28Ud9w788R2o31UFFsZA+Fn+JdHohsbKFyUsLixKPSG8oQofY8b/CF1PcQL9ChXqP9ZMHtTsUar4OFhHgVKcizEnT+kDYF0pOUU8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Unp2+TUq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Unp2+TUq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3d3fa21a77fso840665f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 02:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756719489; x=1757324289; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzu1kAbdXkRLJdQeBmyDCvvHq0+JzBfy9qWh/xcbHzY=;
        b=Unp2+TUqIS34sB3p1K1nE806Qu8PWQwxW5zKZGaGxclMtRENNE8wv7iXsyihfJfu7N
         XMrhMAlEARSd3Apzx4Vf0SY0TD0zSE+kJGyIZXXmK7ZJ7h287KpCd8g5zys30NqAQ0/a
         NOkDtxTsGUSi9ORQ+OgO0Ytx0l6LMRjmWXCYqceJKg/MH2+dR+7RX1vKZw9P0rbz3JdI
         9WgAkAOudoO/A6KSn8c1+KwzojuwEa14lh5Cvz758QP4FNGJnJBSOMnnleuBVmOt2F8B
         23C7FViRebMfZ6hqjC+HwA4HCTHcVEEyCyqAKpMwLMWd6GVhegqW2dfat1ddyXY1yToU
         m9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756719489; x=1757324289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzu1kAbdXkRLJdQeBmyDCvvHq0+JzBfy9qWh/xcbHzY=;
        b=vR9r0JYlPGV2bMDc5j/RKhbb36visW8y262Xe6I46tvmrSD+gbQkLjIy6+/iNyfLVe
         6v0CyM/lTX66GpOghmjPuQQ0uaXfFpSJMRDYCoMgFSpnDj1jzyur/HdmISYGDnlJjSqQ
         LuGgTT0pgxU78Ge+GHo8aU5/LEe4LPGWU4qt6TjYgtJjf1u4fFAssSzS1tdMh1pg2Wfs
         4vkQrWFEnZXUYkac5Rk+Ov04WSjAjtks7Rx0eWBj9aMPUFgVGzIknlhZNcYMPyx8zJ7f
         QTM2lx3dEr+f6BSDjN5PGtJH1LCF0nTNwnZLrsDPQK2zDD+k7pZDMU7TRuLsHfFYO/Ti
         pRkg==
X-Forwarded-Encrypted: i=1; AJvYcCV1PobkUFV3HDyrJ4gNxn878AcLRoQnKcaAHFExrm2axOWqgRIt2ftlOHqbRvXg9jz8BqQErwRK3NxRtRyM@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzj/NJrAsupdANNo2/QfEqiq6b+MCtJRXAfgcHCu7k2r+oG4EH
	D+WEswMzyaWD/3jdEyAu109g4H3DYMSGdatDydsy7EUT7MVxbt+cTF96
X-Gm-Gg: ASbGncs9HLTpTuM2w65rhYwuuvN+ZFCzqPkXzMKFfrfl3KIndAjuMeKKb7MhMtEI0XZ
	tX2G6rgOM3GMt3pkx9AegrWVjMAn8yA+xM0bcaLRk8ETAwPckF5OpuMVwh5xgjR9sJAgSKqZnN+
	BDzjN9i8YhfFkfDuQPBaPc0oFCXu4g7kaMJU+V0+OlwdDsAFWkWPMpFFbDe9nbou2NFJA1xFRT7
	Z8HIo3sPmVzr9mqNv+nz3D9U0Pxanbvcgvr0ys6e3HN51daJTHFn+rsY6cyutdUnATFtzX92fAc
	9IxZfkm0N4/cG378N6/TNs1aW6Bg12oEFnL7ZoXaJOqcOc5L4GK1s/8YnB4WVkRvxW42mLc6B7K
	VrsHK1P5HrJej+mV6R9cEUZqekblA40tp6YxZq602IJzwNhpu
X-Google-Smtp-Source: AGHT+IF2TZk7fxatgeUxLw/qv7wlqnSjQwQXJdLzdyRAIZVXdjblMD2gLpYR4LPKSoJ9LYijZ/AY7g==
X-Received: by 2002:a05:6000:1a8c:b0:3cd:96bb:b948 with SMTP id ffacd0b85a97d-3d1df15a131mr5335377f8f.47.1756719488910;
        Mon, 01 Sep 2025 02:38:08 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33add294sm15218970f8f.29.2025.09.01.02.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:38:07 -0700 (PDT)
Date: Mon, 1 Sep 2025 11:38:05 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, gregkh@linuxfoundation.org,
	matchstick@neverthere.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	marcello.carla@gmx.com
Subject: Re: [PATCH v2] staging: gpib: simplify and fix get_data_lines
Message-ID: <aLVpfRLyri4K_WFK@egonzo>
References: <20250827113858.17265-1-osama.abdelkader@gmail.com>
 <aK73HPDKu6rqg9Ya@stanley.mountain>
 <aK8SGpevZsGM5CCF@egonzo>
 <20ed561b-aba1-432c-9fdc-103e724852d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20ed561b-aba1-432c-9fdc-103e724852d9@gmail.com>

On Fri, Aug 29, 2025 at 04:34:05PM +0200, Osama Abdelkader wrote:
> 
> On 8/27/25 4:11 PM, Dave Penkler wrote:
> > On Wed, Aug 27, 2025 at 03:16:28PM +0300, Dan Carpenter wrote:
> >> On Wed, Aug 27, 2025 at 01:38:57PM +0200, Osama Abdelkader wrote:
> >>> The function `get_data_lines()` in gpib_bitbang.c currently reads 8
> >>> GPIO descriptors individually and combines them into a byte.
> >>> This has two issues:
> >>>
> >>>   * `gpiod_get_value()` returns an `int` which may be negative on
> >>>     error. Assigning it directly into a `u8` may propagate unexpected
> >>>     values. Masking ensures only the LSB is used.
> >> This part isn't really true any more.
> >>
> >>>   * The code is repetitive and harder to extend.
> >>>
> >>> Fix this by introducing a local array of GPIO descriptors and looping
> >>> over them, while masking the return value to its least significant bit.
> >> There really isn't any need to mask now that we're checking for
> >> negatives.
> >>
> >>> This reduces duplication, makes the code more maintainable, and avoids
> >>> possible data corruption from negative `gpiod_get_value()` returns.
> >>>
> >>> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> >>> ---
> >>> v2:
> >>> Just print the gpio pin error and leave the bit as zero
> >>> ---
> >>>  drivers/staging/gpib/gpio/gpib_bitbang.c | 28 ++++++++++++++----------
> >>>  1 file changed, 17 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
> >>> index 17884810fd69..f4ca59c007dd 100644
> >>> --- a/drivers/staging/gpib/gpio/gpib_bitbang.c
> >>> +++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
> >>> @@ -1403,17 +1403,23 @@ static void set_data_lines(u8 byte)
> >>>  
> >>>  static u8 get_data_lines(void)
> >>>  {
> >>> -	u8 ret;
> >>> -
> >>> -	ret = gpiod_get_value(D01);
> >>> -	ret |= gpiod_get_value(D02) << 1;
> >>> -	ret |= gpiod_get_value(D03) << 2;
> >>> -	ret |= gpiod_get_value(D04) << 3;
> >>> -	ret |= gpiod_get_value(D05) << 4;
> >>> -	ret |= gpiod_get_value(D06) << 5;
> >>> -	ret |= gpiod_get_value(D07) << 6;
> >>> -	ret |= gpiod_get_value(D08) << 7;
> >>> -	return ~ret;
> >>> +	struct gpio_desc *lines[8] = {
> >>> +		D01, D02, D03, D04, D05, D06, D07, D08
> >>> +	};
> >>> +
> >> Delete this blank line.
> >>
> >>> +	u8 val = 0;
> >>> +	int ret, i;
> >>> +
> >>> +	for (i = 0; i < 8; i++) {
> >>> +		ret = gpiod_get_value(lines[i]);
> >>> +		if (ret < 0) {
> >>> +			pr_err("get GPIO pin %d error: %d\n", i, ret);
> >>> +			continue;
> >>> +		}
> >>> +		val |= (ret & 1) << i;
> >> Delete the mask.
> >>
> >> (I wavered on whether I should comment on the nit picky things I've
> >> said in this email, but in the end it was the out of date commit
> >> message which pushed me over the edge.  I would have ignored the
> >> other things otherwise).
> >>
> >> regards,
> >> dan carpenter
> >>
> >>
> > This patch seems unnecessary.
> > The code will never be extended.
> 
> But using for loop is more readable than writing 8 similar lines, or?
> 
> > In the unlikely case of errors it will produce a huge streams of console spam.
> > It negatively impacts performance:  114209 bytes/sec vs 118274 bytes/sec.
> 
> We can remove that error message to not impact the performance, but storing errors even unlikely cases
> as gpio data is a bug, or?

Hi again,
Even with the following code, eliminating the error test, the
performance is still negatively impacted: 114865 vs 118274 bytes/sec.

static u8 get_data_lines(void)
{
  struct gpio_desc *lines[8] = {D01, D02, D03, D04, D05, D06, D07, D08}; 
  u8 val = 0;
  int i;

  for (i = 0; i < 8; i++)
             val |= gpiod_get_value(lines[i]) << i;
   return ~val;
}

Variable shifts are just slower than hardcoded shifts. Most of the
delay for GPIB reads and writes comes from the relatively long
interrupt latency on the pi's (> 2 usecs). There are 2 interrupts per
byte read. Even so the loop implementation causes a noticeable
degradation in performance which we want to avoid.

Regarding testing for error returns:
We won't get ENODEV since on the raspberry pi the gpios are
implemented on the SoC so cannot "disappear" once allocated.

In the case of a direction bug (which we don't have) the gpiod subsystem
will emit a warning.

Further it is not worth checking for error returns on the
gpiod_get/set_value calls with the bcma_gpio_get/set_value
implementations since the latter do not return negative values.



