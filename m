Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D811226BDB3
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741290013; cv=none; b=knVvmN6zCwoSw07oZKXamFbPYGgvJngJHLR+9NdK+THiqdd5qKt1DbaDc/mRHSXNmXjTYSR2nODUDQMiz/4ZASZOw663vdvZ+0XRzAyeMsijlXAB4UmoLKwBcrSN/cxukISmr6UsiZKhIpQdILIKMei5WivCOQ7aYFW0narg0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741290013; c=relaxed/simple;
	bh=CFtDuLIpuU03+nhtMAtX9r4UPxfCF/bDqSWeFl/X5vQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GyranWP7p2bViOEAQH5OIdkB9xR5+GPhy7/f1DT4k+Aq/HdxgGwp/k+GG4jAG3sryawjyRKycABlTN8DE/L2c2CxOgputEx6JEHtxZq5UuA8f4GWWNVkMZU2hAidWz0Fs1biHg9J+9VT6Aw06LTbZ/DcX8Tj89OjeDxiuy0TuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv7jCzFw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv7jCzFw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223f4c06e9fso21134625ad.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Mar 2025 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741290010; x=1741894810; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ewCB/nm+A9ngd0jnoOxdtVcsF/YbNlLGD5eMN+wHgAQ=;
        b=Sv7jCzFw4iBIhqL9wjewuedsnXRcUZhW4gXdCz3HjHWABGSsV6bWY0v7jJqyozdfBH
         +o8a7gcfwiTfo1OMNhoW2ejfNiDIHX+qBwGCkFSS12wVhS1uLePanP30xneepm5jzfG4
         bbFMNZTvJFhacg3BEJ0sneFBWCfRynOTg33c9T7tkLDdPdBemLReL777Micc+M+zhhxp
         Z7OKzMZow5m9GZmlfDi042mgHWlqTVrksAJvW/0uraHoNvtCj4sQJAHVIzTU7fqDQqAt
         d7xRaZtpPYch1em6pjUAiA+TyoMEQ7tvcsu2G4TY6GZWxlTTgH0g5BLhsurfrYmsdi1G
         mubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741290010; x=1741894810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewCB/nm+A9ngd0jnoOxdtVcsF/YbNlLGD5eMN+wHgAQ=;
        b=HDlSdaI4eGOBp+JLR6kV91iXCZvlSR9kinUFk4NC+J/aswhLZWJlUE9+HsYBCWAqw9
         Jvg4uuSuGkqGNJJt0aNyfb0k+zQwIqV8SLNFENuYeNsnBpyCJEhX6VD9nNhXky8k5BM7
         7fEbSOpVJmUW8WUPAp52fhhL8IXXhBt5b2AlSQ7P1OlIIogAaDRBwBtXzqq+rnhJr1e9
         UQwiwZ4VeEkOYc21GVd19ltPJAh+utLVctn3puCuSTXa2Q2nzIInwtHv7I/0xQXpbsEK
         ZrZmw0VwNdk+w4TUxDFVWbMvKLEpGZtljtfuJKCOVl9i7Ru+tizn4HAnWPidQ3ktxflk
         +dyw==
X-Forwarded-Encrypted: i=1; AJvYcCVN+Divf36jSZ/3/85HTEw8oj5oge2HKZoHuogca+hjs3htoqaRSztzSuNfgvZk8taeq5POzp8YFd0HI6Ag@lists.linux.dev
X-Gm-Message-State: AOJu0YzJEKD2hmJomQqOyEJllmds9XB4m9370rRRSIaRA8afc5WkNZNv
	xRV7yqFvCFBIOuDK/mDWTu4gOdNBC/HoPyuxZEXmiLjGvBTl1bhO
X-Gm-Gg: ASbGnctR1ZlXX7V9S1kBij4nO9XGI/eBKMi5qjtECyDBE7CcR2HwMorx3xX1pNBz+as
	oZFYtgXdxKfWmei7XrNkGzIwHhdZSNBY2Gc2By7tinkUkzOUkJufPA7SHPj3QL0TUDMZWT+Rfv9
	r73bwDBr1qctJnSvtbxEXQtgn7b2cHCZzxR6BvphNK/OQBOvOXlTTeYYcyILEachKIvtfgX2wfj
	eO9jQGjls5hzWaC2emZKwWVo49QiEhS8QzgjQeqFhbIeyn5POlT5ZoCa2RqIesXQ1nzCr/oudI7
	YAfb6Y6PuSLQE41QBgCz6v8l9dYfg2OhSmjoWDhclSz8s9KTGo5vLSWUHfF+wT+K3vF71riI1Z/
	lQQTb66IIAkNgzkg+bSU=
X-Google-Smtp-Source: AGHT+IEQMyjX97Nt8KzVYICwQGtL7t0fOwHtki0gYYS+FzmLNhfE7q4pmhk2ZkcLJLMumQ0lloKrXQ==
X-Received: by 2002:a17:903:292:b0:215:58be:334e with SMTP id d9443c01a7336-22426fd8525mr13145525ad.10.1741290009936;
        Thu, 06 Mar 2025 11:40:09 -0800 (PST)
Received: from ?IPv6:2804:7f0:3f4:754:40b4:b78f:5cfc:8620? ([2804:7f0:3f4:754:40b4:b78f:5cfc:8620])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa448dsm16304945ad.210.2025.03.06.11.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:40:09 -0800 (PST)
Message-ID: <635f849e14854b0db1f53a0d0bf329c3070e5859.camel@gmail.com>
Subject: Re: [PATCH] staging: sm750fb: Fix CamelCase variable naming
From: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
  Teddy Wang <teddy.wang@siliconmotion.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  ~lkcamp/patches@lists.sr.ht
Date: Thu, 06 Mar 2025 16:40:05 -0300
In-Reply-To: <ba45d980-c6b1-482a-8bfd-457a92d3e24b@stanley.mountain>
References: <20250228162359.14029-1-lima.gabriel.luz@gmail.com>
	 <ba45d980-c6b1-482a-8bfd-457a92d3e24b@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Em sex, 2025-02-28 =C3=A0s 20:40 +0300, Dan Carpenter escreveu:
> On Fri, Feb 28, 2025 at 01:23:54PM -0300, Gabriel Lima Luz wrote:
> > Adhere to Linux kernel coding style.
> >=20
> > Reported by checkpatch:
> >=20
> > CHECK: Avoid CamelCase
> >=20
> > Signed-off-by: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
> > ---
> > =C2=A0drivers/staging/sm750fb/ddk750_power.h | 8 ++++----
> > =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/staging/sm750fb/ddk750_power.h
> > b/drivers/staging/sm750fb/ddk750_power.h
> > index 63c9e8b6ffb3..33e852fe6949 100644
> > --- a/drivers/staging/sm750fb/ddk750_power.h
> > +++ b/drivers/staging/sm750fb/ddk750_power.h
> > @@ -3,10 +3,10 @@
> > =C2=A0#define DDK750_POWER_H__
> > =C2=A0
> > =C2=A0enum dpms {
> > -	crtDPMS_ON =3D 0x0,
> > -	crtDPMS_STANDBY =3D 0x1,
> > -	crtDPMS_SUSPEND =3D 0x2,
> > -	crtDPMS_OFF =3D 0x3,
> > +	crt_DPMS_ON =3D 0x0,
> > +	crt_DPMS_STANDBY =3D 0x1,
> > +	crt_DPMS_SUSPEND =3D 0x2,
> > +	crt_DPMS_OFF =3D 0x3,
> > =C2=A0};
> > =C2=A0
>=20
> It seems these are not used.=C2=A0 Just delete them.
>=20
> regards,
> dan carpenter
>=20
The dpms enum is used in the definition of the=20
ddk750_set_dpms function in ddk750_power.h file and
this function is called in ddk750_display.c on line 158.

If I were to delete it, what changes should I make to=20
the function mentioned above ?=20

this is my first contribution, thanks for all the help.

best regards,
Gabriel Lima
