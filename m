Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5A3FB3B
	for <linux-staging@lists.linux.dev>; Fri,  7 Mar 2025 03:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741318300; cv=none; b=QJYT/p+pmO+BdarbUC35tr2kpN4p8Cs5UD606oXL7JVsCM2qVSi6YJHYiDGFJiTlrqlnjKjpcRJBS2HGeZQkiAkhQhVXk5W81mRcA4doD4Gi3pNrhDyzM3Oh3QpMuJ+X923znna++WbEN+tbO1Wtq2YA2b/dfNMWPZPuvAQVpRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741318300; c=relaxed/simple;
	bh=gCOOcyBomA8ym/MPB9dZ8uybUtzLM0QMJZ7UNpi5h38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmBdQ522RlKwI8kJ78m/lGOgFhUwBQ0LFiLTy8Wq1NivnA4WbqLI7l+/J6MskBjRGIO7E2SwzP48asC0DJMpBHC5OYqjzUKjO9VklXqLXm1agfYTvI4te0RiPco1SZsXbxAJh7GzLZrKqgniUaEpZvLWpDAwlFDAisJt2ifOgbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiCozPTW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiCozPTW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fd89d036so27756495ad.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Mar 2025 19:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741318298; x=1741923098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=POmXH3RB5AOdcM4iy/V5RM3jxDeeDKhoQuC/nTf0CE8=;
        b=PiCozPTWy+IPdfC84+RTN9/aV1bDJK4+n4pIi0BY5OLyAk/2chKveY4fphUEDFoh5J
         mRiq0/g5CPUlIK0icFZQNoOGIg7A54mFP5nbyFZU8051tWF2gu97M6P/+qCRSnUunv2Y
         NGJFT3XXD17sDaShiLXlSlrugbRe5uA4kSGl/7SzFtE84sn+PDN4b3BnPW9WNtmwzcb7
         7mkprEEnswPJPMOonWYr6O1R/57Qx5YtwH3RxDMhw63oc91fj6w8QXMszcOqhBjO7rfE
         Nh/cz21R4rt7N9zQYZ5G+gvLKWCbk1cSaopieNFFxpS0g+TklnmlIb1VCXLL0lpL99Ie
         VVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741318298; x=1741923098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POmXH3RB5AOdcM4iy/V5RM3jxDeeDKhoQuC/nTf0CE8=;
        b=C9CGlNKatZ9MuC8gxt0Nt0HwM/QDhvl9kHrbSxFeQTi5wN/KoGiIkXBG06hE4ytCCv
         Ve4F/jEWL2VHPv++oUOTwkRG1GfN5bT1HuivByed1VwfPVjiEfCE8CVA9iAyeLDYfNmk
         OUK4DoD8OdldBZNhPZ3e7hSW0w11OVbXowib28iyiDAjQ5NTJDUJLdEgPLxtHZPVQ8B5
         xIiKxBvWokbPny2lzClxSs+O9tHgYnXtYahMKq7RN1xWnEknb/KGg+qQ0m8LL+aD1K3h
         tLl7Kx1sgQpJby8sKMzY2YUhYOED2gcnah3HYAhycaCdagyzR0siqa7DS7EmQDvhTxfP
         Qh9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpOT/7ncVchRe6d86bKtojBSNloP8Ite24KIV03uvgpkNtrImOMncz1AWAp7hBTj/heEBp41s7KpUaiN/Z@lists.linux.dev
X-Gm-Message-State: AOJu0YxsDNEipoFuIVjrnWYb8WoRm3k1FtYhtYHuJw7H5vZKPYfdgEiQ
	dL+Cw2hXKoRGdYhxnHgQUpWxWpM0KLXXHWHWTOjrbcxWhtcBVk++
X-Gm-Gg: ASbGncs3t57ktcNjk7SjJc4myxHkehTTGUjxTdxKghmj4fXqvpbIlvAa6KUO4V9e6lt
	/gHuGBv2o9ujr4kIqjN2iuWSaqi9wmVfBBKsKJouVMw9wHaTODKTfT7xWhtwjZy75t76WiXL9mv
	WUp65F3MJvrMIL/yJmcMDhKyMMpib/fPALCzWzKjn84XZsHhm5L+dDXIrVk8D85E3pjp6xkHjWn
	zNCR0HrHmLB7ACzAQOQBxP0bAEZYixRaE+kJXoeM9gUQhDZpgYcayW5wfd+YzaC9heitd2uYN4d
	axuxBNzpmB8xFrt3FcLDDp0GhBUBAEKi11+j29a4q3cCY5BkgE1QBXw=
X-Google-Smtp-Source: AGHT+IGkebL+fF1LPcEVxoOTh8Md9lfPjHNCFJiq4bU7ai9wRrrBoKSjgRruULMi73fEeTWoN6quYQ==
X-Received: by 2002:a17:902:e5d2:b0:224:160d:3f5b with SMTP id d9443c01a7336-22428c1169cmr29142615ad.49.1741318298523;
        Thu, 06 Mar 2025 19:31:38 -0800 (PST)
Received: from localhost ([2804:30c:1f21:4300:1cf6:c485:6555:b1c5])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-224109fee78sm20022575ad.105.2025.03.06.19.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 19:31:37 -0800 (PST)
Date: Fri, 7 Mar 2025 00:32:30 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Saalim Quadri <danascape@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [RFC]: Getting ADIS16203 out of staging
Message-ID: <Z8pozuvS1a3sa039@debian-BULLSEYE-live-builder-AMD64>
References: <20250306002645.1555569-1-danascape@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306002645.1555569-1-danascape@gmail.com>

Hi Saalim,

On 03/06, Saalim Quadri wrote:
> ADIS16203 and ADIS16201 are very similar in functionality whilst the
> major difference between the accuracy in ADIS16201, I wonder if they
> can be merged together into single driver, whilst also implementing
> platform_device support in them.
> 
From quick datasheet comparison, yes, I think the drivers could be merged.

> I want to work on this, provided some opinions for me to work with
> or to have a separate driver for both of them.

I often look at two things when assessing if two or more devices can be
supported by the same driver, the protocol and internal register structure. For
IIO devices, the protocol is usually I2C or SPI. Though, even between devices of
same protocol, there may be differences on how the data is structured in
read/write commands. Also, if internal registers have very different addresses
or meanings, it makes it harder to reuse code because the configuration
procedure for each distinct design/device will tend to require specific
handling.

That said, ADIS16201 and ADIS16203 SPI read/write commands seem to be the same,
and ADIS16203 registers seem to be a subset of ADIS16201's. That's why I think
it may be worth merging the drivers. I didn't read the datasheets thoroughly,
though.

> 
> I see that there has been some discussion regarding the same at [1].
> 
> [1]: https://lore.kernel.org/linux-iio/20230124094450.0000272b@Huawei.com

Git tends to rename/move files when we move a file from one directory to another.
IIRC, Jonathan prefers the drivers to be completely removed from staging to then
be added under iio directory to sort of make it clearer that something is
being added to official (not staging) IIO drivers. To accomplish that, we
use --no-renames flag (e.g. git format-patch --no-renames ...).

> 
> Sincerely,
> Saalim Quadri
> 
