Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ABE1A317E
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 22:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743719885; cv=none; b=saVkAhKe0xn2YZXgpGNDqHWai7NKP5mBjPjuur9tIOz6Ryf9kjfdrrcKP1QmZXtJ7aL2s1Sg45pdk/IBX7av41pZb5aZI+ehmPF3OrQLo7dTzbfYvZzEgCc4NKcbIgbj5e8kFPZKoDPK4myZN9eCUaW38pBlcF8NEiy9kDfOXE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743719885; c=relaxed/simple;
	bh=zaM0dqs6hXmFjWycbkD0Nt/9XcQIztBGYBwn9DyGL3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJAQGzXsRDuwauw0XCv9tpZCvC+u/y8hmf9Q2y8Fj9k2tZ3o7c7W+Scc8Qpq3dnXdYFVkgNIsq0xtG6ofnu4gARjkZFFTLjkWF4kRe4MtDM/gAZ6tN2AZRhJ3/WdfZeDJquEAphNgC54/IwxbFqH1TvchoBfkMK0bsANKkYfDnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gED+XtME; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gED+XtME"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso2159525a12.1
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 15:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743719882; x=1744324682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ6K1JP10UBnpc6DTNs7X/b6jJulOtNE7dgvrXsrjCI=;
        b=gED+XtME9iDZ6p82GlO4s3VzZ8+lGWeDfj7kky+xS6BeGMrIHBEzN57oqgHbR3ezAb
         Jv8GxjLajB2e67DZAm3iLcgRx3pqJJINW4PBIs4qhIk5ul9G839NbGoidpo2yFp2166s
         knQG5jvHR2qPPip6mFTC+oxQNlLHYtVRfE8QWlJMEyX/FgTWd6UTEdAJB+j95dYUiLwN
         ZKCaocEkgr+4hXU0d6KBUMilD3sbs9wZ2VWaX34WaGoWv4JVUnWrlOeDFrIf/hI51C1P
         cCSsQ6aPlM3O6Vrs8VrLOm3sp+Qq5WxBVyBek3Ykqc58tmN8sfA6jbBX5IZ1hFLGdR7a
         BKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743719882; x=1744324682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ6K1JP10UBnpc6DTNs7X/b6jJulOtNE7dgvrXsrjCI=;
        b=gu9rGJRgI1v1IM9pBfJtAQWW/fL33P/GExtjDmTz49Myk9gL86R8U+i/eE3GOa/gV0
         /sZ6oGaA/rTxQ6RRzCPF5xvXdP9nK3Irws1D4dzv4lynnRa8EeX6mbEe7iRBlVGD1N6F
         tHT0UXBZT700w6kpS0rWZMUq4ARtLdLc/IjbSHFyVSTlTlEy9oo3O6C253hpd7YKGDmD
         KyUBLPlsyrRnTTxhKx5ytTsxRzQstkK4Z/OG22EvTnOkY7fzXRsBWLTKuU7Z+HFdTNko
         Y+0KcJngPgAkJ/N9pkIdfeLlbxRTla6w2sfOZhmUbwR4nmr2+kMD5CyD9drnQseMZpU6
         cBfA==
X-Forwarded-Encrypted: i=1; AJvYcCUEcQNenR5MmU4QoND4TeSZcVd4Ao2V/dzTesfg5Rfb97xpG4TN5P0IJOsxCiIglR2hy+Oo0DxGppjOxecm@lists.linux.dev
X-Gm-Message-State: AOJu0YxylYymbwJYbwAW1lwFjyFfvS++Z2btzwWNKsecMj4OpPuDKHDe
	NPFc4MTLjEMjDPkbFM2PnUvV1M7SXdaRBQGgqPBJ6OhymEbR9vszhRHezA4vwm5Z4t+jzTa3xVC
	RaY9Rfe+/sjqM7GqZjalaI801HeE=
X-Gm-Gg: ASbGncslrJiydiA/2z4zHMkQpuOsqRGpzNxGWX6EyQw6pAVLmuRh0JmzJq52Tv/LHC3
	OgtdDwdFHbCT97u1rf2wvsZliqjg2d5YFtfrZJvnhTCMEuSHRXrQYCqVoO9wQE3rOtB9p0kfamX
	KR2mlT+TBF76SXA9tXVTq6f95a7A==
X-Google-Smtp-Source: AGHT+IGEP7WnNSh6HYTyjnZSWPMhY0n5hrhx3hnSpfSMjdSZBItxJqvw71uEdf0SfOoYMMZBoucnZPVuVO9LWzm64Qw=
X-Received: by 2002:a05:6402:2709:b0:5e1:8604:9a2d with SMTP id
 4fb4d7f45d1cf-5f0b3b65912mr685521a12.4.1743719882267; Thu, 03 Apr 2025
 15:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67ea5813.5d0a0220.293276.775e@mx.google.com> <2025040301-tightness-giveaway-a568@gregkh>
In-Reply-To: <2025040301-tightness-giveaway-a568@gregkh>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Thu, 3 Apr 2025 23:37:48 +0100
X-Gm-Features: ATxdqUE7EuV8mvnSRPJ_5BA5rAr5h72HjMUScB12TVQyWh-pzOcniirw44ZMhXo
Message-ID: <CAMyr_bL3sh3HyL0=Qb1h21_-5dqJy0M0Ewo0JMFPNr=x28oNgw@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: modify function name to kernel code style
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Yes I did send two different patches (part of the reason I used
different subject lines),
they did similar things (change camelCase to snake_case,  I wanted to
get all done in the file,
but I learnt it is best done one at a time.

So should I have it all done in the file (there are more than 2
camelCase CHECKs), or send it
one after the other? (but you could take the first).

Thanks

Richard Akintola

On Thu, Apr 3, 2025 at 3:18=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Mar 31, 2025 at 09:53:36AM +0100, Richard Akintola wrote:
> > Change camelCase function name sii164ResetChip to sii164_reset_chip
> > as reported by checkpatch.pl
> >
> > CHECK: Avoid camelCase: <sii164ResetChip>
> >
> > Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
> >  drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
> >  drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
>
> You sent 2 different patches with different subject lines, yet they
> almost did the same thing?  Which one should I take or review?  Please
> send a new one, as a version 3, and properly document what changed
> between this one and the last 2 submissions.
>
> thanks,
>
> greg k-h
