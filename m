Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436DB4A8A3C
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401439; cv=none; b=sOdEFOh5dflzqZL8uoiLDtLj7X+d2yAaZo26s0xryE14+Ipbc2dQqD8pvmmj28mm29Kq9TW2Z0/be1o/1wJRyBeRYiHEo6y0UETTLRknKLFLWbUUoVqJajRlYDNa2T0l7x/PQlE+wtNcVOJvvTjNEcXjQNgA26qIoeWa0fh8Auo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401439; c=relaxed/simple;
	bh=JGCN14DSdkaYDz0L1wUcX1YfgAZpVl0MxngkUJepzpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPNxqK3NsjZCFQglBGjkahKyZJE20e7Zows/zWLl0SChUu5Ub6pmABe/YtPQ1xDyPyNwa3ypMY3wumfysoZrdjUHAVKTm8ACZv7vO4woywc+W3xwNOb6JjrfSZvy/oxCgQhGyhfwriNIsOqYaqqbhLz/S1k4+z8+hThqR/1ymZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igX51SSC; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igX51SSC"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so4758675eec.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792401436; x=1793006236; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GGRHuFuy9q3u8gF9aGqTkLAN78SoDlwfASLSUJHutQ=;
        b=igX51SSCkKQvXTkwqrkcKVeQwfY1UsGJqb6K/mpIFRAtg4OuTYk6lwbn7hGqvJPV0f
         /L0zntNF9+I0zoeh4qpI3TgHYEkdiyqwBGeEd5mPRQOMNnysJHAZeemy7ytBAk2HwITU
         nPQLFP8e0siP2boGagJgFZgsFiFBwdN8/nSh+4AsvrL7DhWb4pnUj+psTOGQVj4hqvUj
         p3PdgQasZqTHN3VVFUDVbec/yfZweRk/CgBcU+E5O+ozNVVhzBzNxfTgnPlZvplYzyB0
         i1gYXwcybv4gKkl/RIUmb8OYDRVSrY2yDnxTTAnXhv36kr7771+KxOehEHv5tXvq9jRB
         1dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401436; x=1793006236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GGRHuFuy9q3u8gF9aGqTkLAN78SoDlwfASLSUJHutQ=;
        b=cl1VVkoSJCnK+MXguR3dUeQmfOj5Ci+ddiED/6lV7PnXDTMxCqnMyi6mae58e9sU6L
         yJn4BlOsZn3ZxPjjt2U5u0R7J8veQu09J0aTVgzfqvNIxCltxrgGSHUtWTZBdD5BHp4A
         b7evNJrI72EHDFpvDDv76IuKWaDnxouCoZLTD0FiBGtS6uleY2gekwzDda8zDTOpRO68
         GM63Rn5ZWbqFrrbsDNJRCbLmEzDJ3lvsG9oNYUZ/yo64HJc2wJhvHByFWrx/qDAKv1OO
         yJYoijTp172H9aR2dGgnq8jRDFg6pi1py93GX2flL0KL+XnmakzpwN6vYQUBk7QOfQHv
         abUA==
X-Forwarded-Encrypted: i=1; AKwUvBzkkeQXU25rpGadXMR2ml6SYAXlpT36SGt4wb2oNCxnPItiGIkDmvCY1hVFqx3n+qu1yw2IShWAAB4JJDTA@lists.linux.dev
X-Gm-Message-State: AFq9FYL4Oucn+JdvOAkOzWlnMe84I5i18917fCb3iWE97fKv19n+Z3xg
	6+dQ41QIN34Ryx49RvMPkLjHNgFjtW4kDQzgrYfB6vOfSjO5+5ud2nD1
X-Gm-Gg: AYBFou0VgOmjfuImkR8XpihEaVl5iALc83Gh1q+Vmor8M0vYYvtnJxufrBSWW0aNcnb
	kHa5L2Cg+YVIjrgSewaLWY+Z5WOc615Z2GU7TQFn+KPaAMkRdKrclej9BpgDbn1ZxsaG2/zGXAT
	VDetm/oGto6Lj2OH1j28wH/A94/7DpENiX1CXhXKNOlGaNOgavy8UMBnKvWVM2J00dRWc503B3R
	RWyG3CHtwdQmg831zlR3xOFVcxB2V7tPheUDHFMqW5zR/YrJsfwRBT5Ktx6VWvbZaBN2DAWdKXo
	gpREFyA5mDzq/lcoIxCeuGuiw1HOIrhanTF195phcH21mU5a4AY/IIR/F6cwqLPs65wLrdbPdKp
	27HS4+jxf9DNhhgPtVFC606kqDoC1GgWqJosUIxE5YpJRVTLmjwN2AzKzRVxdP5ScvGn4aUuV2e
	JfD6Bdlt6i05myh9uw2uqJDac/TwzWwY5t/0FYdV1Osth1jznSGFmNzSvRw1wt42jRxDLyUfwx5
	odikvEDPCT4emFh
X-Received: by 2002:a05:7300:a9c:b0:353:5908:36fc with SMTP id 5a478bee46e88-361a1b517e8mr10639911eec.17.1792401436187;
        Mon, 19 Oct 2026 02:17:16 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:3246:597c:c4cc:181c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ea7e5csm29714408eec.15.2026.10.19.02.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:17:15 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:46:52 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, elder@kernel.org,
	dtwlin@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v5] staging: greybus: use %pe in error messages
Message-ID: <atXgBFNsXG6w30EQ@user>
References: <20261018084925.11793-1-pavankumaryalagada@gmail.com>
 <atXDvg_u1hQAZiYX@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXDvg_u1hQAZiYX@hovoldconsulting.com>

On Mon, Oct 19, 2026 at 09:16:14AM +0200, Johan Hovold wrote:
> On Sun, Oct 18, 2026 at 02:19:25PM +0530, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Use %pe to print the error pointer directly and display its
> > error name.
> > 
> > Keep PTR_ERR() calls when the numeric error value is needed
> > for returning the error code.
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> > ---
> > v5:
> > - Drop arche-apb-ctrl.c and arche-platform.c changes because the
> >   files were removed.
> > - keep only the uart.c change, as the fw-core.c changes are already
> >   present in staging/staging-next.
> 
> The commit summary (Subject) is a bit misleading now.
> 
> > diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> > index d47f00751e7a..74c9898c0eed 100644
> > --- a/drivers/staging/greybus/uart.c
> > +++ b/drivers/staging/greybus/uart.c
> > @@ -956,7 +956,7 @@ static int gb_tty_init(void)
> >  	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
> >  					 TTY_DRIVER_DYNAMIC_DEV);
> >  	if (IS_ERR(gb_tty_driver)) {
> > -		pr_err("Can not allocate tty driver\n");
> > +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
> 
> There's really no need to print the errno here as it will always be
> -ENOMEM if we ever hit it. You could even remove the error message
> completely.

Since the error message is no longer needed, I will remove it in a separate
patch rather than in this revision.

Thanks,
Pavan

> 
> >  		retval = PTR_ERR(gb_tty_driver);
> >  		goto fail_unregister_dev;
> >  	}
> 
> Johan
