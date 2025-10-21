Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214AD32860E
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036650; cv=none; b=Hy7jmZ7O/ILH5PfboV4tj4akQ078llACTViHW4/reyBrQszvFLv6Z16GcveSkT8BBHIMeQlfi23fM1f3CIv/zQ32/cx8d/uFdOX/xApehxly53qrxEJ2b8iD+qdoqWdpViUHEJkHZF8EOjlLnpBovDbIFtwEQ71twjm8svBcftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036650; c=relaxed/simple;
	bh=YYGwKIw4DU78XjYwaYwxke2dNDi4SH+1u4WyDiQEDQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTUuifWE4wwrckva99tAFYScMIynqgfvm71B2xhjNGiATqK7i8CmjfoEFmWI03dxAcuedBE2+6IWAcRilC827rMz7ZT8BHiJuOlKNiW/dParua3NziHLtZSRB5OgBBFIrpAXyjxLJI6qGCeKi+B+cTa7i+1mNMXvbFBC8aaFt30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5Ax1MAU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5Ax1MAU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso943477866b.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 01:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761036647; x=1761641447; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3LdkJEpXUwO+NWSEZVny0C0q696Pa6fK5D8TjFSc4w=;
        b=X5Ax1MAURNmIpgaBHPGvlazaCrjUjnJx1UD9flgWsCegM5zK6G9vRneCiHe8f1IADO
         K2eOjIDaB6uPE7n2QrG5PQ9EdN0FCXnB/NfkyOvecHhlZdYPeePXJqhJid18tGIRaB/l
         iBojMGiFhlIGscMzjVCRpqH2yInezl37n3Y89g/Cl7aoJ0YDmxg0FdW8xGhqfU66avyu
         ORkCCuKXyJeu7LKz1+dxxkBP//BPbwWdbBaH4C1BX4Q9mTB4wutaX5DrcLwOI0sONK0D
         ekaHRY2NBzFK5tYVFx6zOq9zt/DhWVx3KRCBxJcQ6XHInUSdRlUCg/nT01Uql7hnqZGD
         AhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036647; x=1761641447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3LdkJEpXUwO+NWSEZVny0C0q696Pa6fK5D8TjFSc4w=;
        b=e7EiorEA2s/QwTYe/1Pf7yaG578cXZpB7rmDnbiyMjOzqBGkGLcPFJES0jL1PqlyDt
         vvMDohJv1lSgnMxtW/7wcx8MxGhJMtafws71DE+wU0EuKHNXMzrc69pPrTjbL/Xjblus
         xLKEFro4XXWc9Ri1a8c/2erPO5Ymise4Bljzz08XVyO4pHQPpwSpDd9MXOnDvY/2TKUb
         QC5CywxrKZPjGSxJwXO1SpjFMKp2BIswMdsC+S50yvWyF1l6aVFdemmZ0eegcKN8j+ia
         EN1ZeQ9sjfIWzGOUSo0UGUM8OoGUbTdP75A8LLb4krPWzlEAvIe10/PL3t50GnFdu+hD
         SSEw==
X-Forwarded-Encrypted: i=1; AJvYcCX1l4X51JbbLEgphhdVWAL7fn9/4kccpkmR+m8XKamuH4AoGW3GMpChd/yzTDWyJb0TlcfVkCsNGh0CYc9B@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9qekdzbQX3z4qnxL45EdKHeyn+Ts3TDIicUnPdtkLy4Z5Fwzu
	cawvHAwhIyTXk420lwQaU8NDwUJ/+pk8PPfZDjZDaMTwmgTPHOS9R6pwnIhualr1RgR4/+oeKrg
	v5TW9wflXy/Gv64CoHaCQoxY+sFHzUUA=
X-Gm-Gg: ASbGnctL9Kx3vr53MTVBPRJg9hD97W9ID6BxYQaxIeF2ZbNMj1Y0WJRBN0imORKA9Xa
	rpmo/k7UG3kfZwxsevDSZwxCNYgaJKmMhoKT2cC2pt49/vRzubncQDm8l88Ihsk4LUvJohCXF5c
	CRdxoStS76mLYUTlP7zcIijUedws3D5PKP8W5y7QUH3voCyEUqHzhglr+4tNm4iSg2JHo+HXTCm
	NVsHjwAnfsCOV74+lC+XUsMJhNGOblkFh3UtOctc+JnsORsP/9Kuaef6qMhgg==
X-Google-Smtp-Source: AGHT+IHBY2IUN83Pw2ENBSOgJpr4Jc1uqt5wNDK5R+8Ap8x+c1BNaeQ/FRba66e2cv8DRUxHfZF+WnI79kMwhHazwpc=
X-Received: by 2002:a17:907:c11:b0:b46:897b:d759 with SMTP id
 a640c23a62f3a-b647443b9c2mr1867846866b.40.1761036647265; Tue, 21 Oct 2025
 01:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251020-staging-fbtft-ra8875-usleep-v1-1-9592dd390c13@lukowski.dev>
In-Reply-To: <20251020-staging-fbtft-ra8875-usleep-v1-1-9592dd390c13@lukowski.dev>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Oct 2025 11:50:11 +0300
X-Gm-Features: AS18NWBqAmjo3KOZJeoj3rpQJcbhQ65NoVyhN4fDfDmM2riHc6TQ9QZuK7Sh_wM
Message-ID: <CAHp75VeWGAyzAFBYSQS7FGpU1eSRo1Egrh44hUpXJgYZhFEkwg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fb_ra8875: replace udelay with usleep_range
To: Olle Lukowski <olle@lukowski.dev>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 10:16=E2=80=AFPM Olle Lukowski <olle@lukowski.dev> =
wrote:
>
> Replace udelay(100) calls with usleep_range(100, 200) to allow the
> scheduler to yield instead of busy-waiting. This is the preferred API for
> sleep durations above 10 microseconds.

...

> -       udelay(100);
> +       usleep_range(100, 200);

Besides what Greg said, the function in similar changes should be
fsleep(), it will automatically choose the best low-level API for the
given delay.

--=20
With Best Regards,
Andy Shevchenko
