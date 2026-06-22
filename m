Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E835B645
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782109345; cv=pass; b=QK4RdQkh54vRndgW13x0Tbal8n7jaBLsWJK423xe+ARjBa6pMurdMxJNg50T6iBF/eziGXZQwJEt2JB4UeWVbqPROYCP0odOMD7fqjbA5YZ2l81cpC14nllGi4ELb8FCqk+7JAuviNqTTM/Xe7mvTYn014KirffHIVbLNCrJ5bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782109345; c=relaxed/simple;
	bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DA0c8VVFCh5u2hrVVJMsV5jYFWKe4tQ6uW4wavLv2Y0zhvvkd55laGSmmP6m/DnmIy9NJX1ijkOlEnsHJ7KRmUxqcOr2ucagg2yFiEU7fNM+iID6Nkh24QsdUhxxI6D47BkF9DtJYVdBkOKb1+IjPn4pYPpcbNjxiHH5zG7Bcso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSXdTl/q; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSXdTl/q"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69764612e55so3847140a12.3
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 23:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782109342; cv=none;
        d=google.com; s=arc-20240605;
        b=K7WmT/fM6EdtGfpgHIJwR9P8Ob0XE2PNfooZZzBzPN/ISRQEefYykDtPh7HHV1mZKJ
         ayGXa3cK0/hAOvWcZwpKsMcvZDKAJvdsOkfUiZqXe6LnBqOFMWrUhqwBzjaFrXE7IWth
         x0WUYh2tl8RRJaSxnBHJG5Sa6AB5c4Or640j8xuCA8Z9RGnrmnU58PihDIgo572y37cJ
         3cB7k+S5TVele9/tlsPapwu23AuG/PtmemcQt25wFDmYJA6MwgGKF7CJcxWY6jKtCiU/
         m42R4xFbNXqRYuo40ca2qdkStzYEzGWwJOEx6UnUUtriO7qkhR1QxFG/lHK4wLrYuADI
         cbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
        fh=2qCocYxbmxy8aS5wBSHMAPjcpGScTI2gjQEamp09Z7Y=;
        b=W+PFgCz8dUvZnDJuH3CFr/9PFywoxkfH9cWAqJX6vCzTX4K1D/dcI5ovb0kj251a6c
         kbpKdKEGxgkUl3kehCJpWyTrLZUG6D+28oW/LcGLgg95G1LW1mWeBpdKP8qMGg29je9o
         21oO2Cltr2iKV5Hi5MglK4I3xfaDBCoIPzzpKtkPudqq2I/HYiuKO+VWtqNHD1uRHZmY
         ev24IR/d4YPjSibNo5jKOa0ZRR7MG2VZkCtsJ0aumXhFRxp7VOtS7tfV3iWfk+tPlJP4
         jGRZEyI9uYtANE3xE4jfx2IhW1K/puHiwx85nTXE1HnNzIeUKOWFugg/9p/zutoaFO8W
         QHYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782109342; x=1782714142; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
        b=JSXdTl/quaWRsFUrJfK5xrY/PCKOJUucGUuvGpqvbWObR1H+kUn5YNgXBlHz222nUm
         nLrFBt8gdrKIlJ//U2OfQdJSeu408R/vUxp91lvnpNSE6TvMUirbhYAKuXckbho4ddbt
         jGHBb0CpSpldRci6q5j5ziMSvxV7qpkxNIK4G2nSl5IDWBcXBmfMZs4ESRN1oERsbMje
         wbHlq10681ns0UqKlZ3f1CKsXZzvA64B8V+VQJW0dHnxW5F2KGz3j8UFJeNAvUHXE9sR
         69F956IVhTVGPVpFIC8OhVBeKM2x8TIqmaLj1XvNJtqe2D+1Z//sMUWUrVcT9Quj3x+i
         79Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782109342; x=1782714142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFtLe7bHlDNyqiN9o7mOWwbiL0VxRTwL1H2qBgvovpU=;
        b=dZawGjMqch6TyN8uskuMcZ2ljmGPQyTSiF5yMNjG68iU2FtXtVnPkx+9XDRf9lf0kX
         fFcKVDnAJ9Hv/5ZtoyTwnZocGblzoGKCOi3XAqw+MsAyVF86WEqNhS7+cXUxSnAqa92t
         Sz/ZASQCNcuEycLCk4yxVMS+a1t+PykdDOtGev2jAN79YR5C8mtiVl7O8xUmJcw3b0Lm
         Mo/P45+7/waB8nRwmGm1AYBRi3BkDPFnAmw/7Mao71gZsIYXgkPJ2rNq7SzUEbyUezFG
         Hyr3jZopMa8R/TqiUkrts1beg3OQSGxIV/YC8+UXC2HsfJkQgz101lMunZx76sc6OSHe
         zyug==
X-Forwarded-Encrypted: i=1; AFNElJ8UuDbzaryh5nvy3ftjQekmQp+BkXQ9Xhv94yK9ySVCXywTxJf17xq6Fjc3CYqc7lNHrKhQqaBjRmGLSbGv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq7WF0pP6I/tXa92QgoWi9t4aktxaf2l/L4DNbvbyY8f4rXCSl
	Id5mB3ogHg8q2oKTie9Z7XCJFqxG1VMHCqt2fcVjN6yzZ0h6iYfjrIu0RJXMld9UflqIIbkA+mr
	A/idcNFmO7kcYbVBT0cP0ccdM00JdZD4iPPrAGxU=
X-Gm-Gg: AfdE7cmbRlXthCXE5+XN5I1gyYc4muB8ZBAVwniV4Kx9VAGYfC0GQtpZJD664AgWUpC
	1Q9olBi+pQ8hbM5g8I8eIW5NHrrwjCfiW54ygc8Hx/oCINCvHCMTtwsf0vx+xOLM//eh3/O002y
	0bQr7ulVjzeM0EwnTnb8DhRofsqhI7eFyYufqnINv00R7c7Kesm+Wu4O/Q4k4+0xpMrDjcX/UnH
	7cGrShumilelXr6TZopTGMMN3CeXvROoWAyLuboEQ3ZUaPETrmqysxXJd+w+i46rOjsYShGKhkf
	trt5PcoIWXvZ1ULix6awbi5bdqU8CDfqWU0p0g==
X-Received: by 2002:a17:906:ef0a:b0:bfe:ed35:e85d with SMTP id
 a640c23a62f3a-c098f33f303mr589087666b.53.1782109342002; Sun, 21 Jun 2026
 23:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621085209.52651-1-adi25charis@gmail.com> <20260621094312.53655-1-adi25charis@gmail.com>
 <548d66ce-d01e-4c6a-a77e-7d61378a1c74@kernel.org> <CAKt_FXsiXv7dai+F7cT=GNvETa5_42su9G1ev8+_fph0Bg5EbA@mail.gmail.com>
 <37006444-95a7-41f1-a5a3-58d116c10c14@kernel.org>
In-Reply-To: <37006444-95a7-41f1-a5a3-58d116c10c14@kernel.org>
From: Aditya Chari S <adi25charis@gmail.com>
Date: Mon, 22 Jun 2026 11:52:10 +0530
X-Gm-Features: AVVi8CdDWH2N71lg_P-oMu90jHTjmjLYatrFS5MA4jG1EpXkKA4hwiirjhgvaE0
Message-ID: <CAKt_FXvjHshej+BG+CQQbdQ68+RE3pKns8Xq5dKCZKH0uioK3w@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: jacobsfeder@gmail.com, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	michal.simek@amd.com, lucas.fariamo08@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026, Krzysztof Kozlowski wrote:
> The main point is that driver is in staging, so we don't take bindings
> for it.

Understood, thanks for clarifying.

Regards,
Aditya


On Mon, Jun 22, 2026 at 10:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 22/06/2026 06:21, Aditya Chari S wrote:
> > Sorry about the pace - jumped from automated lint feedback straight to
> > a new version without waiting for an actual reviewer. Won't happen
> > again.
> >
> > On the staging binding question - I found the driver-removal thread
> > from June 2 and read through it. Michal Simek's reply makes clear this
> > driver isn't going anywhere (their networking team has plans that
> > depend on it), and that there's already an in-flight binding
> > conversion from Lucas Faria Mendes that he's actively tracking. I
> > wasn't aware of that series when I started this.
> >
> > Given that, I'll withdraw mine rather than duplicate work that's
> > already further along and already has the relevant maintainer's eyes
> > on it.
> >
>
> The main point is that driver is in staging, so we don't take bindings
> for it.
>
> Best regards,
> Krzysztof
