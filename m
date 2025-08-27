Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EED2820C6
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303905; cv=none; b=SYofTLRad299FYZ+f6jbahOeuKmQYAYAHvgxqjmRoUmlapA1E6apVpM1qZIJjJ+Rw53EfnpbyEGD7P/qsMEcX0Od1PurIPdgWXZ1tqub4lwpa5Bt+GkYBR38yataSvnwEV3Qre35Se/yw9DD+PTsiA5ymhVd5e9E0B5Lc8klx0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303905; c=relaxed/simple;
	bh=EDozGPUpvYJuuXzm7nob+gG7cbwaHnhY+kQ5YXHli5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sD7d7QIJIKonTsEIeXDS0XBcBWKnm7kB6n0IIAsXZPrmsiH5TRX1sDtfmUxOg6nNFlfcsv02v879WyAOSM7lHi45p4mkTeTci8m+us/khv+4qr+dB/7AyKu6Bhi/TdKO0CkFuGk7AXD6zUDSibjuqAM+v5kyPLYvH15yCDnZj4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diS0Tv93; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diS0Tv93"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b55ed86b9so27310975e9.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756303901; x=1756908701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EMePyw9O5KE5+I+55ZDooMs3QSwvO9W807m9fzQ8hRU=;
        b=diS0Tv93k8H7T6gxl3oy6e9dWJHsrT2JgUfA/cOaOJeBwVp9tsmNezdWgw1RU/VgwO
         wSH2kzbB+Jb5+HG5eUpDgemXDmjW65xLk4MHT81ixNCc7XsYkjEFDrJwD2osTooSVS1S
         KEik5Fw2enm+8mwlnpjWRAQDh2jcC2QLm7cVO/ymKrARKTyA0vqogVE/TnNO4jHRA2aI
         Vmj3RBp7f8c42ZzCb1F6+pYCo3e/2AHoAFNtId7/JyQ6dLlPy+o3mu8nTp8JHG9kkjt5
         k08TpvbZvzYDtayUUwfDQfK05ZRG5Wb2T1hAZi8Kkc/asx5VpxcGa6CwgOXXXxHhzDxZ
         DvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303901; x=1756908701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMePyw9O5KE5+I+55ZDooMs3QSwvO9W807m9fzQ8hRU=;
        b=HcAdJztVjN8PnQWkdCVRax0o+JeieOZMlcVd1y7c7EIuQnto4rPe5EAheCCAQEw5dn
         A9qFkCtPcr+tW84WXpAOLU/5PtnM+G7PNsEkWJ/2lxiR6DwcwUv25eRdXhq1S9Oe32oE
         Q0T6tZJTGcoOV9vD4oGuhCZfUt2J4ZrcLpbnY7jCR8AjYOfMSJMlHlo+u5pLC2dhrMzq
         ez2ZiZyOJDDpgk9c8eOMcevzEpaifM5fHvUtKWSPPwheYRwIb+XIKqWii5ZmE73vIUuo
         ypu1lrU5oenKD7NTxSEDpBCTR5IvpbcZwGhaxLDm4U8huS+Is2Kq8wFLIkhJopxSjmn3
         V4CA==
X-Forwarded-Encrypted: i=1; AJvYcCWKG5I07CzqAx6D+IWEaebZ/jIdjVYn8z46OpcGB3h0KoWKsX898xa5SxHXXpfF1cJPsz7l0yV8fS2MO5A/@lists.linux.dev
X-Gm-Message-State: AOJu0YwXwgMv8qlV2M9lnkav8MteDJIuuZco7+uCzozrN2tTt0IJmnFz
	v3Mmry2Lwnue1zWr3oAu+pAnA7pRwS8xkSenYIKqwnW9kdV8/I9DKpYu
X-Gm-Gg: ASbGncttGYCbT/HNz7nzKW6xg93Q4GeZt6u8CPzAK2zhoWfJS11whKKhbrNwrcw0NPt
	ARGfujbZfv8tb7JcyCeczK2bdd4hSSv/Y7P5BtUdREkhxJwLTqeRs6B4Akkp7zlVTOykjWzmelZ
	IEgQ5bxuDS0A5UWSiR0FM1pIXsPrlp3VQF1uZSCp9yMLWfPBr+B7Xs3eSMBASC5KFZMCSG0/eF5
	C9iDHm5ZzDQiFQ7nLZByirsos/+DBpmPx2IWtyM7V8oZfuTvSqtN2mZN9vURUpAqNoB3Xkp0PDD
	esJvr9+H+wTGDVQFanDeO+c9N37rQMDBG9gI4n7UnkxidKP3RjfsqSh//kI33rNY8qxr7WufA0V
	DybomWC8dO/Vf6unExYE5i9maHQLpKy8DPdYT6g==
X-Google-Smtp-Source: AGHT+IGssWzQE1qRhw2A96ZDXU9OUN21LRVg5+1RgRu9peV7czo27sICi7ARZbII5U0WPBJJyI0/+w==
X-Received: by 2002:a05:600c:3544:b0:459:d709:e59f with SMTP id 5b1f17b1804b1-45b5173f9d3mr156334235e9.0.1756303901246;
        Wed, 27 Aug 2025 07:11:41 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0f320esm32693575e9.16.2025.08.27.07.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 07:11:40 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:11:38 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	gregkh@linuxfoundation.org, matchstick@neverthere.org,
	arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, marcello.carla@gmx.com
Subject: Re: [PATCH v2] staging: gpib: simplify and fix get_data_lines
Message-ID: <aK8SGpevZsGM5CCF@egonzo>
References: <20250827113858.17265-1-osama.abdelkader@gmail.com>
 <aK73HPDKu6rqg9Ya@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK73HPDKu6rqg9Ya@stanley.mountain>

On Wed, Aug 27, 2025 at 03:16:28PM +0300, Dan Carpenter wrote:
> On Wed, Aug 27, 2025 at 01:38:57PM +0200, Osama Abdelkader wrote:
> > The function `get_data_lines()` in gpib_bitbang.c currently reads 8
> > GPIO descriptors individually and combines them into a byte.
> > This has two issues:
> > 
> >   * `gpiod_get_value()` returns an `int` which may be negative on
> >     error. Assigning it directly into a `u8` may propagate unexpected
> >     values. Masking ensures only the LSB is used.
> 
> This part isn't really true any more.
> 
> >   * The code is repetitive and harder to extend.
> > 
> > Fix this by introducing a local array of GPIO descriptors and looping
> > over them, while masking the return value to its least significant bit.
> 
> There really isn't any need to mask now that we're checking for
> negatives.
> 
> > 
> > This reduces duplication, makes the code more maintainable, and avoids
> > possible data corruption from negative `gpiod_get_value()` returns.
> > 
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> > v2:
> > Just print the gpio pin error and leave the bit as zero
> > ---
> >  drivers/staging/gpib/gpio/gpib_bitbang.c | 28 ++++++++++++++----------
> >  1 file changed, 17 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
> > index 17884810fd69..f4ca59c007dd 100644
> > --- a/drivers/staging/gpib/gpio/gpib_bitbang.c
> > +++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
> > @@ -1403,17 +1403,23 @@ static void set_data_lines(u8 byte)
> >  
> >  static u8 get_data_lines(void)
> >  {
> > -	u8 ret;
> > -
> > -	ret = gpiod_get_value(D01);
> > -	ret |= gpiod_get_value(D02) << 1;
> > -	ret |= gpiod_get_value(D03) << 2;
> > -	ret |= gpiod_get_value(D04) << 3;
> > -	ret |= gpiod_get_value(D05) << 4;
> > -	ret |= gpiod_get_value(D06) << 5;
> > -	ret |= gpiod_get_value(D07) << 6;
> > -	ret |= gpiod_get_value(D08) << 7;
> > -	return ~ret;
> > +	struct gpio_desc *lines[8] = {
> > +		D01, D02, D03, D04, D05, D06, D07, D08
> > +	};
> > +
> 
> Delete this blank line.
> 
> > +	u8 val = 0;
> > +	int ret, i;
> > +
> > +	for (i = 0; i < 8; i++) {
> > +		ret = gpiod_get_value(lines[i]);
> > +		if (ret < 0) {
> > +			pr_err("get GPIO pin %d error: %d\n", i, ret);
> > +			continue;
> > +		}
> > +		val |= (ret & 1) << i;
> 
> Delete the mask.
> 
> (I wavered on whether I should comment on the nit picky things I've
> said in this email, but in the end it was the out of date commit
> message which pushed me over the edge.  I would have ignored the
> other things otherwise).
> 
> regards,
> dan carpenter
> 
> 
This patch seems unnecessary.
The code will never be extended.
In the unlikely case of errors it will produce a huge streams of console spam.
It negatively impacts performance:  114209 bytes/sec vs 118274 bytes/sec.
regards,
-Dave
