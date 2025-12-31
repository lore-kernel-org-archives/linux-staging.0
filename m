Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB5284883
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200937; cv=none; b=tY5K5m6fUL9Cij+m7P4gcmuq6eXjohK5nW4KejOQkrmxXmSoReFOxO5ZP6zSlZ08FiHQvdk/UuN1inw3Ofylq1E3X/5PldRdRnSGepVmxZ0p2DXBEAEwWEG8X3+KENJKJZpRIjoNJv//v2VLHJD6UgmLL+Nv9dTtLUPc2BxMemo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200937; c=relaxed/simple;
	bh=BsQz3MgfzIvdHcOQ6K/Pt8YSviTToGi3Fd9JxKBH/WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXESzaGs0iO68iS7du3uqrW1ZxPpZOYA+glGPuaWkE1TgCSEyDU8vxGKkUL/+DA+vtEs4KV4ftNNk4Owf+sP0hyDcPRTl+4qWnKNA8XWi08W7KxkwWQf0FzHfhGyKAAAD3U4w8RiVT3s7yinTtYNlh/rGvRPeMObDI+bRNRBvYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL+Gb+kA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL+Gb+kA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0bb2f093aso110477235ad.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 09:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767200935; x=1767805735; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ahGMNeZOyisjMBf2xg7F5yAgYnagRca+XxEpIk6VaA=;
        b=aL+Gb+kAzLaOL99KPr67Tugg2FcMlkHUcMkBCeIxYVgfoVSMcAsmHAMl5fqdvVLoSA
         uf5Wok8yGtzpftkHDV/Vz6Gry80Wom81TTiCCW8vv/Li+//Llf/S5OEym8NTwyWzRJMO
         2BrbkVG/z8UDGw3IxEgMwjYAse3dujj3bjNVsyTKuQu+xosV1Mjmk4hAuOKv6+AIQifK
         bDvknf+kdAz/XXZ9n1ShIvQWxCs9sO/HZBSVb092DW2A5sRv6m0LpY2w54v25+X05Fla
         P+SdRHcf9y9mZHUR7YjGlaHOQSxjqo98HS7c+4HeEKGZDmEC9VoOXsGcF94Rj2Tp+Zhq
         vrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767200935; x=1767805735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ahGMNeZOyisjMBf2xg7F5yAgYnagRca+XxEpIk6VaA=;
        b=ED0bMdMo30hQ/Mlg6Qb87mWnWXAUL2jZlquFVpnOwsGZlOQvnDlM5yEF0vMOEvS1aU
         QHUjHvxnkHHxqoKXg9aMfAJUJYeCvONtazvN6aoJW5JQg3kY62xc/ksJBt5aL8uH8glN
         SADcQDgYr3+0WeuKBWkoupSR47o90EeyIi5YGhVen5ETgBvjdT920iukVma2K3kagy30
         +UpuCXR95HVOZg6/LND2X0bain/ucR3V1lSDJ51LBwcfiRe7+6XNrs1byNOVcNSm3mTF
         ZgrmCoXSZzzc4XAJ9PS8K4Ovcle+jdW3aUOpiZVBW4nUqGXfCEPZ3n2IzaFwpm+jgFpK
         Quig==
X-Forwarded-Encrypted: i=1; AJvYcCVnGu+j11PvLnPFJitOUr8GfEfC2DxfqOAhQxuSwYvpmGJYqrIjP5lZ8XjdDUb50KL6aPh5+kAwrEWLUSpF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxqlri9xxQwYIFXXxeiNxLKUwoIpRPk9ozsMncPY4M8gPmBuwT
	zDMdeceRgcv1J3jGhe9z+rQb8UVed23yOM435nZ/7XNYGKO7sYw2TDDY
X-Gm-Gg: AY/fxX5gElz5x2nSafwuz1h1xlVzQOkjdSBLD2kmrBti5Y1DFSAdUML5hMSXd0SLgNp
	sMMVmmBVsOWzVWNn1Zjr6ZUZqP5W/2vX90ZBIWT8HpyQHTSVRLCcjfLXhVjoZNBl07rDNhoBphE
	ZalX1Aeb9804VJQKMgYrHmpeU0dzWJTrA9VP/7BOrNI2I/GP5ZfWNmKk7G9sR639K/zgbCQgi+q
	Qwgch6XHERixbh/y468YJWDfWZFVgmUbhyW9gOdzl8JG1EiKxlDgBoI/whthfjV4VOexQm3BwGd
	NJRbjqF4ElifCCZhRRmdRTmU5CGY9kXoYrWG/q86g4Vn6MN9ehFQdYCbMlXdq1ya/n0V84XFRDa
	ySGzjTlqCVNScIUNeZxYiKE6dljdZ5Y7JiyA4zl1mR8pBMqgJnePFrVRhzwdrILGIVxPnXnW5TD
	dMoyyf8gw0PiYq5/qNn35mzJiWTYspAEJEhhAqnIXhwdeSQcOoki7gGUSn67W6xIKzkVAGSjO6p
	r7HOTnflGgGDurO10EzsViQTVVVuvAsjZNcfNtWK0XIl/mqNaHUN64eqUJyzvXQXj3Q
X-Google-Smtp-Source: AGHT+IHyM1m/eNs/WsDhpNstiIr/fvkPWgCZFvgD7JGCj8eGaxWhM5s/oBs0L8ecNW9loSMmMxpcgQ==
X-Received: by 2002:a05:7022:6887:b0:11b:ca88:c50f with SMTP id a92af1059eb24-121722e9d56mr38018389c88.40.1767200935449;
        Wed, 31 Dec 2025 09:08:55 -0800 (PST)
Received: from localhost ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de25dsm104504956c88.7.2025.12.31.09.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 09:08:54 -0800 (PST)
Date: Wed, 31 Dec 2025 14:08:52 -0300
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 5/6] staging: iio: ad9832: convert to iio channels and
 ext_info attrs
Message-ID: <kyjemsha276njt5h57xtpev2sgxpxxlk3msax7kbkof2vkg6nz@3whszjxmbil2>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
 <20251230203459.28935-6-tomasborquez13@gmail.com>
 <CAHp75Vch9ud6fP=jg0tFx4WjHKYyfZjwaELBzfSubBVksQ7hSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vch9ud6fP=jg0tFx4WjHKYyfZjwaELBzfSubBVksQ7hSQ@mail.gmail.com>

On Wed, Dec 31, 2025 at 12:55:50AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 30, 2025 at 10:35 PM Tomas Borquez <tomasborquez13@gmail.com> wrote:
> >
> > Convert ad9832 from sysfs attributes to standard channel interface
> > using a single IIO_ALTCURRENT channel with ext_info attributes, as this
> > device is a current source DAC with one output.

...

> > -static int ad9832_write_frequency(struct ad9832_state *st,
> > -                                 unsigned int addr, unsigned long fout)
> > +static ssize_t ad9832_write_frequency(struct iio_dev *indio_dev,
> > +                                     uintptr_t private,
> 
> Torvalds said that uintptr_t shouldn't be used in the Linux kernel,
> the unsigned long suffice and enough. Why do we need it here?

Copied it from the definition of iio_chan_spec_ext_info:

struct iio_chan_spec_ext_info {
	const char *name;
	enum iio_shared_by shared;
	ssize_t (*read)(struct iio_dev *, uintptr_t private,
			struct iio_chan_spec const *, char *buf);
	ssize_t (*write)(struct iio_dev *, uintptr_t private,
			 struct iio_chan_spec const *, const char *buf,
			 size_t len);
	uintptr_t private;
};

But can change it

> 
> > +static IIO_DEVICE_ATTR(out_altcurrent0_frequency_symbol, 0644,
> > +                      ad9832_show, ad9832_store, AD9832_FREQ_SYM);
> > +static IIO_DEVICE_ATTR(out_altcurrent0_phase_symbol, 0644,
> > +                      ad9832_show, ad9832_store, AD9832_PHASE_SYM);
> > +static IIO_DEVICE_ATTR(out_altcurrent0_enable, 0644,
> > +                      ad9832_show, ad9832_store, AD9832_OUTPUT_EN);
> 
> Why not IIO_DEVICE_ATTR_RW()?

Not any good reason just didn't know it existed.

> ...
> 
> > +       &iio_dev_attr_out_altcurrent0_frequency_symbol.dev_attr.attr,
> > +       &iio_dev_attr_out_altcurrent0_phase_symbol.dev_attr.attr,
> > +       &iio_dev_attr_out_altcurrent0_enable.dev_attr.attr,
> > +       &iio_dev_attr_out_altcurrent0_pincontrol_en.dev_attr.attr,
> >         NULL,
> 
> At some point we may also drop the comma in the terminator entry.

Will remove it as part of V3

> -- 
> With Best Regards,
> Andy Shevchenko
