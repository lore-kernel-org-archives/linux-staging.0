Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C833B6D2
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072803; cv=none; b=ORgCEsudnUBohj92sswy8rqEEvkxGsuX9+8YzPYnu1FmHsBUNz41WUKmj8FdiKUZwRvenAzOK4LoiErlwtcmGVvZSLB7bAUfiPa54DBBpaAZdugw7bp+TXHEvxJMIoFokkAckA7OYTTnK5owFcYo45dVNb3hOCLQvwfnTMLQmo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072803; c=relaxed/simple;
	bh=ABS6WeCxCL8XmcbmIplxXpFY8pwjfQdhazzFikeqcR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2DsNaSIHKuVlrt++c20ZxzOdAWxw40xdDKj4rySBJoxGPJTxsFec69qjtGh/R9Edeix3Pb5GRwqy69gyKU24Byi82oWOGA9x5koEQ11fltKKLKA3dGS96AJ6FZ5I1c+1uVFmXoKtGR3YZLH6xZAw/oiHdnYjPe//dQ2cELTobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltoXZc9U; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltoXZc9U"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-11beb0a7bd6so2578540c88.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766072798; x=1766677598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2pY3Dj22eRFI6euLJuJo7wjRAoKSeAvX/5BXg+N1IlA=;
        b=ltoXZc9UXAR2HqxSrPTkCZS1++uaDlH3SyRQ35/xSvdGjbawf8khsYcwqutD0UeJgM
         lzLBdrqvfrA2fU71tHsb6LQ1o9rRjtLIjPhqR/X0cO8z/Msati/3sCuch97R3mQF5Fhm
         uy0OT3NDQ18k1LkSFbYs3pI1wFitIUeK/D28sQJL0pIu7DZiw46LP68IjX9qt06BXOBm
         kXbqpoASHfn3IKOYAxW+CGbtaJi5iri+6+h/UvrSnmTjYcbG9A6uyhUUyjSL8JDTPm4R
         TyK/oqlwMuMEH0R56vEvAqftoIY+BZ5XojuTaRoX0xlCTzxPSaPEiYIGkQ3NNZ32Kv6w
         riMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072798; x=1766677598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pY3Dj22eRFI6euLJuJo7wjRAoKSeAvX/5BXg+N1IlA=;
        b=gamg3X7S/NCR/NhsypHEiYmueS2sNU7rcDIYWg5u/iO5FZMU3jcNWsJKOiZYrmvSqM
         +dixKU4f5Yn1PkZgrCD2vnDfGL34Ti+sOoGqPQuZBZdi6QFBVvEic22/HMiAz7tRatc8
         cDIJXfqdIGS5D32z6BV3oTSyeKGSB/k8F+YKNwmiX1uDvVzPldR6Z8IKyEO7BfuK2yaH
         JRhHZPRZUHITKcCDEm+hwRX+xpBb5Htk188YvFgJqXO7F1KMQjCOYplTetTU6zvcAsWE
         JBK1chvjaX01bqkh8fPWG2rlark8LWxZpD37yy/3++DdMPnGULjRIwVTJ4FZvKZ5trsI
         g2zw==
X-Forwarded-Encrypted: i=1; AJvYcCV4QKugbWnlIbi34sFKFkoPcYnjz8dSboiWHg3CSxL0S2AlFJPZR19Z4mrgXOgYi5S/8QIsKrIMcwAJI1Xd@lists.linux.dev
X-Gm-Message-State: AOJu0YxjQYAn/UmmiQz1jPzdZX7bnIFFbb9fmDLsUSFtcRFJ7NeicFAL
	vTTTaI48EfmO+sqmqiu/m3iE0A6AhPRQWTBYdBw/Gkz7RirOw6rWO9Kh
X-Gm-Gg: AY/fxX7+wqbHP+epO7GDsW5URb47NiFkrgbpSs/Xhmf8LJVwLh7MPYlH2CSnvuajwcs
	J3r1YtLAehQR5XcSEvh7Tvfxv27pcrBATiQ9U+C/2S4PZQak7uMSvrncG3CnTk/0/XTPDp5cK5L
	0N/IPRvfxONgn7/Y4KeidkNDHgmBiEcVhJooJOklXtOkaLgtAjiTlIdSrEz1L7HusRVlIB6Yq83
	z2/Fa5EcCgEimO2+N9mncEe0WaW4+6yoyD5ZBWF9TveYL5UyU79pc8wY0NAaAH3valBatoOvLf+
	lG0krRUlMuLubesdAU1wMh5Ixjwl6yoVJXHJLc4B7aTGmKxNlKxLpAw4acn/Oa4SL11mjbL/fbo
	0q4VVBFry+KxE0pwofVXWQWcCiSHji2sOXX4+NRU3ywk7z+nDSL+Bfxjz8qjHi4lShas7yUcdWt
	n037Ix5q7/rHOQHtDFRZ+T2Wr4BMILAu/alaqLRtcZCXfoquFOyxD4htQLgTnh/Y06luJafdinX
	v8GyTDdSYU13xU9pvxjYMDFUSZetiNnyoFHGVRWMWVCbIADZiFe6N3K2Vq59jOQ4aCK
X-Google-Smtp-Source: AGHT+IHakG1mTeS/TpPra0zj9B9gXizYj4XxBwSdmKSjjmjy7IkFavN6SQhkCFG558NqSUEyBk3ZGQ==
X-Received: by 2002:a05:7022:4584:b0:11b:2a5:3b9b with SMTP id a92af1059eb24-12171a752b0mr81467c88.8.1766072798015;
        Thu, 18 Dec 2025 07:46:38 -0800 (PST)
Received: from localhost ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fc54b4sm8927625c88.10.2025.12.18.07.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:46:37 -0800 (PST)
Date: Thu, 18 Dec 2025 12:46:36 -0300
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/5] staging: iio: ad9832: convert to iio channels and
 ext_info attrs
Message-ID: <aUQh3KAvgm5_QIMO@Lewboski.localdomain>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
 <20251215190806.11003-5-tomasborquez13@gmail.com>
 <aUQYBdiYVy3sn0Nx@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUQYBdiYVy3sn0Nx@debian-BULLSEYE-live-builder-AMD64>

On Thu, Dec 18, 2025 at 12:04:37PM -0300, Marcelo Schmitt wrote:
> Hi Tomas,

...

> > Convert ad9832 from custom sysfs attributes to standard channel interface
> > using a single IIO_ALTCURRENT channel with ext_info attributes, as this
> > device is a current source DAC with one output, as well as removing the
> > dds.h header.
> > 
> > Changes:
> > - Add single iio_chan_spec with ext_info for frequency0/1 and phase0-3
> > - Phase attributes accept radians directly, driver converts internally
> > - Frequency attributes accept Hz (unchanged)
> > - Cache frequency and phase values in driver state for readback
> > - Remove dependency on dds.h macros
> I'm not sure, was the dds stuff being used before this patch? Maybe dds.h
> removal would be better as another separate clean up patch.

Yep it was used, dds.h contains some macros for creating the sysfs
attributes, I could make a separate patch which transforms the custom
macros to "native" ones.

> > - Rename symbol attributes to frequency_symbol and phase_symbol
> It's nice to have a change log between patch versions. Though, it's usually
> provided as part of extra patch info, not commit message.

You are right mb, I realized too late I'll add it next time under ---

...

> This patch fails to apply? I've tried getting it applied on top of current
> IIO testing branch with b4 shazam, git am <individual patches>, and
> git apply <patch4 on top of applied patch3>, but patch 4 fails to apply either way.
> Couldn't figure out how to fix that.

I think I made some weird change which makes it unappliable but I'll make
sure that does not happen next version.

...

> > +static ssize_t ad9832_write_phase(struct iio_dev *indio_dev,
> > +				  uintptr_t private,
> > +				  struct iio_chan_spec const *chan,
> > +				  const char *buf, size_t len)
> >  {
> > +	struct ad9832_state *st = iio_priv(indio_dev);
> >  	u8 phase_bytes[2];
> >  	u16 phase_cmd;
> > +	u32 phase_urad, phase;
> > +	int val, val2, ret;
> >  
> > -	if (phase >= BIT(AD9832_PHASE_BITS))
> > +	if (private >= ARRAY_SIZE(ad9832_phase_addr))
> >  		return -EINVAL;
> >  
> > +	ret = iio_str_to_fixpoint(buf, 100000, &val, &val2);
> Maybe I'm missing something but, why 100000 here? Should it be MICRO instead?

iio_str_to_fixpoint parses one more decimal digit than the fract_mult
suggests, passing 100000 gives 6 decimal digits (microradians precision).
Using MICRO here would parse 7 digits instead, as far as I understood.

> We can use macros to make it easier to read values that are related to metric units.

Agreed, I'll use MICRO for the multiplication and division/modulo operations.

...

> Best regards,
> Marcelo

Agree on the rest of the feedback, thanks for the comments from these and
previous patches

Tomas
