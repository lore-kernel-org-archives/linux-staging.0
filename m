Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C132B111
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781426588; cv=pass; b=VjTjmersGsw7jsl5UC56XcX5jQrDChvcIUANlNRqO2FIV8kY/91SRu66JAJwtY7DAvvDFKdkaNkgTNoAdzR2v/rg8F3Y/gt3d4wCjGGAolwLkx5kECQgW/lUjIT18Soo9CcpH41LHtAVVst1b58o/vJKQXo/jr0XGc1Y7/P+GkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781426588; c=relaxed/simple;
	bh=b/JTjxKKJpzqGDvlvtouDIsi38hBlVlzK+Qu5z64Vbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktsTzyA6Suv4hOPQ2j/jbIgNPW/ilu7UJJsOdgOF+QEXzkGOGwcPzHmZf0isdvFO0RbtWpOhxBBSbbpBGZ++S806BeIKQl/N2bGzgQxW1jPnupGvPacAesR8AeS4AFYY5kbmkkmpRAwWZ8eTYS7TJ6LZ7UhlTMNfeC4aQDo2zZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLRCYhWf; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLRCYhWf"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6deacafa8so2129632a34.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 01:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781426586; cv=none;
        d=google.com; s=arc-20240605;
        b=CmvZIAgmHXFxauU0POmF31nA3yTDmEvw526NNg8XnqT19AoPNiXBLq5hR70dw9BgxO
         /fV4ytbkc+nb1uzZlgfpo9oPfPKOgmS641u76eXZ6mMV2sizib5kMTOhk8ng922W8qdl
         uMurGCjb+KWYhI075ik/+CWb6waf/6Ri3N9CewkZmGp1juQkppdMv08soxTFr7qERgk2
         dha6XmwrPu3IxztgAOD3xxkzzB/NpZZ8KFMFIYpNyohb3Q5L4Jk2+KmuhplEGpOnN1xR
         oxtnGcTeihp6S/3ReMvmm23gBNRO9nRvC8b4YV/qSnHLhkLOLeQWjIKoMaKc9YC2MMhl
         stmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2FPNTZ0LBeauhe2IRB3wKbW8uCrpmddfDCYByrAJvs=;
        fh=Y2GDEpbVdMaZwdxz6efcFZOSqy0BElhin2fAVCQWF4M=;
        b=cwrYshi1970yl67eUiaOdHfjgn4zHXzelYRcBpJ0aiOToQLZ79zxPj45yelFyrPDlc
         AIs9pGVaOPsARG9q/hl1M8kMQ18d0ipfDQPWOXPKDYFAN80cjPzZjJY2tqkyrd41sr7C
         5WyEvQIrq0d5gIpAUYZTV08065fIWgLwH6w1bHihtkoQAXw4bEoy2Qf0inJDPO/d2UeR
         whAGbztEbnlLzZlnvIarYXvnFND+N7SZhjbWHdXKiy3C32j7f5X9RkUujQgcUKUPNeHR
         9abcsCM3nOLPmaKbhOOoURWZYsPZsd8eeONncCbq0S9/9pi743fMrKz8LVAocpU2/hp0
         bS2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781426585; x=1782031385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2FPNTZ0LBeauhe2IRB3wKbW8uCrpmddfDCYByrAJvs=;
        b=jLRCYhWfM1JHvYe/Ht4jfpVTWwlayKc5IrAm7Vzv7wCVr6sk1HAZ6T+kltsYdXktRt
         Z6Utdu8wgOha/8CgrfA83K4StIFoxml+gjHOoiS7ndM3SaQoQRVlq4BRkhw7ihnKCHTF
         yOvtKPU4bsegVojq/I1qKKGZndfPPzBQYBwxELWC0AY2BhMJIQKt0e54CNZYv6SXMgdB
         ObvB9G7okM6tH5aOkK5JactqHHhmuXftNytyR4lYNhoPsX+3Pq6fBfDJOuO+XyVgjCxV
         jwXGMmqJKp3W5UET7/e7iNMBmAhqk18aNeT6sPoejyLvV02C77z5a8hHfqZdCnbgAqRn
         RlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781426586; x=1782031386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t2FPNTZ0LBeauhe2IRB3wKbW8uCrpmddfDCYByrAJvs=;
        b=QZitWtMOPqmBh9mJIlpSdNa4fKOZCRABGsdgh5iw0Lr943gKqqnq+00IU2YXlvi3N3
         IQGthFCq6r+jOMt/KGwbonspzwoxNAGKlrgPCFWOqBeEm5OhMP78zVwpKB4C51GLTDqs
         5yIKFchTmvXnHwQpvQgYWsCutoz2CaF05P1UOL/3f6/2MYTudITDd3HNJOWoCX+J/XS6
         a6EPCdGa+ROho8MAC8Rbinj2y6W5/5Mqlt8LgPtoFkG8W+lPi1by71vGDP+12thBdI33
         AvzpyYy+qL+pu1W41ASRoUJeFtG0GNR9KH29tRC5TakvxhgXGLYX3i8LlWtl5mMSSd97
         /rZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+R4FYpa8CVUF99CjUEvAdrZqOHRe72nFIyzBuIZZtu2xaATbjCpLpo3L0caeL+3SH7AEXLPet7WS6dNhYE@lists.linux.dev
X-Gm-Message-State: AOJu0YzgmQR66rLyI/leLtm3rbOOOLRBVRklWYCG45WXikybPG+OX2mT
	hHaKsAkrp6HK9NOcn19tnhD2OrXhDk/BK0LtUa5DZvo82+yTGcrYV3I/z5P4Kpl3bihjbES6AHt
	t6nmRBGQavnfkbIK4nASDkYxeX4IXI30=
X-Gm-Gg: Acq92OHLFLSIh9f4Q1axJgyIhlNDObQBWX1/JITzaVxASUFv+5ZwXiNi1mat+s5P8wV
	oBh7Zu/5sqq4tyCjhwO+j3geXvYgvya7bXHoM9B6fXxTNTxkPHEyQiwFPZB/55efKOWYLB4dP1j
	52D9hYkvS7/SJgnBI+oiBPOWSJRsRUlKp9u4oupAP+vIN90afFUQG6EukE39L3Z2p3VEcEYs6VT
	tsNwrwBw/p0ffXg1xciBgyfyqJmF6+K0eEGfN398IDnFmOnqYzk/jEP0LiU2dojxxC1y3aIBeZK
	5h28sjQW2w==
X-Received: by 2002:a05:6808:c40c:b0:486:5306:dd91 with SMTP id
 5614622812f47-4872dd9f493mr6250582b6e.7.1781426585618; Sun, 14 Jun 2026
 01:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com> <2026061419-bunkmate-cinch-b506@gregkh>
In-Reply-To: <2026061419-bunkmate-cinch-b506@gregkh>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 14 Jun 2026 11:42:54 +0300
X-Gm-Features: AVVi8CdUp7QjVsdE2N5IiYG6QwUSvi_854TvUVAKenslfGhwaHj6rgkG34WHdVE
Message-ID: <CANpqX3bBFfSFteX+_9snU1KjYQK0cZT9KnNa9XpsSOk-254gHw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: greybus: audio: check sscanf() result directly
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the review and the feedback.

On Sun, Jun 14, 2026 at 06:15:00AM +0000, Greg Kroah-Hartman wrote:
> When you say "also" that implies it should be a separate patch.

Understood. I will split these changes into a two-patch series in v3.

> lkp didn't report the smatch warning :(

My mistake. I will fix the Reported-by and Closes tags in the next
version to correctly reflect the source of the warning.

> No list of what changed from previous versions?

I apologize for missing that. I will make sure to include a proper
changelog below the '---' line for v3.

I will send the v3 patch series shortly.

Thanks,
Abdelnasser


On Sun, Jun 14, 2026 at 9:17=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jun 14, 2026 at 09:08:57AM +0300, abdelnasser hussein wrote:
> > Smatch warns:
> >
> >   drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
> >   warn: sscanf doesn't return error codes
> >
> > sscanf() returns the number of successfully matched input items, not a
> > negative error code. Compare the return value directly with the expecte=
d
> > number of conversions instead of storing it in ret as an error code.
> >
> > Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
> > widget id is validated earlier in the function, so the remaining branch
> > can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
> > about a potentially uninitialized variable.
>
> When you say "also" that implies it should be a separate patch.
>
> >
> > Reported-by: kernel test robot <lkp@intel.com>
>
> lkp didn't report the smatch warning :(
>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp=
@intel.com/
> >
> > Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
>
> No list of what changed from previous versions?
>
> thanks,
>
> greg k-h
