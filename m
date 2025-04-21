Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9B7B640;
	Mon, 21 Apr 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242741; cv=none; b=o6+GjYogF3f5YwxGSIXmf5MTSz2koF0Nf3W9S/p5qyVO4+TH3NM6TXKBRNEHn2YQrBbwOYM3M1doyD3YCGjZnCNTnQk3EaTzKrXNOLOwlVxRcmrBQG/Ku1JYjVdYeXrxPmuS0FDfjHC1Utj2uKhvmPNUmA/l8xYmter0FGho3Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242741; c=relaxed/simple;
	bh=8lR4YawUzxF9gm3YTPikm58kY0KHQCev0m6IyQOjNmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kt7fqhrSjASoCz5MI0Qqnec50p34yIdiQpuu2OYhJqgKwt70calMqawycaBhYJTXValrfMBZ1rSx5SdH0wDaa8R7EgSknZNcwmEoipBUKlgMUgCS1nPEBhvOWzqwhoVkGQoR/6C+v9WASJvPwYP/gKAPMuJ5g0KohMM8evnZDMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSlnvWeI; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSlnvWeI"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476f4e9cf92so28345941cf.3;
        Mon, 21 Apr 2025 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745242738; x=1745847538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lR4YawUzxF9gm3YTPikm58kY0KHQCev0m6IyQOjNmY=;
        b=HSlnvWeI4U5HnLPyGMoKpkqW0N23tYSUOamEGn2y2iLFAUGv3WP2Pk5ban3z/KUf1K
         1kp4EiDYFX3P7CAN/bjhhVH9k6El0bDliOPaL8rSnKv2eAGMNQgigIkLbZ5J20a0UX2B
         r48FDA2scXnhd2Ei/QBVAKn8HMHqxywfujwUsoZpCyvvrg67JuhOpalNyHsByL6c9qLL
         pP2bCBbiIcOe3iv5iUtgiav2ld1oAOV9orDyg/OTRlHDOZITeBF32uBCOWo5vbxUxh/E
         2UWX6BjDhhNzw9zha4nx9noMAUOVa4kmGORBGJZzwDPY1iHmKJuWy1KQ4NU2/T129NBD
         yYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745242738; x=1745847538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lR4YawUzxF9gm3YTPikm58kY0KHQCev0m6IyQOjNmY=;
        b=ibQCdCnrPhe6TyklVNilLmimCkrdvJrH0QWSjBtjhcSiHw15uNXgs/VelVWTjthkeS
         AdwvwkRJnnjuElsy5juGNnHhxGdtayaXkuQP74iBjYmQnLSPYIS5njh/8/IYlLL0unqe
         5wJSTxXI2Z09rDmMtEzYcxohq4UyKPT5emRksXP+c3VFQFi6iKM2YEUIJVkKX4xU3klQ
         oMrK9pgEH3TLUFsXDJYYvdFO9NqGMU8R9mw39tcEkhWDEEOnN40iyEqfeSOE7B5fg+02
         cvnB0Oocazhu59OlPjk+IZZfh02DGTxODnrwnWqcZECBkasfgPyPgpqYtsNhzZmN8uQK
         YLMA==
X-Forwarded-Encrypted: i=1; AJvYcCUvQsLtmYEEIjaLhCBB7xOQp39+U6wf28zRtwo+Opatdr7IoCQOlYNDebsH38EpiYyU2M7Eq8yNNa6QkfX+kQ/QFG1PDw==@lists.linux.dev, AJvYcCVFTKvIQMj95WWqPKVgKHrlU3PZbbEFClvaVBlGfMLSfV2uLqP/hZjwiq3GYR2y6t5oeMo7h1qJfNwOn251Ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCFvoKqctUsQ106DZvgMMD8FUuQUhap55AeC+D+7vEqB0Kr/T4
	0Nko+0qr4S8LEsoosAMj5XeSlxQnmgIdn/FPVzbJhwYnrIIw4FQnPRkmjI4IN//4WcG7IfGNKDb
	bjZY8PAjmtJktyJ7xUXb9CnoGO8c=
X-Gm-Gg: ASbGncvvPUgMxkUkHCQ3YVwTW3foqQ23FCSk7PeBT/EmToFvZg86vbRYwNXkl+iPt+4
	WjhhlG3+35Hxs+vJZFpGQaAHrbiSHs7GzDByuP/KGdgCIKSS0CcIWQ7dFqdRYFKfRk8DzbxRS8Q
	rMfwMYh/iQloA9FTETLDciKQ4m8BL+z2mgVABhs2IabkIVlPoZ+a2HJw==
X-Google-Smtp-Source: AGHT+IFDANpJcqnxiNwpvLo83FTQELypzcIlu5k2ebGCf1WLDh5Z68JcqVHI4AdI9K1kJkqM+xd7gDHdkC7A/R1Jb/Y=
X-Received: by 2002:a05:622a:1998:b0:477:5d12:aa4d with SMTP id
 d75a77b69052e-47aec4c3d22mr204747991cf.39.1745242738187; Mon, 21 Apr 2025
 06:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417135434.568007-1-gshahrouzi@gmail.com> <aAQZrhBLQCa0TjOJ@debian-BULLSEYE-live-builder-AMD64>
 <CAKUZ0zLMAZFHwvuqfoL6JZfphYRhtjkqOyi50_ZffbA7-4MCew@mail.gmail.com> <20250421120749.66b04533@jic23-huawei>
In-Reply-To: <20250421120749.66b04533@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 09:38:47 -0400
X-Gm-Features: ATxdqUE_17qAcsPlqPvvpcyUwPKjF9_hB_0h8fmZDEfhDjZVt-Rp-IXf8BtVm1U
Message-ID: <CAKUZ0z+AvV6XMk3Fe+qKs+DnUHESKjj6pwSNmgSc-PaPKCCWGQ@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency: Use SLEEP bit instead of RESET to disable output
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>, gregkh@linuxfoundation.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:07=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sat, 19 Apr 2025 21:41:50 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > On Sat, Apr 19, 2025 at 5:45=E2=80=AFPM Marcelo Schmitt
> > <marcelo.schmitt1@gmail.com> wrote:
> > >
> > > On 04/17, Gabriel Shahrouzi wrote:
> > > > According to the AD9832 datasheet (Table 10, D12 description), sett=
ing
> > > > the RESET bit forces the phase accumulator to zero, which correspon=
ds to
> > > > a full-scale DC output, rather than disabling the output signal.
> > > >
> > > > The correct way to disable the output and enter a low-power state i=
s to
> > > > set the AD9832_SLEEP bit (Table 10, D13 description), which powers =
down
> > > > the internal DAC current sources and disables internal clocks.
> > > >
> > > > Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > > ---
> > > Looks okay.
> > >
> > > Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> > >
> > > Unrelated to this patch but, if anybody be looking to work on getting=
 this out
> > > of staging, I think maybe this driver could use out_altvoltage_powerd=
own ABI
> > > instead of this custom out_altvoltageX_out_enable.
> > > Crazy thing this driver doesn't declare a single IIO channel.
> > > Seems to be somewhat ancient IIO driver.
> > I can start tackling this.
> This has crossed with a series from Siddarth.
>
> Take a look at what is in:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/=
?h=3Dtesting&id=3Daa703203cbbca22ac46d42d4cd41232491827152
>
> Please rebase this one on top of that as I think the bug is still there?
Got it. Yes, I believe it is still there.
>
> Given there is work going on for this driver and the bugs are ancient, I'=
ll
> not take any patches through the fixes tree for now. Instead I'll just qu=
eue
> them up for the next merge window.
Got it.
>
> Thanks,
>
> Jonathan
>
> > >
> > > Regards,
> > > Marcelo
> >
>
