Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED33B52FA
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031112; cv=none; b=S4+MJh8Dl6zcnhsj9ix8ruzIdm1+JaEYdve084lYSdpJ9IE5cVGSP9wmTEEEUb+/mMcATnUt7WDxspeBQUzd6e5PcJ3DLHigcWp8XNZuSD+umCCAxXZq6Fswgc4hIX2KuJkHixOU+q59ghFsBziRPmcPpx5W9lKdgCfl4ki/hew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031112; c=relaxed/simple;
	bh=HLV1+7c0cHhSGM6g/pJ/pb8a/UE+c2C9klvWkcA/owc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaVZ/A3NHbf3u7W4TFH2uagO/8JxepXltunAgUJ5+8ZKnmCdU8WU5/lXtDHiqaLV2ocMkTE2uyNm5JbVOkBcgZs1ZZ6ovXjQg4RDeCEnGkjj0Va0EYWCMc+pfvQVl26ihWU0nS5T2ZTFVtD295DG9+tjhrKf2L8vVcDGsDYc7YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUWzF3eY; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUWzF3eY"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-486fb14227cso21926475e9.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774031109; x=1774635909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7fimwUkTYqTrPnEDqmdbKzIAKs/1aN798frFHDBu8c=;
        b=fUWzF3eYerQIA8MGDorxaKxghSxB4bA+Kt6QF/70/tTQH9v0pSd7wvgDB7sFaW45ug
         ncArIGUnf7rsiNk9vL2rMP2SOthovvCXcoDMLDnhinfoQnVqEBSB6wqcQDhnhCHSwlC8
         GI4mOVhNM/Nz/3UGWZ9Gz7l6bzd2NXn666xId1jhf+zkeblfRSg8Wpl7kI9beM2N3Iqr
         RoLHPXchr4JuUmeY8skYSdYpYu9Icj8iItRD7WL+NZ/JD1sFvf2khDKAXYQrY+I1kFIG
         Jpms+eKcKq9GfGQn8lGUUQ/zJQ1b/yE+rSSffnnPFhAFS+gq73hJSp9u5zY7aApFLF+t
         AuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031109; x=1774635909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7fimwUkTYqTrPnEDqmdbKzIAKs/1aN798frFHDBu8c=;
        b=FAVE2fJKB4CWOf5dl9SvHKS/GAMGlJ3nUodwNMEhFH3AgAdOgAQ9qxIPdPsRdRj2y/
         CRzS8X9irDkduIDmAUb06MWoASsy1G6Q0c7kKyqTbZDX9KwSV6IewyjOOiXqUG4yazQz
         zdAn/xeapIcK6TYTTaZJi5a+38jC/VYBPkZHyKQD8OodG9MAgsluYa2vfKQWzRjEQUnV
         6dn+LW9bn0EtZTVYf6wRImHJRikXMapNnEZySTDuKkF0EvZOR+iT5QgwwPeSe3uZHWGT
         II8bpRrMH9fGwkYdtIwpH1nyZW6TPqHR8UjxOeNYCO7OOkAkWMXSGeMrgrH/MM73U6Yb
         Cb3g==
X-Forwarded-Encrypted: i=1; AJvYcCW2Au4kuXW/BfWy4f+4ofWx+yQdAEJ0qxekPZHzKLahwmQJioNbB00GLjLRUOqFvK+T5q11TqwBc9QXba/b@lists.linux.dev
X-Gm-Message-State: AOJu0YxLlvHXIOUT2Zg3CGoMpZaOKMb9+jvnVamgYET1wn1cePxf+2TG
	OgAN7xXauq5l6LnLJ2envu7E4QfabdUUDtcq4gp1JsbnYWZlAIWnbX1S
X-Gm-Gg: ATEYQzyX80BXr8HHXsej0ZUjV3DxZT8ZhqxHh4znikzptIELY1TdmnK265mXcrbpC6v
	sBYKtYFmNTrXVbocFcrF9pweQ6X+us9PWiW6BuXeyQ8fNjC5MzAvNSeS5rwIfes2IBZdRFF6CHH
	2pvDFwOASToYrAmHRM1LTXUgyqC4Zg+e4NEevjO6R7X075QhuIzDj6cH3iJsaxKHNbr9ZGCWubS
	G6Qe0UuKaMW4xSRZtmZGxdhoPSLoyKwzztSjE5ceMQVwnzkEWIf6yh4YZe71TdvOKVlE762xdlB
	mpbClfFhWXpND8+Hh82MC8RPFV9Qc0Ihxk28YavkeiOBs5NUzp9A9dkgHMXUIw1GpNykxXoFmdf
	BzRKCcCjE0MWpl4+QtLmg08ceI8bgaC6YlubZ2aPSql0+AW4/bn7oujjaaHrQW4eEFH9FKbd7GT
	oaWFy+nw4tNEwgRc49E34TfJEL
X-Received: by 2002:a05:600c:8508:b0:485:3b00:f92e with SMTP id 5b1f17b1804b1-486fedab7dbmr58265045e9.2.1774031108748;
        Fri, 20 Mar 2026 11:25:08 -0700 (PDT)
Received: from bera-arch ([46.155.28.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700524864sm24702115e9.5.2026.03.20.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:25:08 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Yeking@red54.com,
	b9788213@gmail.com,
	ethantidmore06@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	rayfraytech@gmail.com,
	straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: remove copy function
Date: Fri, 20 Mar 2026 21:24:38 +0300
Message-ID: <20260320182437.13948-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ab0E5Sp1rGCPrs-E@ashevche-desk.local>
References: <ab0E5Sp1rGCPrs-E@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Mar 2026 08:27:22 +0000, Andy Shevchenko wrote:
> > void PHY_SetTxPowerLimit( ... )
> >  {
> >  	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
> > -	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel;
> > -	s8 powerLimit = 0, prevPowerLimit, channelIndex;
> > +	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel, powerLimit;
> > +	s8 prevPowerLimit, channelIndex;
> > +	int ret;
> >  
> > -	GetU1ByteIntegerFromStringInDecimal((s8 *)Channel, &channel);
> > -	GetU1ByteIntegerFromStringInDecimal((s8 *)PowerLimit, &powerLimit);
> > +	ret = kstrtou8((const char *)Channel, 10, &channel);
> > +	if (ret)
> > +		return;
> > +
> > +	ret = kstrtou8((const char *)PowerLimit, 10, &powerLimit);
> > +	if (ret)
> > +		return;
> 
> This will change behaviour on the invalid data. Before it was just partially
> converted here and continue, now it breaks an execution. The commit message
> does not explain if it's safe to do or not (i.o.w. if there is a guarantee
> that in current state the input will be always in the correct form).

> Otherwise, you probably want to use one of simple_strtou*().

It only indirectly called from ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() with constant values.
Maybe we can convert this strings to ints so we don't need to do it at runtime.
We can also remove the wrapper odm_ConfigBB_TXPWR_LMT_8723B(). This should be a seperate
patch, right?

Thanks,
Bera
