Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D02CFC0A;
	Sun, 20 Apr 2025 01:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745112183; cv=none; b=nexsiephY7LVqeEa4jeJAUt8ozWAcGGkMZ/o44WkwrPROe7fFaffE9HRwmBocSfXh6WWDEt6cOSj83ZnDARKMOk3o6v7UN8YMYijaU6WkRlsFZXANUKQafssdjipTU4Uk6ebtkoDmFYXzdWC5L56sRSH2fM8GBrUDpD887ZZewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745112183; c=relaxed/simple;
	bh=KhWPpz4h7daNdjBLjmP9Myi2nI9UnnKN8WWqx7NZ9gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7LFh78CPZBpsvv5xukRcGoihUriEyPdNq3MPcsa4U3YZpkU+fsC+hHmm3/g7dj7ipW4rRx87gQtlFvUuIojZAd/Pu/kUWISyVypXIeIbgOYIfqtaehesbyurK8beV2+bEiSZ375wpmFV6IwtvBEYsburaQj75JQ2Z54zqz8tIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7QzJq56; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7QzJq56"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4766631a6a4so32187401cf.2;
        Sat, 19 Apr 2025 18:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745112181; x=1745716981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxyqKswJBcd23O6PGhjqBc5AEkx9ltkxdSYxex6zxdI=;
        b=D7QzJq56eh186eNQi5IRin/3gCh6JRvR3Syd9UxoPET4SX0wFJdytOTIrqTi8UyH5B
         5AFo5Eso4A3dINMIzNNRCoYHOaqqSkzZqOZMeZh2t/9HndNLyDAwUK2SILI1KbZ3tNab
         2eQZA8nk+9wCfy18ycFwFwE/OG/Bzx2Mnlujq/qM97qHQxj/MQ/PON2N4M9KkN8fuCRu
         AUaqLsIUxxK56fglTMlrQv7/v2Y7yw6Rwtl+jTfVLMvorf3KXo13wMAco82h+C841qKO
         /hVkqOrpiT3+xu1Qce/6/xChiVHUwF60FHVDiG5lDY6m1vK8YFwSE4F7NZYrya/ix7fD
         uDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745112181; x=1745716981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxyqKswJBcd23O6PGhjqBc5AEkx9ltkxdSYxex6zxdI=;
        b=CjXSEMpdPuIPy6H7/Ka6B8cK3KpQsvStVwMWYwM1H230qlU+trE7S8+sp7vbbopbbq
         wTOgFrbxwcWh+7Lo5fYMJELN+liKCnCJtkN29Fnf07PAvHg2o8hCM65uo4og682rehkr
         iiwPbQRRhfuQmlF1uSI6+yXSeO4+ExlgEV313/oX/aExp1K5Q4JyUZiQrCLR4VKHBjI3
         hRdjBZ38IUJnt566EtnTKs+N20PIw263I5f70lAFwwn8621l2upircXNO7LJWlCtikUV
         rAJxFBdc9HG/oL9W1HavB2FGpLpdeo7mrCpUw7JMXTMb4c0Tm5966yO/r5PX9v8ZjkYY
         sn6w==
X-Forwarded-Encrypted: i=1; AJvYcCVCR4OAjzVqD8GD0Yqg/I+j86MRo7pJAmHqrxeI6vGldmd4qii/AgBKpZ0Fhw1WMTYLT/UhdVmFpUoRcxiPSQ==@lists.linux.dev, AJvYcCWKqGf2vAT9x4eHhSTnxCy+/BaeunDilURNPUMX4kbioMiTcQLvrsTL0WHIP63SexhI2vHYUaL73H+sYbDX7e9HLR7sMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWtODa7iJIeMfWO3o2TfqqTG+TOmkpDYuxr1qunbcwFT8OKtdx
	R3awLNlmldhBVWRRjmpvFtUDedVX+cQgBfqZuaoRMtB5+vurGwDsnwXscYDGSQYVILX3HnwlYkU
	UqqhIwcZQD2YflFrN8HxRUB/f3kE=
X-Gm-Gg: ASbGnctK43aowFpsK6/na1B0dqdV3RyOU9VKiMY5POI+JQDz9XjDMXWBIqQXqrsA2H7
	uoF2N9zMIP6q929X7S5ZNvD2nzIfsyPmPHlwwxbZh/7k0U1FV+CXbO0gux4ALnOiOySL8x9O4bq
	J4MRV46NR9hy4t3ptKdxFUiq7R0W8G1SdNFNfd8LkmQ+tHrSI/g1Oohw==
X-Google-Smtp-Source: AGHT+IHnGYfQbcn/WQ4GGhGvsjwawX6Nw8SlnXZV+4R+WT2w1WZDDggokc+Xcz4rzl26ssEHAwXyrnla530dTrhKrz4=
X-Received: by 2002:ac8:5795:0:b0:47a:e6d1:4126 with SMTP id
 d75a77b69052e-47aec4b7548mr137854241cf.39.1745112180995; Sat, 19 Apr 2025
 18:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420003000.842747-1-gshahrouzi@gmail.com> <aARFqG--oRuwhUmR@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aARFqG--oRuwhUmR@debian-BULLSEYE-live-builder-AMD64>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Sat, 19 Apr 2025 21:22:50 -0400
X-Gm-Features: ATxdqUEwYPFWsnNKLSE1Z0Vm8Bl984yRpdhp0C5WBou58d7ANseU5iYMDnK16UM
Message-ID: <CAKUZ0z+aBu-cLKqbU6nHjSPDWzdF08z484p+s0tqMM1c1rTwXA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: iio: ad5933: Correct settling cycles encoding
 per datasheet
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 8:52=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> On 04/19, Gabriel Shahrouzi wrote:
> > Implement the settling cycles encoding as specified in the AD5933
> > datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> > previous logic did not correctly translate the user-requested effective
> > cycle count into the required 9-bit base + 2-bit multiplier format
> > (D10..D0) for values exceeding 511.
> Hmm, the above description should probably go on the refactoring patch I =
think.
> Otherwise looks good.
You're right - will update that for v4. I don't think my description
was accurate either since the old logic did correctly map the cycle
counts to the correct bits. It just didn't use the correct mask.
>
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
>
> >
> > Clamp the user input for out_altvoltage0_settling_cycles to the
> > maximum effective value of 2044 cycles (511 * 4x multiplier).
> >
> > Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 =
Impedance Converter, Network Analyzer")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> > Changes in v3:
> >       - Only include fix (remove refactoring which will be its own
> >         separate patch).
> > Changes in v2:
> >         - Fix spacing in comment around '+'.
> >         - Define mask and values for settling cycle multipliers.
> > ---
