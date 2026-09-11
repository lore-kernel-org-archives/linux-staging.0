Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3947CC80
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132908; cv=pass; b=EhBbecZFLcqZClZ76/b2qqJdPmjFE7xpwuHhNLwCw7szJfPpgyXiFM6lkYr7UoTGlHNymtnRjfM5U/o52qBBryp3ID7s3cNpNTATOgSLTKMPD9huAjeJnqSRSkz8Nb6MjoM2heWdRdMY4FdH6XbqydAU7Ht8gLw/wKN7dQ0NCk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132908; c=relaxed/simple;
	bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQUneO0ax1qArREUbFOhhYB1MqMF/hZANTBponGNGR0OFwoO7oe/LO2Q3uFaugg0E0gSMFQDMydBGEs3PjUxGwm4MfCjQJUvpgjvZ0tWmmo2Ly6O6eEaamH9LwnF2JNbzUb+DyuBLQoYbr3QHaC2JjdPR5GQhpCrShpHFKBrhr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svF8ivvD; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svF8ivvD"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4765ce0573eso581524fac.0
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 06:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789132905; cv=none;
        d=google.com; s=arc-20260327;
        b=g12LBVQxkvjyKsM0+/a6joyxxml7HZYU9Z0eZAxADlaTRy/RN8wzeHXwwm2I9P/UCL
         AugwevCKWbEJF6vBPqtJ5qXfUNWM6hqQ9VMhKxJrG4kKo/j7+h3mVHa7bAseB+QzoeNn
         oGfRlZs6HEGXiVlbGtIIHRwzKfxApDSNid6ABAzj9kGfj56BNsxe/PWmUN/VT9ipQyD5
         YqSSsa0L+PREplZwmHnFTi1dLolBDjim0Rp5jAL/K9ughjhwqoby7ClegtSFK7wKtLfP
         UsX1VfT6L1kLzhbkBpBrY1h95ubMYJJ4A+QT+GC6GqwITzfn6zOeWO67cO/ouJGUXb8y
         LumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
        fh=fWH+muhwFs6vx3iye76YkaCK5XVZNcdnAI5RP9Socrs=;
        b=erOJwJM+utE6Au1zDmkmk7kvFajDscOyD9Ilv+NyQVZpeb+/It0GxYYiSs2Yu3pGlI
         OpAzNVGkqtJenjCsNc9KDl2PMNCYw10PtbTCrH1AI6aAdgKSyZ2KuXUfaZdFaEubf70l
         TivrF0fS948riHHuhcXFHXjQjNPAWNZUq/y/6Hl+XKOjWS//qR5zzef/NjQ1tLRsPNI4
         woQEMkeWjAusHgqvq/mAohuye5R790CKeN8tKe0gq9XojSS/nkuNVfxFg7eNFEUMDlMg
         QVwG7TvtjCgu74LtP9ANMWhaePsqVbkzvMFwvhs4gJvT2DuQ2Aah9kFWitgGSS8s+lnH
         f+hA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789132905; x=1789737705; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
        b=svF8ivvDtb4muIEiCn9fKOeiihLzXzmpsWfirOKaeTQengPmS0yNawF89WpccRVBmb
         dKT7EIh/eXPkZSP/BRXWEccx5frtqiO+AwN+UEFMfMSvhhDamqzqi7gvpBIi+fSKah0T
         zILXGNMZOqOD9M0T614oreudk1EO/QTV/biUX0DRXzUn0jlJyf1e+MRFY8KMFI0af2gO
         tNBMVBiVdn1ZYVNZoMtP/cTuvwTokTERrJSXLNX5Hlh7j1gYNeywDs8mlkqXqp0fTA5L
         WHisKP6oIUbH+Uc81gTm4sdUamtnEXVo7E58HGv0B3kWGiUeHm9dFT9uVW+DgPTwYzK2
         OuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132905; x=1789737705;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5GSzj0e9Yb2VMZ3KqK3B/p1FAZi4+1j3IUEAn1TPPbE=;
        b=VNB+Cc8Re1R5nFagECIWvzttIrgESVKrlGNgySemR/po3mn39+n5eqaSLhEr2ck3L3
         6MsASj0G/LxBO62m9QRD0fxpSyeKqNbTjkyjiu8qexDA50JAKzEsNtn5mFott8G03VZt
         /8qCpnck7TjSGlyITKZ1vQUcxK0UJo2g7mQsC3HExMTDaKi+G/oUifjr5WVMT/jl9YCh
         zYiCC3Gjv2YMGe4PCK4YYLGTsBC0VDcWmAbFbgWiNE+7DyjLl29o7c5g/PyurTTs880z
         iGnrHROBqFfo+HFNJejMhxDs/On4n+9WgO0UC4UcT0HIj40KH2QtdzzXgLIgQ4JTtef2
         xH2w==
X-Forwarded-Encrypted: i=1; AKwUvBy6Ofg9cstXSrlDI0VMV6om2BXhvKHYsOkDFKfJoEDXq5adJWzR0AUbAHscaqaZ28MIU4xjqNqBVQzjaW8F@lists.linux.dev
X-Gm-Message-State: AFuF++lvQiTgVIADniPz753hDHYZGg3pyvvgz87xdQVJQ58lRu07lycb
	2BC694+SskoJltwI09WTObBUUti+giKS+gRg1DeGj2Y4aDl8LhqiJ2kgaiML0yFl7D0SAbXZuOu
	hD7vRA7PUX4s1PlMiLGlrKOB0AgeIxq4=
X-Gm-Gg: AYBFou2LSnJny07R0HaXt8AEDy1gJ1D3msYWUlhm2eLgldbKPLdZLggr9pHlLzbgQl+
	0jsYBmw1mHrzsspbkPtq1XlXQsso5GnkjH54tgUvAaMTxCxXPFgnZurMYh6bWlEG4ou03m13r44
	DZ4n6r9qNnBz1iahIDPMiA4Lzi+SPCr6Yqmm9RvanWQbGQGUQ3rIEpX1KtHpQjworto4awaHsCF
	lcWr8DhEYhPJ+LUPgyL04C9wZMgkPUvMWIQtXI7kziYdncFbka5q8ma82Mq6Dr5i4jbLO0J35/R
	MbzgDN8Ljf4qgytrFSGFkidB6VHAAU8zTATMc2JC0h7Xp7BAlXsImCQeHYOqn/TCGUk=
X-Received: by 2002:a05:6871:4082:b0:479:a30d:60e5 with SMTP id
 586e51a60fabf-47deb6b21a2mr3169202fac.37.1789132905351; Fri, 11 Sep 2026
 06:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
 <20260911110456.24873-2-abdelnasserhussein11@gmail.com> <20260911131834.0000514b@gmail.com>
In-Reply-To: <20260911131834.0000514b@gmail.com>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Fri, 11 Sep 2026 16:21:33 +0300
X-Gm-Features: AcwNN1V6XBqz-WHyitn1RiLjHTKAlPQpxveccB8dqCvxZHDUYuXYYdrHvshVrYM
Message-ID: <CANpqX3YjCJCmvp98iymexGLvL0zLXvM_M1F1YypbMCUQA0BM-g@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] staging: iio: adc: ad7816: Serialize SPI read operations
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

Thank you very much for your continuous guidance and patience with my
patches. I truly appreciate your feedback.

You are completely right. I mistakenly thought I could clean up and
sort the headers alongside the mutex addition without needing to
isolate it in a separate patch. I also apologize for letting the
`sizeof(buf)` change slip into the mutex patch.

I will prepare a v6 series shortly where I will:
1. Add a separate precursor patch solely for sorting and cleaning up
the headers.
2. Keep the mutex patch strictly focused on serializing the read
operations (adding only <linux/mutex.h> and <linux/cleanup.h>).
3. Move the `sizeof()` argument change to the DMA buffer patch where
it logically belongs.

Thanks again for pointing these out.

Best regards,
Abdelnasser
