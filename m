Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99842264A9
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777798426; cv=pass; b=Xo+qWo+4Seb7SlOMyCBnA9Ko5Yi4cu2eV5X4MKHtyytB3dMIKtPSXKqq2L6gWZVcR4zYcGEEi8WmFW13i061DO9Bic+Jib5/nXuircXZ7jlKc/U2genf3WvBNIAS1/Ccdf32u/WsnSq5tT2iOUu+onNc+GQgcBTdBmd12Sg69YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777798426; c=relaxed/simple;
	bh=TN38G3GI/HX4MCUlFvl6FUE6KgcFjBtEqV/pHZDos5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2nKasBJcZFW1/CJbyQZTQtaGYBT/6jytIBYFdppLVponUd/O/0QvXl8AqxP3YyFZjqYlY0ios/xfXLISI8I0VOpbLsgk+8n1ehAPjswmI5+/o7CX5GLF49dn7E3WY0Pm5lrgkE/Bo4CQQVNMpuRdqpGn4TXajn9jxFcFGI4De8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHhqk7Yb; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHhqk7Yb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so25878145e9.1
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 01:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777798423; cv=none;
        d=google.com; s=arc-20240605;
        b=f5vEREhoxr8MNxpHVybNomHGhny+qscRgBQw0HY6h+rResRPMaXUYf4yQOHLHBzPUJ
         vrJrYs/Hvm6RsehcfbTYecw+SB7vLrW1fAJwH5NbVB8istoZwA3v5KzVs8aP/mbyFv8R
         Ge9rsunjQmpOQGjq5zPdRLgJkckBoRo9EdlOf1cEBx1XCNhIR5JrRBdmtO1HNSI1j4P1
         oTL242RGViY07UKkBljQvhMCq7/oG0Chcw0fmvXEAb2/8R4rbSIYKoRXcl6pEl3WDdRp
         n3CATNlvCjeY041NdarU+pgkfq4MdrMr2vdSzesXI8VJEY8kJGVRruUaoJjFhfbKDMU+
         nbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DuzbqSf46naLhH5+skcD+oKWabUFj8WqimsDijuWm78=;
        fh=JIITVe7PWE7XcbgyWq7MBVPx7a3erJf5KLA1ugOucvQ=;
        b=Mdegp8OlJJytPn2QUCEr3XBz/Hyb1BNd+X7Zo6q8hY+JKwD3UOCvSLpvTqEqNUxcxt
         FNh/okgUCshXlqm4pppEXaDBgGTohBPKlhqMT+xmQAnBzOlN7ozuAz3rHEeP5/yJq7Xz
         PGGuyIujkfMyVFnJHhokSHi7OW3aXhfTG5bmcRaTs6H0XTN7FcA3bKurr1GDYja7Puge
         Saq862It0yqZi86J4FPEMWot4UZX9GjffWsdsWhrCunNbAkaJbIFIlUeE3J3ZNPuLMZB
         N/5UcKpLA14TyNlFeAySWcmNxI8KbeqC/QywmsqihE44YeRXVtnE/XuZPQrrqh+Sy2v6
         /VUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777798423; x=1778403223; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DuzbqSf46naLhH5+skcD+oKWabUFj8WqimsDijuWm78=;
        b=OHhqk7Yb4clnd8M2TJlQJ8hUopmSIBCR0xi35Twiva/IohTwu7dwjMJuJBd4k1IZSx
         hIvg/h24F2nj4a4/tzhDwr+XyTXJWAU2m1zDfzZM2eI9T+OEKhfK6HAdU/4PNgvrbDp5
         AbRHle72fH2OQtn9KWXDK5cE6mJVSu0d+0P8qLBjYLVwqf/B8qSk8h4q9aurhZ/aBMxe
         jW21yR9MVjSKVmJesQRr7tJADiP72rkVV9tQh4QKB6GC9BmMzi5T9AGH1d43R09WhWiI
         v++ysOloUwNx4w7i5SuEXaXDMrTy8TDjJMKleB2cvm1Zn4W/kNDukEeKQ/tqKIjSwn91
         Hdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777798423; x=1778403223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuzbqSf46naLhH5+skcD+oKWabUFj8WqimsDijuWm78=;
        b=o7lERouS08kPCrY8OVG0h5GPN8/ZPo/RVV2OtKQawrlkPwqjwcl4w9XJ4XQ5UZO43p
         nz27nG8JZLNLjdWS3ZSyEm+6ja8fgGNO63tB7+VuJlIMRL4/xDMiP5fNGgkrjK+mJAbg
         XiJMkgybvWZZF0frZGziPYLa5HqWCT4h0MhkBHWUwUsjpM8+CZufAOHhF6q2rHpCjJF9
         QqzoGk5IAtd6uHkl8Macnv3mox/n1MNDiDkc/AXrbVYkAjGlVpUUCfjEJSeGNcpVKkBX
         JOnZAZ44zkR4ZZ13DP/Al0WLRJDiydEDIMl3sDcGYXtbAbOxQUs8MnfIFp9OQm/8XDUg
         RTuA==
X-Forwarded-Encrypted: i=1; AFNElJ8inD/U+Q1l+2GxB4Drub8feLYpNn/PrOGBlc/DQAeB/m9vHqxBoiFfE+l3WqDQ7+pXpLy9XthbicrxEdtf@lists.linux.dev
X-Gm-Message-State: AOJu0YxSELJsN0rlnXpaiswwqNgTI18ZmbFJsVzAn8KX/MFoUxs4jTSa
	MM1pFYXyeTi3cvxuJzJzM+hIgVVdn4k7gnOCcqlrpmgFWUsrIlQRY0UC3PwNdhDFZ7Fn0GtTmmK
	F7ELa995zA2m8UgjUDzTsbtAX60xFCae5vF/b
X-Gm-Gg: AeBDievxYF68l6FOFFQ9B/g4kozxyS7VwIHMQR15lzS5FVG7vRF8Dy9Pvl+5kEXFemC
	GBj/I1kc1WhGUDSyvjMtUBI1/CicAMmr8kghIxbPmXcchaDmq85ktorsOdDJKRXa10ILJK4He7E
	ns0QO39EYnNxmEjYuIiBA/xvJ5AYS93o0ImaiKXt4Agh1b9lO5xGhjR7vFrVUgw4/sIZh+3ucXG
	p0ZJ8vh0TlnA1ZwIFHqKNeLgypNT+f5SjcgPj06gaMzQpFhbJh/xj1gR9EQ5TVgH8PBS37dDmap
	FNO5IDOMDt5brPwZdIj6E6QLkOpthBPp75l/j0GfQEEYHzatRzGi6HB5F5XYuH1xFcU06yMuBHB
	UkJcvtlz4kjZEgNiGL1GX62v1R83TL3ne3D2RwFTyF7xUPNYPObssjzq1mObNk2/v4V4770zFij
	c3xDGRKhCFFXjDygkF6Qg/kNOIc6R9e2iibBeF0NZpWlW54rMA
X-Received: by 2002:a05:600c:3f06:b0:485:3abe:ab86 with SMTP id
 5b1f17b1804b1-48a9852cc0bmr90855945e9.4.1777798423150; Sun, 03 May 2026
 01:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260502021815.3953423-1-angusg778@gmail.com> <DI8GD8RZU94B.Q3VZJO6EIP3N@gmail.com>
In-Reply-To: <DI8GD8RZU94B.Q3VZJO6EIP3N@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 3 May 2026 10:53:31 +0200
X-Gm-Features: AVHnY4Kx_9zs4n__h8hqrjEXG6h1AeEpvFH-nAh2fqyqyHGXdzMFxFLYPbhHe_A
Message-ID: <CALoEA-xEv9T4tv5fOYEh8ts=3rGOQMsW1ZrHVBbK8TVPuFvGFA@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: ad9834: fix probe error handling and
 comment typo
To: Maxwell Doose <m32285159@gmail.com>
Cc: Angus Gardner <angusg778@gmail.com>, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, jic23@kernel.org, 
	lars@metafoo.de, Michael.Hennerich@analog.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 21:54, Maxwell Doose <m32285159@gmail.com> wrote:
>
> Hi Angus,
>
> On Fri May 1, 2026 at 9:18 PM CDT, Angus Gardner <angusg778@gmail.com> wrote:
> > Use dev_err_probe() for the master clock error path instead of open-coding
> > dev_err() + PTR_ERR(), consistent with the avdd regulator error path above
> > it and with the equivalent driver ad9832.c.

I found another dev_err() call in the same function, maybe change this one also?
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/staging/iio/frequency/ad9834.c#L452

> > Simplify the -ENOMEM return after devm_iio_device_alloc() to a direct
> > return rather than bouncing through a local variable.
> >
> > Fix a copy-paste typo in two comments that referred to 'AD9843' instead
> > of the correct chip name 'AD9834'.
> >
> > Signed-off-by: Angus Gardner <angusg778@gmail.com>
> > ---
> >  drivers/staging/iio/frequency/ad9834.c | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
> >
>
> Patch itself looks good but maybe rephrase subject to say "Use probe
> error handling and fix comment typo" instead? "Fix" seems a bit generic
> for my tastes, and we're not really fixing anything anyways.
>
> I'm not the final authority on naming so its at the discretion of
> either Andy or Jonathan, and maybe Greg. So either way,
> Reviewed-by: Maxwell Doose <m32285159@gmail.com>

You're mixing different logical changes into one patch, therefore it's
harder to review and harder to keep track of the changes after merging
(e.g. running git blame). Instead, you should have a series (named
something like "ad9834: driver cleanup") and three patches under it:
1. simplify -ENOMEM errno return
2. use dev_err_probe()
3. fix typos in comments

-- 
Kind regards

CJD
