Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040227F01E
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775904477; cv=pass; b=hhTA3cbWUNDiRCr/QIrimXakDIA0vPLUPUxLW/gz+kJmO3ya0FvIH40GYJQL+m4aRhAA0HC3uw+wgt0bF4rs7iKkhbq5fLGAzA8lfdD8BvEjCfeUraxqW2kkxS3IBL9wcsJJ9guwASPJ+2rglWNffeWgesZDtjEThPl5atPLaz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775904477; c=relaxed/simple;
	bh=Jaiw/CtrOM2is5N0FH5ci/nmVUYsUyzkXaonVvz2MA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1f7ujSLwl6yD7Pc2gDa+2qrOsqktrs9mXGLoOnLEhOz7QUbadZ+izCEJb68mzHCB/AL4/FNj7Ux4kmUHb/woc7tzlw9L+UnCHAzpei1tgtBAPff5jcd6moQzDVCQN7FaxSjkeHphFXkdREbwCvj70CjMYpzQstXAq8wrzHnMcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKTYigfW; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKTYigfW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so18269795e9.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 03:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775904475; cv=none;
        d=google.com; s=arc-20240605;
        b=JBqUo0gyylvARji4sVnk/cbfGaqO8nmXN8r30j34ZQfG9qoXlbxm94AdxQOqHdTypt
         6K2TchYLVQ2Kj6hPFYl5BSNyzpeY44W7PVVoekXmyS61+l8ZwuLcNOlt71sNAG6HwKui
         R/LSlCZrhLkV/5fkbdpz7Wbz+N6oivoLbPyuzzxHSiB8y9J29+8FL/v1OaAw+dfMCiC+
         lmNu9IwQqEjekWY6F1+I20/J/5w8OLjYs+rL6tGEeDBRLEJmeFBV4fAhpKehQbzvIWW1
         vAHr8XePYsJuiX4qweaO1kyxStDKw9tWPraEw1lUTxYQCVpS28I+UyQqoo0rzFw6sKW8
         6pfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DmNI7AJuvLxMtrmh/q5YuERSquxF+CEt7z6izdNoCV4=;
        fh=tL0dyS6LfAsSfxGrMYL2DMZOASDoRRrdTIhK+4v5WG8=;
        b=McK460S8/UN8soVmQy1/0uuk+4i9OqBDBKqOfvbpX+zwJOMy/sEt96Fx88JrfjCXAc
         G2Me2g5BBdKqUKLaHkFxUXuEZLVkPC4wLlRp+N3hgh+O5FmdtJIDm3yZiaEyIkszT+gu
         fG34cqlEzE65PzlrEj6DCPjOU7hLb4vGwYSbtQE57BdkhDIfK6ka9yJoZ6pgnGzp91iZ
         DQC3ZxqaupXpBEv7Kf8qW2I2PXnVqlyJyDxbbeaGHXHBN8XHopy4GM3nxmsxaGeSjwjJ
         TAmZTrbkkdCA7CHh9Qn4cwK0TnPTTMaa8lyCr11mDYgFbKy5ppNbl4Gn7mJa77BUj9gA
         oVDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775904475; x=1776509275; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DmNI7AJuvLxMtrmh/q5YuERSquxF+CEt7z6izdNoCV4=;
        b=EKTYigfWLAi86A9Jl9ipr+SyYQbEwOPhfXOpLWGbj5a+jEtCbED9I//UuT05GVgGFa
         AuppKm2RpQJZrBjxfA2Q4M9Sc2KPR37SKNpV4fNI5n2BDuW+SDvawtbZNoVASS9ghow9
         tnz1qLiFOKvpKWT+cEBTqNhDXMJXnEwl9HLfJk/MMmCVWDi8C/BwyHHSLeIVnY5aFd3G
         6Oha3hmkhjmI+0RdDZoO6/I7sLh3yXuJk4kgh8ltsNK+lgejH3l/+bzCZg/9ZkMH6MgN
         oo0KY8rixKclOtQ7UtA/WsqVePa8Gb6o4BrLIE1cKvJG/Dz5Oc6hqM81qP+Oi4nI2YcF
         leRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775904475; x=1776509275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmNI7AJuvLxMtrmh/q5YuERSquxF+CEt7z6izdNoCV4=;
        b=SgJX21j4w6vhgVYJZZC/YIhQwKvFNPdOL22FYFjzM9+3EV6numeLD79rkDpb1zaQ70
         Rva4r+s0yqS+peMdrJdiO+sdZ5UWcjPBTmQXDz7D7pfvqc76+zT0DJFY3dnRcitaRCXc
         mjtD8NZy4zZ3usM/8YBTwT0mBI3Dypk8X+LqCqJQXZ6Grhr4h84gnK4BNCqnMth1puqm
         N5Ltpw+28+5bVB016y7fdJ9NIB5/WdinBierzC9KHbziYXvRNj/Gfv4tKqXo2Hd5LCCN
         tocKArwU0n2elfOwKfaBhjyBLJGRwniHBrxm3WuX5hG8j2SID6mv09BN7aQGbdkupGXp
         vQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHyGDELAZxHz6fDY69uw2+pX8yjLoGFfrGv+goNpsOnWBkUCylWlizLtyW8tNYuAwzR0wI+s1Qx372GnQh@lists.linux.dev
X-Gm-Message-State: AOJu0YytrojGBwYJB9yDkX33dTvZjjODECPNSTLsV8xZ1G7/8GqbOjiS
	PX/FPbEWqTJr2MlnY8Q3x++sr2yOo/vvWStU/uOocmwmtwoTPfayMCaybfW8cqQqW4V0ZHynAr+
	Z2ua4Si9r1a/jd40FmPAKEO7F0pC+hqc=
X-Gm-Gg: AeBDieuVQrep4jB6vx52lzx8TCtk7mXN5gKw6snP0DUxkCm1O8wc7t73briNVZlGhv6
	i8gK3dpy3nvApsBOcxRUdAIm1P6HAwHdermCnjuf///iBpRboIkOZyfMTPcSmFDVpU+guv6CHlE
	kkS+jQv1Z+1V6JrQLahjv0wDBh7JgnvHAX0URlShjr+N9D16D5ARaNHBvW4nqm5+dJTX3FvW5k+
	A3eTXrr6znUEVeIkAQZbvyDUowfnF0UHkje+MxF0yRjmxAkhQTofDldvVTXbLATfAkjqcaO9G35
	0kySmcmRlLrBa654Y+i2UlV/K6p9+nk+W6cyE6Yu7HKaCR/MkEqDnGJsUPBjm8LjzpuihyWI8OO
	V1kIiJr2NJ6I3CsAUv3JHRrdp+6D+qBADT048/L/LdTAyaS0p4/LxQJehVWCznUdu5EMcdd6lGj
	buIa/S
X-Received: by 2002:a05:600c:4493:b0:488:8be1:ca3a with SMTP id
 5b1f17b1804b1-488cd68d7e7mr104288475e9.15.1775904474946; Sat, 11 Apr 2026
 03:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
 <20260411085848.75381-3-joshua.crofts1@gmail.com> <adokoNfP-Ueg4yQ7@stanley.mountain>
In-Reply-To: <adokoNfP-Ueg4yQ7@stanley.mountain>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 11 Apr 2026 12:47:42 +0200
X-Gm-Features: AQROBzAf3TqcDLwY4c3HcxKa3Ga2J1SxiGhSJttRc85RFQJIE3ePt1FJX0WP2zQ
Message-ID: <CALoEA-z0hkOw35D9suEKi61x12fNSSzYem5pecCFj0w_EwLHvA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/2] iio: frequency: ad9832: simplify bitwise math
To: Dan Carpenter <error27@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Apr 2026 at 12:38, Dan Carpenter <error27@gmail.com> wrote:
> >  static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
> >  {
> > -     unsigned long long freqreg = (u64)fout *
> > -                                  (u64)((u64)1L << AD9832_FREQ_BITS);
> > +     u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
>                                                            ^
> This extra i char is something I really dread as a vim user.  :P

Damn, that's embarrassing... Should I wait 24 hours before submitting a fix
even if it's this trivial? Thanks.

-- 
Kind regards

CJD
