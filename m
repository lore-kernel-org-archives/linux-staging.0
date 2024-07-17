Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3F2E620
	for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721204918; cv=none; b=B2UlCtTFEMzmzAPsH8auSz7ncKfo8hbWJO5H694qbhgGHOfPKYKgXpbljNXw8SCIWVC8V/nE5Q3GXHUGqx0axdU7SPsvBSywNB+8WJVzEzRMffkEMzD0YJF+nri8YFUEBg2wVjJqrQ+ey/eHV2I3joaMxX5mU4Iouq2k+C/8ki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721204918; c=relaxed/simple;
	bh=tT6XsYQx5Xnt5h+akxMmIPr/3g0NvozoAQM+91YQY6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGvYbJiIeg0jZ6uQDi6DQqu5U3Tjs870rTCK+KNz7Zfbv/4d+Kr+gpm51H4Y18KouPUBwjaMpk8FDi8DkXkoSEV7aUS03ToC6pcqa8f4LASVM/z6mF61tz78IN2NRUY7OUL6Rf7KR158rcw+gqWwifL4YxWAWnuLSdoEi7kVakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9NkODpz; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9NkODpz"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-48fec155a0bso252633137.1
        for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721204916; x=1721809716; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4KZQTDZw2APXwMGxrPgybfDO9budQSIG/6b2Wcz5TM0=;
        b=j9NkODpzVRUmDFQsbc22KwUoV1KVejk/7T1voJgkjjwPIec7sGG3QgDskzNaUNV+Xo
         82/Wj+vE2NRqBf/z5KsLtghGfdJLwpdk2jjjs2pfgWHJyMqNnOcILMScu20z+L32BtnZ
         qGLG36PjqGTBInyDmNqPJQNhWkgf9jBUh5trgMIpfUfrJdeaVxpkGoNH2KfW6OLt/VZe
         ZSy9bFhMX5JquRWQI7ZVVvUDNgv2pKYyK2KhRuGpblOb8fR7cPrB7TN6Mn4EvX6VKKak
         yD6W03JwfFsb28UTo2BmQIJKq6JuZRY5wtzIPIfpQC4sHMifiVrbp768Kvp5zIEmb9M4
         gzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721204916; x=1721809716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KZQTDZw2APXwMGxrPgybfDO9budQSIG/6b2Wcz5TM0=;
        b=bFp6YehKVe9jy5A4yTXcb+dDJ1aIHBZk6O/19EiyHKN023Gabydj4Cx68uveUPio/g
         Cx/5yGnh0Bj1Zd1dt+wNQ09Qv+us4VkqL+BLUv+vVTNMRqmgrLLb1imD/fsk5ufSEymO
         n/YvyoVoF6nFH2RJcegvzXMSQAuU3T/LHmKtCBGjj8fGOiMHTZNhvVyl8oxJlAT495Kj
         8wPobKslJUlYisFh4ru9nTIxK8sMTR+Vg3I//o+jd4OU7yLZn3W3OtkHgYo0cWbc83GO
         QtL9oFZekYiXb6tzHYhbYYK9mS3bEMZknTeOL9TH0g+ofPlMHcdLjvnXnVOxZC2wlRAR
         6wRw==
X-Forwarded-Encrypted: i=1; AJvYcCUVUF+JGGRGrH6Z2wrjOlV4tOWEpzsRFKgJTRvWSOthF/PJsYWoA9qoYtgfTC6VJwRo6S9L9FZy+1Sm2psrbjA1tqnZix/xuQvvXw5aNg==
X-Gm-Message-State: AOJu0YxSBxe+TgxiaL92JvW/aUUGfkzAsvd4OoekkfRuAD1WbmvJ8Giy
	27GOhx7jtKGSKGJ3aYW7XJyvNVeo8/zpTPmoet9RvVjXG5JhXSnk
X-Google-Smtp-Source: AGHT+IHgCN8xisAtX13jYv39e2u2Fon9PVVDbBr1QKAWQQF0y9O5fdXo2XrqCI/pG9oToa8Uzcu5hQ==
X-Received: by 2002:a05:6102:4bc3:b0:48f:e111:4ee1 with SMTP id ada2fe7eead31-49159a3fce8mr1213046137.28.1721204916050;
        Wed, 17 Jul 2024 01:28:36 -0700 (PDT)
Received: from fedora ([2800:e6:4000:47e:7c52:7bd4:cfe5:9874])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-81e64735e4fsm372012241.11.2024.07.17.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 01:28:35 -0700 (PDT)
Date: Wed, 17 Jul 2024 03:28:33 -0500
From: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pure.logic@nexus-software.ie, johan@kernel.org,
	linux-staging@lists.linux.dev, trivial@kernel.org,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH] staging: greybus: Enclose multi-statement macro in
 do-while loop
Message-ID: <ZpeAsakTE0ZL90kt@fedora>
References: <ZpdrmuzGgYDJ-Bb0@fedora>
 <2024071739-mollusk-uneaten-8dec@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024071739-mollusk-uneaten-8dec@gregkh>

On Wed, Jul 17, 2024 at 09:50:52AM +0200, Greg KH wrote:
> On Wed, Jul 17, 2024 at 01:58:34AM -0500, Juan José Arboleda wrote:
> > The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> > contains multiple statements, which should be enclosed in a do-while
> > loop to ensure proper execution and adhere to coding standards.
> > 
> > This patch modifies the `gb_loopback_stats_attrs` macro to enclose
> > its statements in a do-while loop, addressing the style error flagged
> > by checkpatch.pl.
> > 
> > Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index 4313d3bbc23a..a97de86c67a5 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> >  static DEVICE_ATTR_RO(name##_avg)
> >  
> >  #define gb_loopback_stats_attrs(field)				\
> > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > -	gb_loopback_ro_avg_attr(field)
> > +	do {							\
> > +		gb_loopback_ro_stats_attr(field, min, u);	\
> > +		gb_loopback_ro_stats_attr(field, max, u);	\
> > +		gb_loopback_ro_avg_attr(field);			\
> > +	} while (0)
> >  
> >  #define gb_loopback_attr(field, type)					\
> >  static ssize_t field##_show(struct device *dev,				\
> 
> Are you sure you test-built this change?
> 
> thanks,
> 
> greg k-h

Yes! I build and clean and build and clean and build again, everything seems
fine from the compiler side and posttest task as well. Everything seems ok.

Thanks,
- Juan José

