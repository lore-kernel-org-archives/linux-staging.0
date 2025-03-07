Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8801241699;
	Fri,  7 Mar 2025 16:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741366263; cv=none; b=ALLSl/+gRVaUqOfkAIGe48uquou9pbsScZwPi0OnQSnYxyuiIp+jASSynfQJqv+K22lVzp/uCtiWYroKfbN10cy7K8vLAC3IvTOUpIWORKjjGt0P02nNTWwDqCjP8P1FdxjrJXuJy0o6bQ91+aswIJmS4wIrs9SkXsKYSAepbRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741366263; c=relaxed/simple;
	bh=cS9Zb1GU4eE3BvyFwVLVC0TTxdlswEgP6RUyYFegNdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B47PrP+5neCrI7H2Ltg1ePnvDMGD5KSowMTT4SARnvbk6VRFZvZtFfFMUS4fHYiAcb1UIgeJbl80MTGHKc6jStLHtb8HTkRRuVqGNR+jEsrUSiG8+4kyFRQH5o9MNA+yM+DofK3m6uxoR5tTcpIvJanyWxK8bD42P274Vx/wUHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwfOpM3x; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwfOpM3x"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224019ad9edso52321495ad.1;
        Fri, 07 Mar 2025 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741366261; x=1741971061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cS9Zb1GU4eE3BvyFwVLVC0TTxdlswEgP6RUyYFegNdc=;
        b=JwfOpM3x43fIkztc96UqDbJGYw3lRHIwO6xXKKa7NjZ5FdTMWQL/effVSZaMb67392
         e6fEAvW2avc9rA9sSPEvpS/X5kbQw2YxkWGwFlOeqwaoZHAH2N5kjQiOlK7/WvoimNkl
         UiEC+zyOODGIoJAfzhz6v5K/9CdsIIzxPIym2iqXq+94eH6SwYjzYd9lPVnZXfbfGfcj
         3gFdMT1hzoP75i6n7DgQKGjTyB+ETeVqkCpYWut14OI15kfFMYCHwtDEeQtMDyk3wNK2
         8G2A5ZRCqTUWU8k030wBNKCIq1E85793r6SQ0yfJnjhNb1gwzb4ot1Mi7h8txwf7+rAp
         lSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366261; x=1741971061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS9Zb1GU4eE3BvyFwVLVC0TTxdlswEgP6RUyYFegNdc=;
        b=A5uonknBY1ZXWGQyCfzEo8HviMJwZylQoZCbvrhMytTCOg1k/KEBVLVLVO3Yh01kph
         pOwY5M74JhhrkOTiemwKzhK8jdGY3nxAEnJ3i7laVGVmxFxnj6zaH6RuzUKDX2ekg3LJ
         u+arSOYJCgHuPBTb/SYW7E9mNqurWFIQiyud9wBHO6UZ+GEYrZsj25feBZqapwkNmDgJ
         j9TtzgEN/oYfBq3QIGpyyBTLzd0iXRYrayTSWDSsQabtvoZqk4Wm5pgZWHc3rhlErqk4
         CMCOJhDgCfVdvVgf09zbuJfaP8XpnkcbgvA3x0qufpGCKw2JtpX4rsqOAEFmerVKuMHQ
         ac8g==
X-Forwarded-Encrypted: i=1; AJvYcCUVuOkiGxZ3+yoWiOukXE9j8TFadcwJcrWlmofWxGgdnAhs/IRUMZAWNkigO/dCXyNriujWRg==@lists.linux.dev, AJvYcCW5sqPV3n01NRN2zls4joYCFacpxMeVR2UV8woCxKqXQltzcy2GnqUTS4QOkYNFvOsUudp1PevSHz2CQvPbug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT5/DsSfwZYoK8cD45lcjALdd04I9SwsTt1h011wQPVzqCe/FB
	QTBt+w0wNfA0P3rzu3oXbJGD91OfX9/KL1WO3y8+ekq7r2luxajAsv4lcw==
X-Gm-Gg: ASbGnctwxC1zKDK+7+UtIcDraJya4haPaP/r/0T2LtEANVrn5wjShAZQqS0QwsUwTdQ
	V4ijh6IkxfDdSAR9fwmvE9IGBu8MKT8YpZdRaJnisn5Vv7tb3Mwa7KERtO8/VNoVQPlkQvgC0kc
	oCHoXSkivUvVPZoC11CXq+8Khao+E7XjEeIPc7P/L9W5E2BdpUyOnG/vdNXnhlEh//v4LTpAyl5
	3X6uzsX7W+VNYBkJhTTmlVW8tL2r6JFFf03ZnJgnou+Tr8dpt6BtLDjMqxZhOgwwKdKQQeON9NP
	AuR56/xB9iqo1GR1oVV8iv3+xj4uS+ddDNYi+vqytIxzA8IlP0BaCA==
X-Google-Smtp-Source: AGHT+IH6wTdVSrkEWzxPXeMMRaiQrPUn2JENVyXLqhw3Yh4hYsLuRU+w3/MgwsrvFwKD90HG2+mNGA==
X-Received: by 2002:a17:902:eb81:b0:224:1935:d9a3 with SMTP id d9443c01a7336-2242888ab01mr74689915ad.21.1741366260807;
        Fri, 07 Mar 2025 08:51:00 -0800 (PST)
Received: from eaf ([2802:8010:d51a:1300:38a4:5444:b138:8488])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ea390sm32354895ad.69.2025.03.07.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:51:00 -0800 (PST)
Date: Fri, 7 Mar 2025 13:50:54 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Theodore Ts'o <tytso@mit.edu>, Aditya Garg <gargaditya08@live.com>,
	Ethan Carter Edwards <ethan@ethancedwards.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"ernesto@corellium.com" <ernesto@corellium.com>
Subject: Re: [RFC] apfs: thoughts on upstreaming an out-of-tree module
Message-ID: <20250307165054.GA9774@eaf>
References: <rxefeexzo2lol3qph7xo5tgnykp5c6wcepqewrze6cqfk22leu@wwkiu7yzkpvp>
 <d0be518b-3abf-497a-b342-ff862dd985a7@app.fastmail.com>
 <upqd7zp2cwg2nzfuc7spttzf44yr3ylkmti46d5udutme4cpgv@nbi3tpjsbx5e>
 <795A00D4-503C-4DCB-A84F-FACFB28FA159@live.com>
 <20250306180427.GB279274@mit.edu>
 <4e41ef2b-7bc3-439c-9260-8a0ae835ca02@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e41ef2b-7bc3-439c-9260-8a0ae835ca02@app.fastmail.com>

Hi everyone,

I don't mind putting in the work to prepare my driver for upstream. I just
can't make a case for it myself, since it sounds like a lot of work for the
reviewers and I suspect it won't be all that useful in practice.

I think the driver is reliable enough under linux-only use; the subset of
xfstests that I managed to get to run stopped finding intermittent bugs last
year. I'm less confident about our compatibility with the official driver,
since I recently fixed a terrible corruption bug for all shared containers
above 1.32 TiB in size. There is an official reference for the layout, but
it's incomplete and has a few errors.

> > (Although I suspect many external SSD's would end
> > up using some other file system that might be more portable like VFS.)

That's what I would expect too. The driver does get cloned a lot, and it's
been packaged for debian for years, so I guess some people must be using it,
but I don't really know for sure.

> > In terms of making it work with the internal SSD, it sounds like Linux
> > would need to talk to the secure enclave on the T2 Security Chip and
> > convince it to upload the encryption key into the hardware in-line
> > encryption engine.

I don't know much about the hardware side, but I think my driver will also
need some changes to get this to work. Right now we don't support any form
of encryption. It's the biggest missing feature I believe.

Ernesto
