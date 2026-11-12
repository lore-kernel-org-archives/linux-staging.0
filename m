Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499552;
	b=AYi2s4xKNXTko2TRojFDDArlelmTjmTcRt3TG6jZse0w2cso7L1lbsh9lNKOb/r0HgeM
	 4Ul4YfIy+EfI1p1YgZH1ijGTTr6h11BqsyKyLOlbPJCDGeIfS6M7gDnux1rPSaZOX9ZOU
	 2otvnP7jY+peQDrdLdzrxxky/UpIiHtXstlI7XhMiG2k3CkdcywulRsZeApGtYSq8Y7Xp
	 5p78aaZnEFRy2pgG/OhxLVvHHabff/eo02KEgScm3mwJ71NLwNOUnJSsSlXGk2hwdrw1p
	 CshEDrhP+LwHfDxZDhsSFaKVu9UxBtrhTHFTfHDmxx9k523YvaReosbBRLLUEnlyAmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
	b=wO8XN7kc5bMdxCKp3/2mVOut1BRCtdny+9GMF3ctehKJLAv9s4iIxl2OHBJtcuoOSXVh
	 hkQxy1k0dZKrZIno6UotrNQYQiQ8zNzV1nIkFkCMn3H5jmlo5JuQs8Owhxu8Hh5oI7ZyA
	 9lkHVFIy4/xvNYwv0xOAqfhwTrisSyTWenu3HnQoPc9N8Q18ptmwF8kInsoWy7AyQHflb
	 HQxYZ+VJGZ4RL7wASjLPXV2X466+Fv6XiUtIhIwZinmum1vDNb00TLqX1Ox0FEVOMw6Yx
	 vRe1KyCPisgkrzefbHJCi3xa6V49Aalr9ShDdSRvi9BYjUs6qrvlYYkmJwKz9W5g9qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNVYChtg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1F4606A321
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 16:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNVYChtg
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b360828905so46663117b3.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 08:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499551; cv=none;
        d=google.com; s=arc-20260327;
        b=Em3zK2Rigis/OPoudXmzpYWnFT3A3oHpaclMaJA94VbZGvaF8vvd3vDiOheetmob8C
         AVPCjGYwB5c2XaoouHwDHrCTJH3AgBhbKA8CJ5zWd+Q8It3LAjsSOio3VFsRrjp51CYo
         1E2TPPu0tRgbZ5xiytSKKCCMONtSdVaX9EBD5BLycLhGuXaE1NmSNZeGI3AJhFTmBeuw
         chNvh6sh1NxLrhVUkViOL+5tHCX65R3RS5KBH8UKFCrpy/Fy2lo2j8aaqeD6+aVdGoUs
         FaX9NGnAqcDJfWZaMD02qOsAvWyDBa0+fGO+uV0xY1HeEZYOiA6hRI7CIPIRNOooBaYv
         sCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
        fh=NN75dGuXsEfmY7fZu+wqehTqyZwtQxkPcloaFiz0Ad4=;
        b=DD0GYGAa6FdLiwvI/m3GjChPi87kypMyhfd/pKWkVia1VhNmfd9Ur9Y1U2gXnwYGC/
         /JISB3wpDUrDMrvdnAX3lHlWalW14Yi8YRJ9eIagoy28v4mvH5iLDFBulXIqfkxTV/EA
         arVWlYl/NqpZgrqKik9Rf9holLSb2Rb3FaeuUt/4ruwUNM1+MfBGUdWCD6wd/fBUwdwx
         09DcdNHkpMl8VrTzQww4Zqw5osvqmdjj1sLMlxs3/U0UJb7WiAlWsQn11q/DLN39Pnyq
         HXg4SLFOPqdkJEV7x0LUtWp8n2o0GvlmW1NJZvBg1wHR9FmCDIpZ6kxdISJZMSjyhJle
         RVuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499551; x=1795104351; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
        b=ZNVYChtg2dIDOeXKqNhDh3DFg12YxfvPUGo3TrsWWVPd5c9J/ee3mDA6mIfBftS3Ij
         YbDHCd/5znQnh1c9wX1gRKME9CryRwmAufXzWQX4k+sOn5bmDUBf2sFc/hdPo2MlR0Jy
         GAjlbCymcFxPtLDaghUNl+vMfObMrNP3u+EY1e77QUuMgpAWFtesgHxCnOg0m/VZe8w1
         yva9ZB7g1JiEl9Kf78UjCeArS2bG/Bs/OfrlQkl1yQJQue8CY2fTIqmESh0wYVjB+RCQ
         d026hwoTABS9+5HeddyO9tCoJaG45P4h6qQypgQkTQ2IxsSpsSfMZutj6UnYxD9V8P7y
         E90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499551; x=1795104351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ug3WNdeE3aymYiPguxRmykMUfkTG0zfl1DkHjSXneM=;
        b=2uFY7wKGTZSIgF1mdmY/FAgRxDDGB9xsBc89AK6L+mEvk+Z+UIRjhNdgUOdw6ZYdtK
         fsp/KVNZfovhXFQqAi4uSW3DKGJcYAyltDVuMckdNnDPOB5x6zAfvq7G7Fih+bWtUXQk
         0JDP8NKoe+EjC1TRpx5t4lv4thzEFfCKNxxSEL3D3BLL9POaX+2pTIi2Y9aQ13LkAaz/
         QedPx0Mocqrw7Lg+CxFK/5nrekVtGnrfw1aQsJGkbfKHw8gnIlJu7S06AXEPfXqMNpwe
         Je+z+132Xt45alRR/PDC5jrAnO7LXYzb3JgPG/c3u3dMGvQh+0c4tpmTAIH4HxT7OyEg
         Sl9g==
X-Forwarded-Encrypted: i=1; AL+hErFoUxLmrUrI3isBlZITNlVAgSy3nllxvJ5RJ4kQGNEPxaU3hhQ8lnUYHTohRpeZzmZ2RsRae+w1AbtkvZN1@lists.linux.dev
X-Gm-Message-State: APuU4Z9L1V7lBTp+eKs6n8nYoTXpvojUCWkqEYjMBW9IQ4/5di1/uppM
	LCuWB3CThNODmKV2gaulN/9PHKLZXreGVnudhKeX5lkxzkg16z6vNuV+cC2ZKwvz3PVFRAelCWb
	e5D4biwk4JDunHMUf4/tzOe9meRDGXf8=
X-Gm-Gg: AYBFou1Bf6b9wH3SJU96dD6O4XLLDzZTtwsAnL6KH7eAMuHoWTgzia/hl6c3HRFHjAz
	PnXtDlxdH7TZj0a163kHo1c60U2aKr538gRqDLsfUZCGno009LULHY0ZAGXQTfZ4ih+NpQKh88u
	J/pmWRcGLRBMvRb3Q4EskPtdCOx1S8FzhPWj0WCdi8pVz/0KA/+oAhtayWveDdj/RguslKeX/t8
	7bn9QxVZzXSWicLXoxnoGT/qzrudx97In9o3NfZ7RjVupXXXC11EMurAA/58qD0fGNXXV1T+enc
	JIUeajCiPBr/t4HNbX3WNhmTUaOnjBDqvrRprT95yyuGT4MmhUAJ7vquJnCwXXFxr7t7Pdkv0B8
	UjP7cQWdJY8kzP7F0y/T5qMFEXGUQve/twOo=
X-Received: by 2002:a05:690c:4988:b0:8b0:9eb3:dbd1 with SMTP id
 00721157ae682-8b4aa2396bdmr280387b3.37.1794499551396; Thu, 12 Nov 2026
 08:05:51 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111182330.77824-1-levinson.aviv@gmail.com> <2026111219-guacamole-quality-2ecf@gregkh>
In-Reply-To: <2026111219-guacamole-quality-2ecf@gregkh>
From: Aviv Levinson <levinson.aviv@gmail.com>
Date: Thu, 12 Nov 2026 18:05:40 +0200
X-Gm-Features: AclHuK-Xm2Vi3S7utQcqKGzEjiZ3mwFYsp-tds8eyrvh8TFkl-FsIp_ne2E9Xwo
Message-ID: <CAMAaV+gfcKLsr_kY=YWmD5qT=bV74_3MXGYvyiguoEWVxE1Wxw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: uart: replace IDR with XArray
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,
Thank you for the review.

I am looking to start contributing to the kernel and thought
drivers/staging/ was a good place to start.
I used the checkpatch.pl tool that flagged the use of the deprecated IDR.

I wrote the patch manually and it was only compile tested.

I understand that the use of kref_get_unless_zero() is not a good
practice, so checked current drivers that implement the use of XArray
(drivers/gpu/drm/drm_drv.c) and tried using similar methods that I am
sending in the v2 patch.



=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=94=D7=
=B3, 12 =D7=91=D7=A0=D7=95=D7=91=D7=B3 2026 =D7=91-14:37 =D7=9E=D7=90=D7=AA=
 =E2=80=AAGreg KH=E2=80=AC=E2=80=8F
<=E2=80=AAgregkh@linuxfoundation.org=E2=80=AC=E2=80=8F>:=E2=80=AC
>
> On Wed, Nov 11, 2026 at 08:23:30PM +0200, Aviv Levinson wrote:
> > Migrate the minor number allocation from the legacy IDR API to the
> > modern XArray API to take advantage of its built-in thread safety.
>
> But why?
>
> > As part of this migration, the global `table_lock` mutex has been
> > removed. Mutating operations now rely on XArray's internal spinlocks,
> > and the lookup logic in get_gb_by_minor() has been updated to use
> > rcu_read_lock() combined with kref_get_unless_zero() to safely
> > pin the device reference without blocking.
>
> How was this found and generated and tested?
>
> And kref_get_unless_zero() is almost always a call you never want to
> make.
>
> > Signed-off-by: Aviv Levinson <levinson.aviv@gmail.com>
> > ---
> >  drivers/staging/greybus/uart.c | 37 ++++++++++++++++++----------------
> >  1 file changed, 20 insertions(+), 17 deletions(-)
>
> So now there is more code?  That feels like a step backwards, don't you
> think?
>
> thanks,
>
> greg k-h
