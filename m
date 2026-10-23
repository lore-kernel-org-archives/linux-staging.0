Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776312;
	b=M+pGPGIfG7HEk5cuvxejhhvQ6oNj5tCqk/kcSbSJ60lTEl811LVD4k2tE2e8lnhupEYO
	 t0S1fDjlgglVXqUmlP94uK8s0uwZT4iKHB3z+taYIMszg+TJOkmho7/mV1RuCznWNC1M9
	 4TJm0RdrF2DePn7uvuKA1vZEmpnuvZhgr/u5kqfLybaTQ0xotAFfdsTXDisVTM7IRxN7A
	 d8B/x6nWClgAZzBI+P3gmsbSl8pfKv8G/d++8ER2ScGjOLKQi//Lyh/fNx+luBVHNsCs3
	 l4gR4iViUqkQzBAPgwTu4cdaKgTDkYVX86aHzVsMOx1L0sPi+uBserPUjhsIy76+yjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RO+LOoJIbW5iZ7RHeBPtINL9e1shP4vPoVIK7G9kRv0=;
	b=puma4yObMUye/QmYrttjq8q1FftNykhv1MAVQloksSE/kTF5iZn8iHCl8/lSAcB0C3rc
	 3/mWfvY4v0DFmHwff260QFPsJ7H9KLRskDrlfsIKtmfeQ8ySyC6eX37uaCOGENno9FHEu
	 RbujczQOmAJIHOw/LHDroqK6jZ9JB0JVzJxomUqdYLQNqZicAr/mKpnrQ2hRdPXBa9Kx5
	 D7AUgQxPAT1oLJd7glM98TUw2RCBcGh4SzrR6F5nDVtGL+UwldSR3twsWVnRSSA5pt2If
	 MyGim3/4ug2KvO+sis37DYNASJr0/PPC2AqMawevxwZ7kIWRug8Yycl9cz7x1e2K+Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hKfTJFsY;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1E2606A31B
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 17:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hKfTJFsY
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1931ff67a29so1281642c88.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 10:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776311; x=1793381111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RO+LOoJIbW5iZ7RHeBPtINL9e1shP4vPoVIK7G9kRv0=;
        b=hKfTJFsYWbOJDFSe0TdCWYG+QxFNpGp+pf60PixUgnRaJIjH1KhtQ/3nj+98FwRXhx
         AJKBCowOoGUeH7YsBSZ1zWjughhaLQIA60ssJhoC+ckVzF3Nb9QfMXoxk8yBfM55HoZ5
         2hw8iLz/isGXMWKjOlWJUxLGSRg7zVLqQRHrHjf9w0+KdnuHjMZJbMRvmQYjDoha3Rx9
         MM54Hq4vPNocVUDOl7EupOHqZG9IVhn7sw3VUoxd4ijVpPdQMVvDv3V+6nHRom7DLTot
         QNA8YSd2NUKDsrDO5VQ4NWITU9QjaoK+WnTk7CYZJkx5oFattmw5y5dEhb1WC83J2FYn
         FAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776311; x=1793381111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RO+LOoJIbW5iZ7RHeBPtINL9e1shP4vPoVIK7G9kRv0=;
        b=V4QelOScYaHG5/2b9RaRiwNrG6NySvPAdFQ75KSL3evB0rxadOByL8YbfC8P+XVbBl
         KTXC2MXviFz6mbh/uOvS33xa29n1/7wuv5Ll97J8ZUpbeAxUYAxVa66euhWmxwVeVdcn
         2jNKLxRD9vFKhdPSdOUsRLGj+zIiXi8sFTQ3+BYUJWSpYjn7wMRTDxtt5RNPiqKCl98n
         t6ll1GA6c86RM2gv/vYoeMiT6krANc2bAfA60TZdCTT9iiHMhuWDO3BgnUJjxgrqheDC
         AP8/8BuCotbWgC0fGq9DZB2ALXzOAhFKzbm0j0acQ5ltsCH1uEHc8slH6Vj113F/NnhB
         vw+A==
X-Forwarded-Encrypted: i=1; AKwUvBwpDDG1qvS0tjwurijJAAdTqHMOilih5eqzm8IhBaGboD4I+qz22cTtHeG90lNffHCqOER0R/rF7Uk954pW@lists.linux.dev
X-Gm-Message-State: AFq9FYKcLKxqJStS6Do9lMMVFkkONxclIuO2IyFQ526jV4eOKEIz/fqy
	JoAUgUwfxNT682M9ypkHn7nLYHWVbiTfzRcjkrQdsfRW88vi45yCMAF1
X-Gm-Gg: AYBFou1UvzdQNYj41p/W1/wMX7Gb1uFppkyjQfAdslM+xdkcN+SzgkrRTdT9+Hq2cGZ
	8aJs6wORZpp6GmD4DED+yUUrWk24p7rNUQRGkXHkPAYkg5xvuFtrBXUkZlU8FvOVIDARUfutZcf
	HTrWYfyDQigHpruwgDDctZ/zGgoUhiMS1/qMDYc3H4hVoewj2IEpxLwbk4HB0+h1RdSTgSq7arq
	e0VUgoItdDVdILA6P/Qnf1yJA2AG5kiDAznNLcBuou2l+DadR3zhoEklIrUT1qW2ggdGWA1dLZA
	ZUkEBx+YGPVS+tWsQj8uqGELYYCy5gIWU4kv8vv1N+YoLxz/tLTnZf9A/MUbwAuEmZXDgzOpuGk
	LGeT+QPQvsnC1dN7gXZdlZ3erucPWo1gfHaPh0d8S5TTEgVbdaPyfyd4d5+l2iYZUzV8UXFX2K6
	ELwQSHnaLRe9fCVhA5rURKtWT7MRj/D+Z3Gwcl8DLsh+9CPMrQm9OxADBHfJa74SQDqj8DZAe1V
	Qzo07IbFHO9THxlz828bL/f0tsXX4sWxKkoWX11uCl3EqHEdmBZreaoUhJn4g==
X-Received: by 2002:a05:7022:6606:b0:185:6b47:dcf with SMTP id a92af1059eb24-195a074d885mr4595312c88.36.1792776310587;
        Fri, 23 Oct 2026 10:25:10 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:4145:da00:43b2:a151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6dadb7dsm1039145eec.6.2026.10.23.10.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:25:09 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:54:42 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Alex Elder <elder@ieee.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, vireshk@kernel.org,
	rmfrfs@gmail.com, dtwlin@gmail.com, pure.logic@nexus-software.ie,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
Message-ID: <atuYWuWeqvEG6j4B@user>
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <77adf02-43a9-7621-a94-9da41f8c5a56@inria.fr>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77adf02-43a9-7621-a94-9da41f8c5a56@inria.fr>

On Thu, Oct 22, 2026 at 09:30:26AM -0400, Julia Lawall wrote:
> 
> 
> On Thu, 22 Oct 2026, Alex Elder wrote:
> 
> > On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
> > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > >
> > > Unsigned variables are printed using %d.
> > > Replace them with %u to match their types.
> > >
> > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > I have reviewed every one of these and they look good.  Quite a few
> > of them--because the size of the value being formatted is less than
> > 32 bits--would print correctly no matter what their value.  But I
> > think it at least does no harm to convert the format specifier to
> > unsigned in all of these cases.
> 
> I was suprised the compiler doesn't complain about this.  It seems to
> complain a lot about type-related format specifiers.  Yalagada maybe it
> could be worth adding something clearly invalid in one of the argument
> lists to see if the code is actually getting compiled, or if you need to
> set some config option to make that happen.

The files compiled sucessfully with the normal build settings. I also
enabled -Wformat-signedness to check for format mismatchse, as this check
is not enabled by default. It revealed a few more issues, which i'll look
into as well.

Pavan

> 
> julia
> 
> >
> > I have highlighted below an existing bug that should be fixed.  It
> > gives an example of something to look for when you do this sort of
> > activity.  Please arrange to get that bug fixed.
> >
> > I also pointed out one other observation for you to think about.
> >
> > Thanks for sending this.  I didn't check to find any other instances
> > you might have missed, but you seem to have found quite a few.
> >
> > Reviewed-by: Alex Elder <elder@riscstar.com>
> >
> > > ---
> > >   drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
> > >   drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
> > >   drivers/staging/greybus/bootrom.c        |  2 +-
> > >   drivers/staging/greybus/fw-download.c    |  2 +-
> > >   drivers/staging/greybus/fw-management.c  |  2 +-
> > >   drivers/staging/greybus/gpio.c           |  2 +-
> > >   drivers/staging/greybus/light.c          |  2 +-
> > >   drivers/staging/greybus/log.c            |  4 ++--
> > >   drivers/staging/greybus/loopback.c       |  4 ++--
> > >   drivers/staging/greybus/power_supply.c   |  2 +-
> > >   drivers/staging/greybus/raw.c            |  2 +-
> > >   drivers/staging/greybus/sdio.c           |  4 ++--
> > >   drivers/staging/greybus/spilib.c         |  2 +-
> > >   drivers/staging/greybus/uart.c           |  4 ++--
> > >   14 files changed, 41 insertions(+), 41 deletions(-)
> > >
> >
> > . . .
> >
> > > diff --git a/drivers/staging/greybus/bootrom.c
> > > b/drivers/staging/greybus/bootrom.c
> > > index 83921d90c322..fb1fbd3f7b99 100644
> > > --- a/drivers/staging/greybus/bootrom.c
> > > +++ b/drivers/staging/greybus/bootrom.c
> > > @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct
> > > gb_operation *op)
> > >   	size_response = op->response->payload;
> > >   	size_response->size = cpu_to_le32(bootrom->fw->size);
> > >   -	dev_dbg(dev, "%s: firmware size %d bytes\n",
> > > +	dev_dbg(dev, "%s: firmware size %u bytes\n",
> > >   		__func__, size_response->size);
> >
> > This line actually contains an error (and it was there before).
> >
> > The type of gb_bootrom_firmware_size_response->size is __le32.
> > So the value being formatted needs to be converted into CPU
> > byte order before being used.  That could be done this way:
> > 	le32_to_cpu(size_response->size)
> > or just use this, which is known from a few lines above to
> > have the proper value and byte order:
> > 	bootrom->fw->size
> >
> > Please add this to your list of things to fix, and submit it
> > as a separate patch.  This would be a bug fix, which would
> > also give you a little bit of a new experience.
> >
> > >     unlock:
> >
> > . . .
> >
> > > diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> > > index 4f1b3f4db404..2314496a858a 100644
> > > --- a/drivers/staging/greybus/raw.c
> > > +++ b/drivers/staging/greybus/raw.c
> > > @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation
> > > *op)
> > >   	receive = op->request->payload;
> > >   	len = le32_to_cpu(receive->len);
> > >   	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
> > > -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
> > > +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
> > >   			(int)(op->request->payload_size - sizeof(__le32)));
> >
> > The above size calculation was done somewhere else without the
> > (int) cast, and the format specifier was %zu in that case.
> > I don't think this needs to be changed necessarily, but it's
> > something inconsistent across the Greybus code.  Consistency
> > helps readability and maintainability.
> >  >   		return -EINVAL;
> > >   	}
> >
> > . . .
> >
> >
