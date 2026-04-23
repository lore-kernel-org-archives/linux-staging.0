Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350D30C61F
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953249; cv=pass; b=m11ARsYJF08CHt8O+CDh/SznpGGD7SfEF1zE5fL/p3RRt5q1m5XOeDlMoo/YzO41vIMpjpl+9KFIc5UTan94l5ynGE1sGH+oY5fGPAjLAeQc2dzAP6Bn8Rbb7qkm764pa7f3WdC8cX4a3OQWYC/anBRRrQefoG1D+bjUsPKzmQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953249; c=relaxed/simple;
	bh=vdEgnQ7UYncJPIweIDG0txiZ1qkftEmzo9ZKETJ59o0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRwfPKhsWXYfFiJ3zSZ/K0Q+TDaLAxKE8HPUWoDHNnwrXDprStjzeYNp+g33FfaATefyI7/lcTvaBWu+jYaS7zVFic7ft2XuEhlMYIDpIZ9atoLJPArY6AO6c4o3/ADq5D0C+8NB7YRdhXw/shmRAb8qbyjkDqoXnrgmXYbssyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRlt2c0K; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRlt2c0K"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8acb856a674so80285736d6.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 07:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776953247; cv=none;
        d=google.com; s=arc-20240605;
        b=JRUikZyfOCft3/gt4IDivMEIDMZNveSoeEAAj354UGZa1iQHLgDtzIxEzRCUVGp0Eg
         UNLo9kLyLlUF/D432043h0j6c4boVv3ZFMXoTmOKUxUWNDmsIclRSyG88m6Swz5vDeDH
         YTjjb9zCXEKWJ9kGYqaGCzhf8y2IQKFqLpx1+/n+rb41+WZOabSu9lzQ2eaD1sD/jD/T
         bNFX0nJWiufHJ9LwFJeGY2CrNUOSu46c0wDD7bdrq49qojyTqZ7sffz8TlwvHVWtI9Tu
         /YYCymmcgGVGeHm3s3Umbe1sWb2wkSr1pgsBD0Ovg+Nz/fNpoBUpaxoCs24iz2ZW7/fc
         RwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YnWvO7yjwrQhs9Z8T4RkhOyGwxBUSEXUTTKsZ/p4eKo=;
        fh=7nzkrdDkxI97kMG58ab8JCw7brG/90GYejxJkb+Hvcs=;
        b=VeOHp5iqFYBs3Gr/TLRq0viVK0QaQ12Vshs24yvY15uIgkxtepH6e+5esWF7Io1hph
         iTbJqKe/ab7Jf1dSPe+AGyOhT3Lu0c1uq54ZT3CYwDj9MzA4AoLKmv+NMnTXzbIX4mH0
         bPAFmY7Kt5PAtVYTrHY6R2KEgmaA4ZOOWuhLKULaWU4FbluIDy/B1ySqKLw+MAQBfsCG
         11ciJs4/v1Megwl6p0IWjhvPEg2kufJH+/UA2FURqKQaWrInshuhPT/R1N4UQfhc8SGL
         ucS9gzEvdJCb6Bs03Ev9aMDLFHltMHGij/wGBmHbVpOFiebOIOtv9zXoWfpIGXVgxURK
         Juww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776953247; x=1777558047; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YnWvO7yjwrQhs9Z8T4RkhOyGwxBUSEXUTTKsZ/p4eKo=;
        b=CRlt2c0KbgP+mzpPGWd7zkH/JYpFvjkPa/6JFRJowNlpo0rSx3/ZfMRpUFA7/18NWC
         7mYnWy/G3cZJdEsFDvdiFyG6wFYJ1/ba0ji2XMgdutQb0dOHNZqugiDmdbW12VCyDTsW
         lGUE6uKUM6sb0RgEAsD1UMPL0KaYpbOJVZ+E3Rew9YWKroiNAa0O+Nzhr3Jbv3e87i0m
         vpC0vfMaF0VurVGFViuY0hgMPH6rrX3+FoK5w6jzpVgmGB0WJsCxjyHu/m7UGkG2PzAc
         NB++8nuhQzQ50cR4hlDUTQn+ywWNr4R3s2APM+QmpkoDSgjHQQabvC771OVIckLB6nzK
         kUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953247; x=1777558047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnWvO7yjwrQhs9Z8T4RkhOyGwxBUSEXUTTKsZ/p4eKo=;
        b=UvDa3CTkJyzrTvcmAKzucg5IReCYRwNnFa1knBhE+SHb+fSZuS58+ruoEEMVd0Vvgt
         q5d6xUD/GLfTrGaU3jTYaR4d+N6SJ3dLDglU2ynbdQDmXvXAsCna8g7J3DqQJNB3ooju
         9YnaQHQwV2yktp9+7TPS89+EA6umqfw7rZxBoBsy1hGKq60obyh/6QLpWWeqteYr0/WR
         I2Ul3A9y5kOkjhFooPkCyRh09pe3qGzKomY+gLdKzm8coHXzbEfV15Z/i0ziNyBWIehq
         0Wc8nTTnuiwM7HqlZvcrcX0aoubVQFDKCsZvt0xUoNR4he4S1kiHZHGSSy+iNDZfD4fA
         A+JQ==
X-Forwarded-Encrypted: i=1; AFNElJ9z7bfbp5MSgdMTYKUxm88zrutHihqe6EFFdTSrbt2TzCPm8MPPva8NG7EIPGHZBNg8Vnc9gBsUldYvaiZr@lists.linux.dev
X-Gm-Message-State: AOJu0YwlCUj1NinyxTPN/DswtYOO4/bV/XafX3z9bdQ3KxwkA1BANoVx
	vDrpY0/MTtuwM+gRUwD3Feomoxh4DamcPQbkZLYhGj7nWROoTn1aBzHMukWubu3o0cpSwgM7BHr
	PDygsZct8JkU6F2QZBE+5KuaTFF86tWE=
X-Gm-Gg: AeBDiesKWrjPKqnDM4z6WCHIoklS6U7K3TXSift2GachS/xIvEpExYYLiNToSx4MtW2
	AaFxakxN9RsyVWTdO2E/f9YmAPnFdeRPGb7BJsYs2pCd95+32hQiWabP5k5O782EXdG7+Az4eMN
	AheivEnm1Fzg7cAJmWZXTVVvac1mCEeRN8hnDptPHlYIStlQQqKdCW8BrK+t3Ve2RfzWjzufubU
	ikAZzMOwoDgRMSVkMHDxxCMnAQvN5HaCe9Fb1jecjodjITAfF3yIZHRanTwO1JpGGwXQR9A2145
	N4d5S0Sji4MI1w==
X-Received: by 2002:a05:6214:5505:b0:89c:cb57:6227 with SMTP id
 6a1803df08f44-8b028565f9fmr389605626d6.12.1776953247144; Thu, 23 Apr 2026
 07:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260219171310.118170-1-aha310510@gmail.com> <2026042355-blighted-chewing-5e50@gregkh>
 <CAO9qdTE0NhB58hqK8_1=69bD7uG_vF-FfpQXGR8dqcuWV4H2Mw@mail.gmail.com> <2026042327-wackiness-purify-09c2@gregkh>
In-Reply-To: <2026042327-wackiness-purify-09c2@gregkh>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 23 Apr 2026 23:07:14 +0900
X-Gm-Features: AQROBzCIjy63kF1LW75_LGFH4-N7i7woPyvD8ToIg_JgdzxbdpkrD0vUqxkoZkY
Message-ID: <CAO9qdTGQPoMdh6ds6LFWEDtPSnjWEM746mrpfaVfxi8LBtckwQ@mail.gmail.com>
Subject: Re: [PATCH 5.10.y 00/15] timers: Provide timer_shutdown[_sync]()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, tglx@linutronix.de, Julia.Lawall@inria.fr, 
	akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, 
	peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, 
	viresh.kumar@linaro.org, zouyipeng@huawei.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > Ugh, I got the following build error for this series:
> > > ../drivers/misc/sgi-xp/xpc_partition.c: In function 'xpc_partition_disengaged':
> > > ../drivers/misc/sgi-xp/xpc_partition.c:294:25: error: implicit declaration of function 'del_singleshot_timer_sync' [-Werror=implicit-function-declaration]
> > >   294 |                         del_singleshot_timer_sync(&part->disengage_timer);
> > >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> >
> > Oh dear. This issue occurred because commit 997754f114ef ("misc/sgi-xp:
> > Replace in_interrupt() usage") was merged into version 5.11-rc1 and was
> > therefore not backported to 5.10.y.
> >
> > Since this is a simple fix that only requires adding this commit to this
> > patch series, I will quickly write and send you the v2 patch.
> >
> > https://lore.kernel.org/all/20201119103151.ppo45mj53ulbxjx4@linutronix.de/
> >
> > >
> > > Don't know what happened, but I'll go and drop them all now.
> > >
> > > Do you _REALLY_ need these in the 5.10.y kernel?  Who is going to use
> > > them?
> > >
> >
> > You might think it is unnecessary, but I have seen bug patches related to
> > timer_shutdown[_sync]() being backported after I backported it, and I
> > believe it is well worth backporting if this feature allows various
> > bug-fixing patches to be backported smoothly.
>
> So you don't have a specific issue you are hitting with this patch set
> that you want to have it here for?  It can't be for android devices, as
> this patch series will be reverted from that tree, just like it was for
> the 5.15.y Android trees, so what systems require it?
>

I am not backporting because it is absolutely necessary for Android or a
specific system.

https://lore.kernel.org/all/20251007155808.438441-1-aha310510@gmail.com/T/#u

I simply started this in the hope that the same problem will not recur, as
I had to write a separate patch a few months ago when I backported a bug
fix patch I had written because the feature was missing.

> thanks,
>
> greg k-h

Regards,
Jeongjun Park
