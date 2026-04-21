Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B939446D
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776794901; cv=pass; b=dgX5n3JniUrGVZs+O4Ix4QOR++UfzykJxe7wFb/xRFiAZotStXtNCTmjXBVtAovvnhS+GpcVcPE3KJvZdbhg8itKrIspnpjTtrz1g25gRYep9fReFeduUnA5CbRDnePniPpy8OAQ2o8e4AHRWvabUomlI1Mx5tKlWEoOx1zwKWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776794901; c=relaxed/simple;
	bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uraFJ7inNFl7+5HQDo+85M4H8GevJGEDeGARRvZGrH3NFsTyQE1BsuLIv891lxgi0l8CKayGCYBdj8FaM9ABbH5yrBBrECRDcJn7Ddwsa5qEa6tgq+TsUHZT4LSjooiPU5ar3hSYX/ryM9aF6OV7L1b/SAEwdPyHrBpSUiD2A7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFnebKuB; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFnebKuB"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so504286866b.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 11:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776794899; cv=none;
        d=google.com; s=arc-20240605;
        b=cuVP5mIN9cGO0i56GG9/ga/rfxiahUiHqiMb0fQIDyBbhm29pQ/XwHrYktuD/CRLGa
         UQM5pnzC4kBev862GNYPXOqgmiXI2jw12Ee/0lOw6HfKHZWcPwuSRQZ5iZ0JvjrBwzXA
         36oy8kZcoaQE0G/HUVhAxN1npSF54HB0I80BW3E6UMHi4Nnh+i7lomOOjNDOrTK4KkQK
         luRhE8hCt3+VatsZtwG+1tSmt/3b83nw27QxjLOSIlv4ZR5flkd38ye0vMuR2ZiGRYnC
         J37WS4yWHjx3p4UNBUZFiyTsOSh9XdwFLtNoeWcE8KfOz0Gt4E+71qYjPKonVU/Fp806
         OKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
        fh=FOBi/deCNJjeIYVQNY0KaiOIcG7PLkhYd80bmQR3Udg=;
        b=drxgUtrkvodsYqzhJiAuB7aPqmyZApH7lIjOcHQ9WLbBO2UvZu6iuCj4SXeuLyWehj
         X1G6y4Zb1e5DWoWZWgwqA0Gf8bgZ7PfTDLyN7QRz/QNT1TsW5hxHj7kVWKyq99J8EALS
         f1KeekdBjgHFbI4whIfljYVNz5sBsJ1GQQBL9F6StAtJ1rwe3iCN/vw3sw2KOsC6KKPS
         5RYo/LLnSE/+lFKDG174F/RXdiKtaLkYTNC6I70zUkUBSHeFMQWri65FVMljGBu9LI2Z
         9374JKWzmY/bGGJ4cGvx3Y6gJiKs6W6kyeYHqmq5L6Cy3Tqjc8AVLeUT2dZTDbo0v+a3
         aPtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776794899; x=1777399699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
        b=hFnebKuBYvGwhGLozGHklI9hlC4X1xfRCkdMVqccc4/Kteqd8wr1H28Geg6YZiFCqD
         sDuETxsROOq10DAVx0yYt04nKE1dCEbF331tREBBswAdDN4GC1bUroAL+h2MQbnBeq5h
         0vm+YjdTsqoN4N8SeYMtblV+vBdD8QIbCHsWM9z8xc1m7Z+wqrYpgC29XAjJGJHtJkH6
         wIGk3xUWCk+N1082VKsTUQykmKMhxitjcKXoTi7hepQ8KOBOUzw9Mpo6P5kVcNHsQ1Dv
         leNXKdCDsyTArkTj89+PC2CRnC1Yk8Vy6ffabvsmaBIZEApl3cj2vQNAM60EmL/tyriS
         AX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776794899; x=1777399699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ek1GauTOeUTfZm4I0HR5V6ZSK+6ijir9oGykKRevXQ4=;
        b=Zv9iWfC+25Q+RjfbzPSgkk9/fgYJ9mWudy08Wb10OgxOmW4AkaP5rezt+3Mtt2euQR
         SzNoziTuWGMIBZf+YkeXFQ5tA7RBd6nbdQlIvYuk6b3aH0qc+YPzcUah3pOBmUhBoRnj
         ek6lhN3eAMUNauJ+fMjse277aIdbyv15gc4vP5/+L+FDyv6wHL49pbklsRc4RgVaO3ZM
         z4RKZxbmfI4Emsam0Tf5d+zy83DGVUebY38xQHu6380poS/PrMSCVAeIhFDAxs4GOSWN
         w9CiEVCco3MS6XMJHMJui+Il78QzPc8QYqK7v45W7yigbjqpChCZIZynDlf79zxgUrlG
         GM8g==
X-Forwarded-Encrypted: i=1; AFNElJ/JUJnzcpKEcPfuLQuiFfuanBoNdV/KsNIUjc+JTkfkq0wEaIbNSndTUAe8DtR1XfxnrBFYlDpMD8t+5+Zu@lists.linux.dev
X-Gm-Message-State: AOJu0YxHj7Nc0r9wjM7UnhtL2DZ1PUQoCLi/HZHbplVeGtx1cdyvdx2y
	MHYClyzZQH6u2y2k+TrmOJRYdJjDLpX8WljUhixL04qPoBMrINZuUDWoRm9OdPMZUw1vNL+ulg7
	DuCWgUfMWgXSARJ7VsZYPeVBZ4IVA2Gw=
X-Gm-Gg: AeBDieugOpvheEPjq13V5E7bxYJ/XcBkR0lBLIU03kt9CH8VWQC7dpfRYuW33SQSD5N
	gx7Xs35A/3avFmYys4dnqfrcebac41GSdKy1zGVL9KAWbFZpp9KmzEmjCKCAv7Xtnt35vxiLJ97
	r/OZ1BlQM0dhpuM8JCDA9FhO5xG+QQWznk5SRQRa2YsKcYh2WBA73HcmHqA7RjdXJVtSuyZWNK5
	U4OHO/bg2cJw60coQOiqdNBcv9N4rbJxVDaMojDEEp/FyT/7xo2mKIXGktVZH61I/6k/8b5/wFE
	CmzpM5S+VP5C6WrJ9WrRItQ0xAKg8ODFmnaFr5knBRzvYgVWtpDy9xu4H6hITnIqy4jWwU5uU65
	Ff0DuW5ZpqbjBVTavdA==
X-Received: by 2002:a17:907:3f8d:b0:ba7:3d21:c137 with SMTP id
 a640c23a62f3a-ba73d31091dmr527575566b.17.1776794898316; Tue, 21 Apr 2026
 11:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com>
 <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com> <aeerOursgkNeoMQo@kekkonen.localdomain>
In-Reply-To: <aeerOursgkNeoMQo@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Apr 2026 21:07:41 +0300
X-Gm-Features: AQROBzAqxTIrCxCx8aizkHTcNkVcluVKd3UYhySBdWYgZD3G-w61LqAKuK729zk
Message-ID: <CAHp75VfVXGeKcuEewuRC0E7tXj5AokWHQLmzsSF+mVQjQ16KwQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pedro Pontes <pontescpedro@gmail.com>, hansg@kernel.org, gregkh@linuxfoundation.org, 
	mchehab@kernel.org, andy@kernel.org, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:52=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Apr 16, 2026 at 09:26:47PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 16, 2026 at 4:46=E2=80=AFPM Pedro Pontes <pontescpedro@gmai=
l.com> wrote:
> > >
> > > Convert manual kmalloc() multiplications to the modern kmalloc_objs()
> > > interface to improve type safety and prevent potential integer
> > > overflows.
> >
> > There is already a patch doing it in a slightly better way. Have you
> > followed the mailing list?
>
> I must have missed it, too. :-\

https://lore.kernel.org/all/CAHp75VcoNkEQs7QQLDg8xZjdouNc8Yc6Vjg+Pdqb7LViqS=
Kysg@mail.gmail.com/

> > Please, better to help with this driver is to subscribe to the mailing
> > list and review already
> > submitted ones.

--=20
With Best Regards,
Andy Shevchenko
